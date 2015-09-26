package com.spruds.meteo.utils.daemon;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;
import java.security.AccessControlException;
import org.apache.log4j.Logger;

public abstract class AbstractDaemon {
    private Logger log = Logger.getLogger(AbstractDaemon.class);

    private static final String LOCK_FILENAME = ".lock";
    private int SHUTDOWN_PORT = 10200;
    private int NETWORK_TIMEOUT = 1000 * 10;
    private String SHUTDOWN_COMMAND = "shutdown";
    boolean shutdownStarted = false;

    public abstract void shutdown();

    private synchronized boolean isShutdownStarted() {
        return shutdownStarted;
    }

    private synchronized void setIsShutdownStarted(boolean shutdownStarted) {
        this.shutdownStarted = shutdownStarted;
    }

    public class ShutdownListener implements Runnable {
        private ServerSocket serverSocket;

        public void run() {
            try {
                await();
            }
            catch(IOException ex) {
                String message = "could not initialize ShutdownListener";
                log.warn(message, ex);
                throw new RuntimeException(message, ex);
            }
        }

        private void await() throws IOException {
            serverSocket =
                new ServerSocket(SHUTDOWN_PORT);

            while (isShutdownStarted() == false) {
                try {
                    new ClientHandler().handle(serverSocket.accept());
                }
                catch(IOException ignored) {}
            }

            stopAwait();
        }

        public void stopAwait() {
            try {
                if (serverSocket != null)
                    serverSocket.close();
            } catch (IOException ignore) {}
            serverSocket = null;
        }
    }

    class ClientHandler {
        public void handle(final Socket socket) {
            new Thread(
                new Runnable () {
                    public void run() {
                        InputStream stream = null;
                        PrintWriter out = null;
                        BufferedReader input = null;
                        try {
                            socket.setSoTimeout(NETWORK_TIMEOUT);
                            input = new BufferedReader((new InputStreamReader(socket.getInputStream())));
                            stream = socket.getInputStream();
                            out = new PrintWriter(socket.getOutputStream(), true);
                        } catch (AccessControlException ace) {
                            log.warn("AccessControlException: " + ace.getMessage(), ace);
                            return;
                        } catch (IOException ex) {
                            log.warn("IOException: ", ex);
                            return;
                        }

                        out.write("enter the command to shutdown the daemon:\n");
                        out.write("> ");
                        out.flush();

                        // Read a set of characters from the socket
                        String command = null;
                        try {
                            command = input.readLine();
                        }
                        catch(IOException ex){
                            log.warn(ex);
                        }

                        log.debug("recieved command [" + command + "] from ["
                                +socket.getRemoteSocketAddress() + "].");

                        // Match against our command string
                        if (command != null) {
                            if(command.toString().equals(SHUTDOWN_COMMAND)) {
                                String message = "shutdown command recieved";
                                out.write(message + "\n");
                                out.flush();

                                log.debug(message);
                                setIsShutdownStarted(true);
                                shutdown();
                                return;
                            }
                        } else {
                            String message = "invalid command";
                            out.write(message + "\n");
                            out.flush();
                        }

                        // Close the socket now that we are done with it
                        try {
                            log.debug("closing the socket now that we are done with it...");
                            socket.close();
                        } catch (IOException e) {
                            log.warn("exception in closing socket..", e);
                        }
                    }
                }, "ClientHandler-" + socket.getRemoteSocketAddress()
            ).start();
        }
    }

    protected void checkForMultipleInstances() {
        if(isLocked()) {
            String message = "Only one instance of the program can be started at a time.";
            throw new RuntimeException(message);
        }

        try {
            obtainLock();
        }
        catch(IOException ex) {
            String message = "could not obtain lock";
            throw new RuntimeException(message, ex);
        }
    }

    protected void obtainLock() throws IOException {
        File lockFile = new File(LOCK_FILENAME);
        if(!lockFile.exists()) {
            lockFile.createNewFile();
            lockFile.deleteOnExit();
        }
    }

    protected boolean isLocked() {
        return new File(LOCK_FILENAME).exists();
    }
}
package com.spruds.meteo.utils.daemon;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.Socket;
import java.net.UnknownHostException;
import org.apache.log4j.Logger;

public class Shutdown {
    private Logger log = Logger.getLogger(Shutdown.class);
    private int SHUTDOWN_PORT = 10200;
    private String SHUTDOWN_COMMAND = "shutdown";


    public void shutdown() {
        Socket socket = null;
        PrintWriter out = null;
        try {
            socket = new Socket("localhost", SHUTDOWN_PORT);
            out = new PrintWriter(socket.getOutputStream(), true);
        } catch (UnknownHostException e) {
            log.error("Unknown address: localhost.");
            return;
        } catch (IOException e) {
            log.error("Couldn't connect to: localhost.");
            return;
        }

        out.write(SHUTDOWN_COMMAND+"\n");
        out.flush();
        log.debug("Shutdown command issued:"+ SHUTDOWN_COMMAND);

        if(socket != null) {
            try {
                socket.close();
            }
            catch(IOException ignored){}
        }
    }

    public static void main(String[] args) {
        new Shutdown().shutdown();
    }
 }
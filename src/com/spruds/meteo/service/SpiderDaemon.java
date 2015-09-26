package com.spruds.meteo.service;

import com.spruds.meteo.utils.daemon.AbstractDaemon;
import com.spruds.meteo.utils.daemon.AbstractDaemon.ShutdownListener;
import org.apache.log4j.Logger;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class SpiderDaemon extends AbstractDaemon {
    private Logger log = Logger.getLogger(SpiderDaemon.class);
    private ClassPathXmlApplicationContext  ctx;
    private ShutdownListener shutdownListener;

    /**
     * This method performs data transfer from Netline to Amadeus.
     */
    public static void main(String[] args) {
        new SpiderDaemon().process();
    }

    public void process() {
        checkForMultipleInstances();

        // start spring context
        ctx = new ClassPathXmlApplicationContext("applicationContext.xml");

        // start shutdown listener
        shutdownListener = new ShutdownListener();
        new Thread(shutdownListener).start();
        log.info("startup complete");
    }

    public synchronized void shutdown() {
        try {
            if(ctx != null) {
                ctx.close();
            }
        }
        catch(Exception ignored){}
        try {
            if(shutdownListener != null) {
                shutdownListener.stopAwait();
            }
        }
        catch(Exception ignored){}

        Runtime.getRuntime().addShutdownHook(new Thread() {
           @Override
           public void run() {
                log.info("shutdown complete");
           }
        });
    }
}
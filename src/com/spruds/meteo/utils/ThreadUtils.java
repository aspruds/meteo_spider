package com.spruds.meteo.utils;

public class ThreadUtils {
    public static void sleep(int milliseconds) {
        try {
            Thread.sleep(milliseconds);
        }
        catch(InterruptedException ignored) {}
    }
}

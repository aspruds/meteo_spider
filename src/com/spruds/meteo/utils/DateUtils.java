/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.spruds.meteo.utils;

import java.util.Date;

/**
 *
 * @author andris
 */
public class DateUtils {
    public static long getAgeInMinutes(Date date) {
        Date now = new Date();
        long minutes = Math.abs(now.getTime() - date.getTime()) / (60 * 1000);
        return minutes;
    }
}

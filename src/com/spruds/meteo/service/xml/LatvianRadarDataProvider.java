/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.spruds.meteo.service.xml;

import com.spruds.meteo.model.RadarReading;
import com.spruds.meteo.model.SourceType;
import com.spruds.meteo.utils.HttpManager;
import java.io.IOException;
import java.util.Date;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.util.EntityUtils;

/**
 *
 * @author andris
 */
public class LatvianRadarDataProvider {
    private static final String RADAR_URL = "http://www.meteo.lv/OPSIS/radars/radars.png";
    private HttpManager httpManager;

    public RadarReading getCurrentReading() {
        RadarReading reading = new RadarReading();
        
        try {
            byte[] radarImage = getRadarImage();
            reading.setImageBytes(radarImage);

            reading.setDateObtained(new Date());
            reading.setSource(SourceType.METEO_LV);
        }
        catch(Exception ex) {
            String message = "could not fetch radar reading";
            throw new RuntimeException(message, ex);
        }
        return reading;
    }

    private byte[] getRadarImage() throws IOException {
        HttpGet request = new HttpGet(RADAR_URL);
        HttpResponse response = httpManager.execute(request);
        
        int statusCode = response.getStatusLine().getStatusCode();
        if(statusCode == 200) {
            return EntityUtils.toByteArray(response.getEntity());
        }
        else {
            String message = "invalid status code: " + statusCode;
            throw new IOException(message);
        }
    }


    public void setHttpManager(HttpManager httpManager) {
        this.httpManager = httpManager;
    }
}

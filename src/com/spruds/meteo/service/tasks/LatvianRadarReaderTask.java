/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.spruds.meteo.service.tasks;

import com.spruds.meteo.model.RadarReading;
import com.spruds.meteo.service.data.RadarReadingService;
import com.spruds.meteo.service.xml.LatvianRadarDataProvider;
import java.util.TimerTask;
import org.apache.log4j.Logger;

public class LatvianRadarReaderTask extends TimerTask {
    private static Logger log = Logger.getLogger(LatvianRadarReaderTask.class);
    private LatvianRadarDataProvider latvianRadarDataProvider;
    private RadarReadingService radarReadingService;
    
    @Override
    public void run() {
        log.debug("LatvianRadarReaderTask running");
        try {
            RadarReading reading = latvianRadarDataProvider.getCurrentReading();
            radarReadingService.save(reading);

            radarReadingService.purgeReadings();
        }
        catch(Exception ex) {
            String message = "LatvianRadarReaderTask failed";
            log.error(message, ex);
        }
    }

    /**
     * @param latvianRadarDataProvider the latvianRadarDataProvider to set
     */
    public void setLatvianRadarDataProvider(LatvianRadarDataProvider latvianRadarDataProvider) {
        this.latvianRadarDataProvider = latvianRadarDataProvider;
    }

    /**
     * @param radarReadingService the radarReadingService to set
     */
    public void setRadarReadingService(RadarReadingService radarReadingService) {
        this.radarReadingService = radarReadingService;
    }
}

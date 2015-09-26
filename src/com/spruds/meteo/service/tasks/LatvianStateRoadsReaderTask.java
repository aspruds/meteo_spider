/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.spruds.meteo.service.tasks;

import com.spruds.meteo.model.Reading;
import com.spruds.meteo.service.data.ReadingService;
import com.spruds.meteo.service.xml.LatvianStateRoadsDataProvider;
import java.util.List;
import java.util.TimerTask;
import org.apache.log4j.Logger;

public class LatvianStateRoadsReaderTask extends TimerTask {
    private static Logger log = Logger.getLogger(LatvianStateRoadsReaderTask.class);
    private LatvianStateRoadsDataProvider latvianStateRoadsDataProvider;
    private ReadingService readingService;
    
    @Override
    public void run() {
        log.debug("LatvianStateRoadsReaderTask running");
        try {
            List<Reading> currentReadings = latvianStateRoadsDataProvider.getCurrentReadings();
            for(Reading reading: currentReadings) {
                readingService.save(reading);
            }
        }
        catch(Exception ex) {
            String message = "LatvianStateRoadsReaderTask failed";
            log.error(message, ex);
        }
    }

    /**
     * @param latvianStateRoadsDataProvider the latvianStateRoadsDataProvider to set
     */
    public void setLatvianStateRoadsDataProvider(LatvianStateRoadsDataProvider latvianStateRoadsDataProvider) {
        this.latvianStateRoadsDataProvider = latvianStateRoadsDataProvider;
    }

    /**
     * @param readingService the readingService to set
     */
    public void setReadingService(ReadingService readingService) {
        this.readingService = readingService;
    }
}

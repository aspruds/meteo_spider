/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.spruds.meteo.service.tasks;

import com.spruds.meteo.model.Location;
import com.spruds.meteo.model.Reading;
import com.spruds.meteo.service.data.LocationService;
import com.spruds.meteo.service.data.ReadingService;
import com.spruds.meteo.service.xml.GoogleDataProvider;
import com.spruds.meteo.utils.ThreadUtils;
import java.util.List;
import java.util.TimerTask;
import org.apache.log4j.Logger;

public class GoogleReaderTask extends TimerTask {
    private static Logger log = Logger.getLogger(GoogleReaderTask.class);
    private LocationService locationService;
    private GoogleDataProvider googleDataProvider;
    private ReadingService readingService;
    private static int PAUSE = 2000;
    
    @Override
    public void run() {
        log.debug("GoogleReaderTask running");
        try {
            List<Location> locations = locationService.getGoogleSupportedLocations();
            for(Location location: locations) {
                try {
                    Reading reading = googleDataProvider.getReading(location);
                    readingService.save(reading);

                    ThreadUtils.sleep(PAUSE);
                }
                catch(Exception readingException) {
                    String message = "could not obtain reading for a location";
                    log.error(message, readingException);
                }
            }
        }
        catch(Exception ex) {
            String message = "GoogleReaderTask failed";
            log.error(message, ex);
        }
    }

    public void setLocationService(LocationService locationService) {
        this.locationService = locationService;
    }

    public void setGoogleDataProvider(GoogleDataProvider googleDataProvider) {
        this.googleDataProvider = googleDataProvider;
    }

    public void setReadingService(ReadingService readingService) {
        this.readingService = readingService;
    }
}

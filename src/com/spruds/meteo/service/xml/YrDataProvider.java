package com.spruds.meteo.service.xml;

import com.spruds.meteo.model.Forecast;
import com.spruds.meteo.model.Location;
import com.spruds.meteo.service.xml.parsers.YrForecastParser;
import com.spruds.meteo.utils.HttpManager;
import java.io.IOException;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.util.EntityUtils;

public class YrDataProvider {
    private HttpManager httpManager;
    private static final String YR_NO_SITE_URL = "http://www.yr.no/place/";
    private static final String FORECAST_LOCATION = "/forecast.xml";
    private YrForecastParser yrForecastParser;
    
    public Forecast getData(Location location) {
        Forecast forecast = null;
        try {
            String xml = fetchXML(location);
            forecast = yrForecastParser.parseMessage(xml);
            forecast.setLocation(location);
        }
        catch(IOException ex) {
            String message = "unable to retrieve forecast";
            throw new RuntimeException(message, ex);
        }
        return forecast;
    }

    private String fetchXML(Location location) throws IOException {
        String url = YR_NO_SITE_URL + location.getYrNoUrl() + FORECAST_LOCATION;

        HttpGet request = new HttpGet(url);
        HttpResponse response = httpManager.execute(request);
        
        int statusCode = response.getStatusLine().getStatusCode();
        if(statusCode == 200) {
            return EntityUtils.toString(response.getEntity());
        }
        else {
            String message = "invalid status code: " + statusCode;
            throw new IOException(message);
        }
    }

    public void setHttpManager(HttpManager httpManager) {
        this.httpManager = httpManager;
    }

    public void setYrForecastParser(YrForecastParser yrForecastParser) {
        this.yrForecastParser = yrForecastParser;
    }
}

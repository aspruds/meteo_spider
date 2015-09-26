package com.spruds.meteo.service.xml;

import com.spruds.meteo.model.Location;
import com.spruds.meteo.model.Reading;
import com.spruds.meteo.service.xml.parsers.GoogleMessageParser;
import com.spruds.meteo.utils.HttpManager;
import java.io.IOException;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.util.EntityUtils;

public class GoogleDataProvider {
    private HttpManager httpManager;
    private GoogleMessageParser googleMessageParser;
    
    private static final String GOOGLE_SITE_URL = "http://www.google.com/ig/api?hl=en&weather=";
    
    public Reading getReading(Location location) throws IOException {
        Reading reading = null;
        try {
            String xml = fetchXML(location);
            reading = googleMessageParser.parseMessage(xml);
            reading.setLocation(location);
        }
        catch(IOException ex) {
            throw ex;
        }
        return reading;
    }

    private String fetchXML(Location location) throws IOException {
        String url = GOOGLE_SITE_URL + location.getName() + "," + location.getCountry().getName();

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

    /**
     * @param googleMessageParser the googleMessageParser to set
     */
    public void setGoogleMessageParser(GoogleMessageParser googleMessageParser) {
        this.googleMessageParser = googleMessageParser;
    }
}

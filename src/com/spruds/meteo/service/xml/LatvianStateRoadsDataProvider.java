/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.spruds.meteo.service.xml;

import com.spruds.meteo.model.Reading;
import com.spruds.meteo.service.xml.parsers.LatvianStateRoadsParser;
import com.spruds.meteo.utils.HttpManager;
import com.spruds.meteo.utils.ThreadUtils;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

/**
 *
 * @author andris
 */
public class LatvianStateRoadsDataProvider {
    private static final String HOST_NAME = "www.lvceli.lv";
    private static final String PARAMS_PATH_NAME = "/cms/parametri.asp";

    private static final String FORECAST_URL = "http://www.lvceli.lv/cms/meteo_.asp";
    private static final String DATA_URL = "http://www.lvceli.lv/cms/visas__.asp";
    private static int PAUSE = 5000;

    private HttpManager httpManager;
    private LatvianStateRoadsParser latvianStateRoadsParser;

    public List<Reading> getCurrentReadings() {
        List<Reading> readings = Collections.EMPTY_LIST;

        try {
            getCurrentData();
            ThreadUtils.sleep(PAUSE);

            setParams();
            ThreadUtils.sleep(PAUSE);

            // load page twice
            getCurrentData();
            ThreadUtils.sleep(PAUSE);

            String html = getCurrentData();
            readings = latvianStateRoadsParser.parseMessage(html);
        }
        catch(Exception ex) {
            String message = "could not parse readings";
            throw new RuntimeException(message, ex);
        }
        return readings;
    }

    private String getSession() throws IOException {
        HttpGet request = new HttpGet(FORECAST_URL);
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

    private String getCurrentData() throws IOException {
        HttpGet request = new HttpGet(DATA_URL);       
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

    private void setParams() throws IOException, URISyntaxException {
        URI uri = new URI(
            "http",
            HOST_NAME,
            PARAMS_PATH_NAME,
            "D=" + "2011-9-22 17:58",
            null);

        HttpPost request = new HttpPost(uri.toASCIIString());

        List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>();

        nameValuePairs.add(new BasicNameValuePair("cik", "24"));
        String params[] = {"AT","DP", "DT","RH","RS","VI","WD","WS","WSM"};
        for(String param: params) {
            nameValuePairs.add(new BasicNameValuePair(param, "on"));
        }
        nameValuePairs.add(new BasicNameValuePair("flag", "2"));

        request.setEntity(new UrlEncodedFormEntity(nameValuePairs));

        HttpResponse response = httpManager.execute(request);

        int statusCode = response.getStatusLine().getStatusCode();
        if(statusCode != 200) {
            String message = "invalid status code: " + statusCode;
            throw new IOException(message);
        }
    }

    public void setHttpManager(HttpManager httpManager) {
        this.httpManager = httpManager;
    }

    /**
     * @param latvianStateRoadsParser the latvianStateRoadsParser to set
     */
    public void setLatvianStateRoadsParser(LatvianStateRoadsParser latvianStateRoadsParser) {
        this.latvianStateRoadsParser = latvianStateRoadsParser;
    }
}

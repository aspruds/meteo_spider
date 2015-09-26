package com.spruds.meteo.service.xml.parsers;

import com.spruds.meteo.model.ConditionType;
import com.spruds.meteo.model.Location;
import com.spruds.meteo.model.Reading;
import com.spruds.meteo.model.SourceType;
import com.spruds.meteo.service.data.LocationService;
import java.io.StringReader;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import org.apache.log4j.Logger;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.w3c.tidy.Tidy;

public class LatvianStateRoadsParser {
    private Logger log = Logger.getLogger(LatvianStateRoadsParser.class);
    private LocationService locationService;

    private static final int IDX_TIME = 0;
    private static final int IDX_STATION = 1;
    private static final int IDX_TEMPERATURE = 2;
    private static final int IDX_DELTA_TEMPERATURE = 3;
    private static final int IDX_HUMIDITY = 4;
    private static final int IDX_DEW_POINT = 5;
    private static final int IDX_PRECIPATION = 6;
    private static final int IDX_VISIBILITY = 7;
    private static final int IDX_WIND_SPEED = 8;
    private static final int IDX_WIND_MAX = 9;
    private static final int IDX_WIND_DIRECTION = 10;

    private static final String CONDITION_CLEAR = "nav";
    private static final String CONDITION_LIGHT_RAIN = "neliels lietus";
    private static final String CONDITION_RAIN = "lietus";
    private static final String CONDITION_SHOWERS = "spēcīgs lietus";
    private static final String CONDITION_LIGHT_SNOW = "neliels sniegs";
    private static final String CONDITION_SNOW = "sniegs";
    private static final String CONDITION_SNOW_SHOWERS = "spēcīgs sniegs";
    
    public List<Reading> parseMessage(String html) {
        List<Reading> readings = new ArrayList<Reading>();
        
        try {
            Tidy tidy = new Tidy();
            tidy.setQuiet(true);
            tidy.setDropProprietaryAttributes(true);
            tidy.setXHTML(true);
            tidy.setShowWarnings(false);

            Document tidyDOM = tidy.parseDOM(new StringReader(html), null);

            NodeList tables = tidyDOM.getElementsByTagName("table");
            assert(tables.getLength() == 2);

            Node table = tables.item(2);
            NodeList trList = table.getChildNodes();

            for(int i=1; i < trList.getLength(); i++) {
                Node tr = trList.item(i);

                Reading reading = new Reading();
                reading.setDateObtained(new Date());
                reading.setSource(SourceType.LATVIAN_STATE_ROADS);

                // time obtained
                String timeString = getNodeValue(IDX_TIME, tr);
                if(timeString != null) {
                    reading.setDateMeasured(getDateFromTime(timeString));
                }

                // station
                String station = getStation(IDX_STATION, tr);
                Location location = locationService.findLocationByStateRoadsCode(station);
                if(station == null) {
                    String message = "could not find station by code: " + station;
                    throw new RuntimeException(message);
                }
                reading.setLocation(location);

                // temperature
                String temperatureString = getNodeValue(IDX_TEMPERATURE, tr);
                if(temperatureString != null) {
                    reading.setTemperature(Float.valueOf(temperatureString));
                }

                String deltaTemperatureString = getNodeValue(IDX_DELTA_TEMPERATURE, tr);
                if(deltaTemperatureString != null) {
                    deltaTemperatureString = deltaTemperatureString.replace(",", ".");
                    reading.setTemperatureDelta(Float.valueOf(deltaTemperatureString));
                }

                String humidityString = getNodeValue(IDX_HUMIDITY, tr);
                if(humidityString != null) {
                    reading.setHumidity(Integer.valueOf(humidityString));
                }

                String dewPointString = getNodeValue(IDX_DEW_POINT, tr);
                if(dewPointString != null) {
                    reading.setDewPoint(Float.parseFloat(dewPointString));
                }

                String precipationString = getNodeValue(IDX_PRECIPATION, tr);
                if(precipationString == null) {
                    reading.setConditionType(ConditionType.PARTLY_SUNNY);
                }
                else if(CONDITION_CLEAR.equals(precipationString)) {
                    reading.setConditionType(ConditionType.PARTLY_SUNNY);
                }
                else if(CONDITION_LIGHT_RAIN.equals(precipationString)) {
                    reading.setConditionType(ConditionType.LIGHT_RAIN);
                }
                else if(CONDITION_RAIN.equals(precipationString)) {
                    reading.setConditionType(ConditionType.RAIN);
                }
                else if(CONDITION_SHOWERS.equals(precipationString)) {
                    reading.setConditionType(ConditionType.SHOWERS);
                }
                else if(CONDITION_LIGHT_SNOW.equals(precipationString)) {
                    reading.setConditionType(ConditionType.LIGHT_SNOW);
                }
                else if(CONDITION_SNOW.equals(precipationString)) {
                    reading.setConditionType(ConditionType.SNOW);
                }
                else if(CONDITION_SNOW_SHOWERS.equals(precipationString)) {
                    reading.setConditionType(ConditionType.SNOW_SHOWERS);
                }
                else {
                    reading.setConditionType(ConditionType.PARTLY_SUNNY);
                }

                String visibilityString = getNodeValue(IDX_VISIBILITY, tr);
                if(visibilityString != null) {
                    reading.setVisibility(Integer.valueOf(visibilityString));
                }

                // wind spped
                String windSpeedString = getNodeValue(IDX_WIND_SPEED, tr);
                if(windSpeedString != null) {
                    reading.setWindSpeed(Float.valueOf(windSpeedString));
                }

                String windMaxString = getNodeValue(IDX_WIND_MAX, tr);
                if(windMaxString != null) {
                    reading.setWindSpeedMax(Float.valueOf(windMaxString));
                }

                String windDirection = getNodeValue(IDX_WIND_DIRECTION, tr);
                if(windDirection != null) {
                    windDirection = windDirection.replace("D", "S");
                    windDirection = windDirection.replace("R", "W");
                    windDirection = windDirection.replace("Z", "N");
                    windDirection = windDirection.replace("A", "E");

                    reading.setWindDirection(windDirection);
                }

                if(reading.getTemperature() > 50 || reading.getTemperature() < -50) {
                    String message = "reading temperature exceeds 50, skipping: " + reading;
                    log.error(message);
                    continue;
                }
                
                readings.add(reading);
            }
        }
        catch(Exception ex) {
            String message = "could not parse readings";
            throw new RuntimeException(message, ex);
        }
        return readings;
    }
    
    private String getStation(int index, Node tr) {
        String value = null;
        Node td = tr.getChildNodes().item(index);
        Node attribute = td.getChildNodes().item(1).getAttributes().getNamedItem("href");

        String attrValue = attribute.getNodeValue();
        if(attrValue != null) {
            int pos = attrValue.lastIndexOf("=");
            if(pos != -1) {
                value = attrValue.substring(pos+1, attrValue.length());
            }
        }
        return value;
    }

    private String getNodeValue(int index, Node tr) {
        String value = null;
        Node td = tr.getChildNodes().item(index);
        if(td.getChildNodes().getLength() == 1) {
            value = td.getFirstChild().getNodeValue();
        }

        if("-".equals(value)) {
            value = null;
        }
        return value;
    }

    private Date getDateFromTime(String time) throws ParseException {
        Calendar nowCalendar = Calendar.getInstance();
        Calendar timeCalendar = Calendar.getInstance();

        DateFormat formatter = new SimpleDateFormat("HH:mm");
        Date timePart = formatter.parse(time);
        timeCalendar.setTime(timePart);

        nowCalendar.set(Calendar.HOUR, timeCalendar.get(Calendar.HOUR));
        nowCalendar.set(Calendar.MINUTE, timeCalendar.get(Calendar.MINUTE));
        
        return nowCalendar.getTime();
    }

    /**
     * @param locationService the locationService to set
     */
    public void setLocationService(LocationService locationService) {
        this.locationService = locationService;
    }
}

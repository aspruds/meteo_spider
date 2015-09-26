package com.spruds.meteo.service.xml.parsers;

import com.spruds.meteo.model.ConditionType;
import com.spruds.meteo.model.Reading;
import com.spruds.meteo.model.SourceType;
import java.io.StringReader;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathFactory;
import org.apache.log4j.Logger;
import org.hibernate.tool.hbm2x.StringUtils;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.xml.sax.InputSource;

public class GoogleMessageParser {
    private XPath xpath; 
    private static final float METERS_PER_MILE = 1.609344f;
    private Logger log = Logger.getLogger(GoogleMessageParser.class);

    public GoogleMessageParser() {
        XPathFactory factory = XPathFactory.newInstance();
        xpath = factory.newXPath();
    }

    public Reading parseMessage(String xml) {
        Reading reading = new Reading();
        reading.setSource(SourceType.GOOGLE);
        reading.setDateObtained(new Date());

        try {
            DocumentBuilderFactory domFactory =
            DocumentBuilderFactory.newInstance();
            domFactory.setNamespaceAware(true);
            DocumentBuilder builder = domFactory.newDocumentBuilder();
            
            Document doc = builder.parse(new InputSource(new StringReader(xml)));

            String temperature = getValue(doc, "/xml_api_reply/weather/current_conditions/temp_c/@data");
            if(!StringUtils.isEmpty(temperature)) {
                reading.setTemperature(Float.valueOf(temperature));
            }

            String wind = getValue(doc, "/xml_api_reply/weather/current_conditions/wind_condition/@data");
            if(!StringUtils.isEmpty(wind)) {
                String windDirection = getWindDirection(wind);
                reading.setWindDirection(windDirection);

                Float windSpeed = getWindSpeed(wind);
                reading.setWindSpeed(windSpeed);
            }

            String humidityString = getValue(doc, "/xml_api_reply/weather/current_conditions/humidity/@data");
            if(!StringUtils.isEmpty(humidityString)) {
                Integer humidity = getHumidity(humidityString);
                reading.setHumidity(humidity);
            }

            String conditionTypeString = getValue(doc, "/xml_api_reply/weather/current_conditions/condition/@data");
            if(!StringUtils.isEmpty(conditionTypeString)) {
                conditionTypeString = conditionTypeString.toUpperCase();
                conditionTypeString = conditionTypeString.replace(" ", "_");
                conditionTypeString = conditionTypeString.replace("/", "_");

                ConditionType conditionType = ConditionType.CLEAR;
                try {
                    conditionType = ConditionType.valueOf(conditionTypeString);
                }
                catch(IllegalArgumentException noCondition){}
                reading.setConditionType(conditionType);
            }
        }
        catch(Exception ex) {
            String message = "could not parse Google Weather reading";
            log.error(message, ex);
            
            throw new RuntimeException(ex);
        }

        if(reading.getTemperature() == null) {
            String message = "reading does not contain temperature: " + xml;
            throw new RuntimeException(message);
        }
        if(reading.getConditionType() == null) {
            String message = "reading does not contain condition type: " + xml;
            throw new RuntimeException(message);
        }
        return reading;
    }

    private String getValue(Document doc, String path) throws Exception {
        XPathExpression expr = xpath.compile(path);
        Object result = expr.evaluate(doc, XPathConstants.NODE);

        String value = null;
        if(result != null) {
            value = ((Node)result).getNodeValue();
        }
        return value;
    }

    private String getWindDirection(String value) {
        String direction = null;

        Pattern pattern = Pattern.compile("Wind: ([A-Z]+?) ");
        Matcher matcher = pattern.matcher(value);
        if(matcher.find()) {
            direction = matcher.group(1);
        }

        return direction;
    }

    private Float getWindSpeed(String value) {
        Float speed = null;

        Pattern pattern = Pattern.compile("at ([0-9\\.]+?) mph");
        Matcher matcher = pattern.matcher(value);
        if(matcher.find()) {
            speed = Float.valueOf(matcher.group(1));
        }
        
        return convertFromMilesToMeters(speed);
    }

    private Integer getHumidity(String value) {
        Integer humidity = null;

        Pattern pattern = Pattern.compile("Humidity: ([0-9]+?)%");
        Matcher matcher = pattern.matcher(value);
        if(matcher.find()) {
            humidity = Integer.valueOf(matcher.group(1));
        }

        return humidity;
    }

    private Float convertFromMilesToMeters(Float value) {
        if(value == null) {
            return null;
        }
        return new Float(value.floatValue() * METERS_PER_MILE);
    }
}

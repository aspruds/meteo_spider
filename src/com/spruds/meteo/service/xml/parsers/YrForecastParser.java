package com.spruds.meteo.service.xml.parsers;

import com.spruds.meteo.model.Forecast;
import com.spruds.meteo.model.SourceType;
import java.io.StringReader;
import java.util.Date;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathFactory;
import org.apache.log4j.Logger;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.xml.sax.InputSource;

public class YrForecastParser {
    private XPath xpath; 
    private static final float METERS_PER_MILE = 1.609344f;
    private Logger log = Logger.getLogger(YrForecastParser.class);

    public YrForecastParser() {
        XPathFactory factory = XPathFactory.newInstance();
        xpath = factory.newXPath();
    }

    public Forecast parseMessage(String xml) {
        Forecast forecast = new Forecast();
        forecast.setSource(SourceType.YR_NO);
        forecast.setDateObtained(new Date());
        forecast.setData(xml);

        try {
            DocumentBuilderFactory domFactory =
            DocumentBuilderFactory.newInstance();
            domFactory.setNamespaceAware(true);
            DocumentBuilder builder = domFactory.newDocumentBuilder();
            
            Document doc = builder.parse(new InputSource(new StringReader(xml)));
        }
        catch(Exception ex) {
            String message = "could not parse Google Weather reading";
            log.error(message, ex);
            
            throw new RuntimeException(ex);
        }
        return forecast;
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
}

-- MySQL dump 10.13  Distrib 5.1.49, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: meteo_spider
-- ------------------------------------------------------
-- Server version	5.1.49-1ubuntu8.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `condition_types`
--

DROP TABLE IF EXISTS `condition_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `condition_types` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `condition_types`
--

LOCK TABLES `condition_types` WRITE;
/*!40000 ALTER TABLE `condition_types` DISABLE KEYS */;
INSERT INTO `condition_types` VALUES (1,'PARTLY_SUNNY'),(2,'SCATTERED_THUNDERSTORMS'),(3,'SHOWERS'),(4,'SCATTERED_SHOWERS'),(5,'RAIN_AND_SNOW'),(6,'OVERCAST'),(7,'LIGHT_SNOW'),(8,'FREEZING_DRIZZLE'),(9,'CHANCE_OF_RAIN'),(10,'SUNNY'),(11,'CLEAR'),(12,'MOSTLY_SUNNY'),(13,'PARTLY_CLOUDY'),(14,'MOSTLY_CLOUDY'),(15,'CHANCE_OF_STORM'),(16,'RAIN'),(17,'CHANCE_OF_SNOW'),(18,'CLOUDY'),(19,'MIST'),(20,'STORM'),(21,'THUNDERSTORM'),(22,'CHANCE_OF_TSTORM'),(23,'SLEET'),(24,'SNOW'),(25,'ICY'),(26,'DUST'),(27,'FOG'),(28,'SMOKE'),(29,'HAZE'),(30,'FLURRIES'),(31,'LIGHT_RAIN'),(32,'SNOW_SHOWERS'),(33,'ICE_SNOW'),(34,'WINDY'),(35,'SCATTERED_SNOW_SHOWERS');
/*!40000 ALTER TABLE `condition_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `country_id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'lv','Latvia');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forecasts`
--

DROP TABLE IF EXISTS `forecasts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forecasts` (
  `forecast_id` int(11) NOT NULL AUTO_INCREMENT,
  `location_id` int(11) NOT NULL,
  `date_obtained` datetime NOT NULL,
  `source_type_id` int(11) NOT NULL,
  `forecast_data` longtext NOT NULL,
  PRIMARY KEY (`forecast_id`),
  KEY `source_type_id` (`source_type_id`),
  KEY `location_id` (`location_id`),
  CONSTRAINT `forecasts_location_fk` FOREIGN KEY (`location_id`) REFERENCES `locations` (`location_id`),
  CONSTRAINT `forecasts_source_fk` FOREIGN KEY (`source_type_id`) REFERENCES `source_types` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forecasts`
--

LOCK TABLES `forecasts` WRITE;
/*!40000 ALTER TABLE `forecasts` DISABLE KEYS */;
INSERT INTO `forecasts` VALUES (2,1,'2011-09-21 19:50:48',2,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\r\n<weatherdata>\r\n  <location>\r\n    <name>Riga</name>\r\n    <type>Capital</type>\r\n    <country>Latvia</country>\r\n    <timezone id=\"Europe/Riga\" utcoffsetMinutes=\"180\" />\r\n    <location altitude=\"9\" latitude=\"56.946\" longitude=\"24.10589\" geobase=\"geonames\" geobaseid=\"456172\" />\r\n  </location>\r\n  <credit>\r\n    <!--In order to use the free weather data from yr no, you HAVE to display \r\nthe following text clearly visible on your web page. The text should be a \r\nlink to the specified URL.-->\r\n    <!--Please read more about our conditions and guidelines at http://www.yr.no/verdata/ -->\r\n    <link text=\"Weather forecast from yr.no, delivered by the Norwegian Meteorological Institute and the NRK\" url=\"http://www.yr.no/place/Latvia/Riga/Riga/\" />\r\n  </credit>\r\n  <links>\r\n    <link id=\"xmlSource\" url=\"http://www.yr.no/place/Latvia/Riga/Riga/forecast.xml\" />\r\n    <link id=\"xmlSourceHourByHout\" url=\"http://www.yr.no/place/Latvia/Riga/Riga/forecast_hour_by_hout.xml\" />\r\n    <link id=\"overview\" url=\"http://www.yr.no/place/Latvia/Riga/Riga/\" />\r\n    <link id=\"hourByHour\" url=\"http://www.yr.no/place/Latvia/Riga/Riga/hour_by_hour.html\" />\r\n    <link id=\"longTermForecast\" url=\"http://www.yr.no/place/Latvia/Riga/Riga/long.html\" />\r\n  </links>\r\n  <meta>\r\n    <lastupdate>2011-09-21T10:03:00</lastupdate>\r\n    <nextupdate>2011-09-21T23:00:00</nextupdate>\r\n  </meta>\r\n  <sun rise=\"2011-09-21T07:05:28\" set=\"2011-09-21T19:26:51\" />\r\n  <forecast>\r\n    <tabular>\r\n      <time from=\"2011-09-22T00:00:00\" to=\"2011-09-22T06:00:00\" period=\"0\">\r\n        <!-- Valid from 2011-09-22T00:00:00 to 2011-09-22T06:00:00 -->\r\n        <symbol number=\"5\" name=\"Rain showers\" var=\"mf/05n.82\" />\r\n        <precipitation value=\"0.5\" />\r\n        <!-- Valid at 2011-09-22T00:00:00 -->\r\n        <windDirection deg=\"219.2\" code=\"SW\" name=\"Southwest\" />\r\n        <windSpeed mps=\"4.9\" name=\"Gentle breeze\" />\r\n        <temperature unit=\"celsius\" value=\"14\" />\r\n        <pressure unit=\"hPa\" value=\"1015.6\" />\r\n      </time>\r\n      <time from=\"2011-09-22T06:00:00\" to=\"2011-09-22T12:00:00\" period=\"1\">\r\n        <!-- Valid from 2011-09-22T06:00:00 to 2011-09-22T12:00:00 -->\r\n        <symbol number=\"3\" name=\"Partly cloudy\" var=\"03d\" />\r\n        <precipitation value=\"0.0\" />\r\n        <!-- Valid at 2011-09-22T06:00:00 -->\r\n        <windDirection deg=\"205.7\" code=\"SSW\" name=\"South-southwest\" />\r\n        <windSpeed mps=\"4.6\" name=\"Gentle breeze\" />\r\n        <temperature unit=\"celsius\" value=\"13\" />\r\n        <pressure unit=\"hPa\" value=\"1012.0\" />\r\n      </time>\r\n      <time from=\"2011-09-22T12:00:00\" to=\"2011-09-22T18:00:00\" period=\"2\">\r\n        <!-- Valid from 2011-09-22T12:00:00 to 2011-09-22T18:00:00 -->\r\n        <symbol number=\"9\" name=\"Rain\" var=\"09\" />\r\n        <precipitation value=\"2.0\" />\r\n        <!-- Valid at 2011-09-22T12:00:00 -->\r\n        <windDirection deg=\"223.9\" code=\"SW\" name=\"Southwest\" />\r\n        <windSpeed mps=\"8.0\" name=\"Fresh breeze\" />\r\n        <temperature unit=\"celsius\" value=\"17\" />\r\n        <pressure unit=\"hPa\" value=\"1008.5\" />\r\n      </time>\r\n      <time from=\"2011-09-22T18:00:00\" to=\"2011-09-23T00:00:00\" period=\"3\">\r\n        <!-- Valid from 2011-09-22T18:00:00 to 2011-09-23T00:00:00 -->\r\n        <symbol number=\"2\" name=\"Fair\" var=\"mf/02n.82\" />\r\n        <precipitation value=\"0.0\" />\r\n        <!-- Valid at 2011-09-22T18:00:00 -->\r\n        <windDirection deg=\"245.2\" code=\"WSW\" name=\"West-southwest\" />\r\n        <windSpeed mps=\"7.0\" name=\"Moderate breeze\" />\r\n        <temperature unit=\"celsius\" value=\"14\" />\r\n        <pressure unit=\"hPa\" value=\"1006.4\" />\r\n      </time>\r\n      <time from=\"2011-09-23T00:00:00\" to=\"2011-09-23T06:00:00\" period=\"0\">\r\n        <!-- Valid from 2011-09-23T00:00:00 to 2011-09-23T06:00:00 -->\r\n        <symbol number=\"2\" name=\"Fair\" var=\"mf/02n.85\" />\r\n        <precipitation value=\"0.0\" />\r\n        <!-- Valid at 2011-09-23T00:00:00 -->\r\n        <windDirection deg=\"232.9\" code=\"SW\" name=\"Southwest\" />\r\n        <windSpeed mps=\"6.0\" name=\"Moderate breeze\" />\r\n        <temperature unit=\"celsius\" value=\"11\" />\r\n        <pressure unit=\"hPa\" value=\"1006.2\" />\r\n      </time>\r\n      <time from=\"2011-09-23T06:00:00\" to=\"2011-09-23T12:00:00\" period=\"1\">\r\n        <!-- Valid from 2011-09-23T06:00:00 to 2011-09-23T12:00:00 -->\r\n        <symbol number=\"3\" name=\"Partly cloudy\" var=\"03d\" />\r\n        <precipitation value=\"0.3\" />\r\n        <!-- Valid at 2011-09-23T06:00:00 -->\r\n        <windDirection deg=\"240.5\" code=\"WSW\" name=\"West-southwest\" />\r\n        <windSpeed mps=\"5.4\" name=\"Gentle breeze\" />\r\n        <temperature unit=\"celsius\" value=\"10\" />\r\n        <pressure unit=\"hPa\" value=\"1005.4\" />\r\n      </time>\r\n      <time from=\"2011-09-23T12:00:00\" to=\"2011-09-23T18:00:00\" period=\"2\">\r\n        <!-- Valid from 2011-09-23T12:00:00 to 2011-09-23T18:00:00 -->\r\n        <symbol number=\"3\" name=\"Partly cloudy\" var=\"03d\" />\r\n        <precipitation value=\"0.0\" />\r\n        <!-- Valid at 2011-09-23T12:00:00 -->\r\n        <windDirection deg=\"264.5\" code=\"W\" name=\"West\" />\r\n        <windSpeed mps=\"8.8\" name=\"Fresh breeze\" />\r\n        <temperature unit=\"celsius\" value=\"14\" />\r\n        <pressure unit=\"hPa\" value=\"1006.8\" />\r\n      </time>\r\n      <time from=\"2011-09-23T18:00:00\" to=\"2011-09-24T00:00:00\" period=\"3\">\r\n        <!-- Valid from 2011-09-23T18:00:00 to 2011-09-24T00:00:00 -->\r\n        <symbol number=\"3\" name=\"Partly cloudy\" var=\"mf/03n.85\" />\r\n        <precipitation value=\"0.0\" />\r\n        <!-- Valid at 2011-09-23T18:00:00 -->\r\n        <windDirection deg=\"262.5\" code=\"W\" name=\"West\" />\r\n        <windSpeed mps=\"6.9\" name=\"Moderate breeze\" />\r\n        <temperature unit=\"celsius\" value=\"14\" />\r\n        <pressure unit=\"hPa\" value=\"1007.3\" />\r\n      </time>\r\n      <time from=\"2011-09-23T21:00:00\" to=\"2011-09-24T03:00:00\" period=\"0\">\r\n        <!-- Valid from 2011-09-23T21:00:00 to 2011-09-24T03:00:00 -->\r\n        <symbol number=\"3\" name=\"Partly cloudy\" var=\"mf/03n.89\" />\r\n        <precipitation value=\"0.3\" />\r\n        <!-- Valid at 2011-09-23T21:00:00 -->\r\n        <windDirection deg=\"251.5\" code=\"WSW\" name=\"West-southwest\" />\r\n        <windSpeed mps=\"5.2\" name=\"Gentle breeze\" />\r\n        <temperature unit=\"celsius\" value=\"12\" />\r\n        <pressure unit=\"hPa\" value=\"1007.5\" />\r\n      </time>\r\n      <time from=\"2011-09-24T03:00:00\" to=\"2011-09-24T09:00:00\" period=\"1\">\r\n        <!-- Valid from 2011-09-24T03:00:00 to 2011-09-24T09:00:00 -->\r\n        <symbol number=\"5\" name=\"Rain showers\" var=\"05d\" />\r\n        <precipitation value=\"0.4\" />\r\n        <!-- Valid at 2011-09-24T03:00:00 -->\r\n        <windDirection deg=\"258.0\" code=\"WSW\" name=\"West-southwest\" />\r\n        <windSpeed mps=\"5.9\" name=\"Moderate breeze\" />\r\n        <temperature unit=\"celsius\" value=\"11\" />\r\n        <pressure unit=\"hPa\" value=\"1007.2\" />\r\n      </time>\r\n      <time from=\"2011-09-24T09:00:00\" to=\"2011-09-24T15:00:00\" period=\"2\">\r\n        <!-- Valid from 2011-09-24T09:00:00 to 2011-09-24T15:00:00 -->\r\n        <symbol number=\"1\" name=\"Fair\" var=\"01d\" />\r\n        <precipitation value=\"0.0\" />\r\n        <!-- Valid at 2011-09-24T09:00:00 -->\r\n        <windDirection deg=\"288.7\" code=\"WNW\" name=\"West-northwest\" />\r\n        <windSpeed mps=\"6.5\" name=\"Moderate breeze\" />\r\n        <temperature unit=\"celsius\" value=\"11\" />\r\n        <pressure unit=\"hPa\" value=\"1008.8\" />\r\n      </time>\r\n      <time from=\"2011-09-24T15:00:00\" to=\"2011-09-24T21:00:00\" period=\"3\">\r\n        <!-- Valid from 2011-09-24T15:00:00 to 2011-09-24T21:00:00 -->\r\n        <symbol number=\"3\" name=\"Partly cloudy\" var=\"mf/03n.89\" />\r\n        <precipitation value=\"0.0\" />\r\n        <!-- Valid at 2011-09-24T15:00:00 -->\r\n        <windDirection deg=\"295.5\" code=\"WNW\" name=\"West-northwest\" />\r\n        <windSpeed mps=\"6.4\" name=\"Moderate breeze\" />\r\n        <temperature unit=\"celsius\" value=\"15\" />\r\n        <pressure unit=\"hPa\" value=\"1011.5\" />\r\n      </time>\r\n      <time from=\"2011-09-24T21:00:00\" to=\"2011-09-25T03:00:00\" period=\"0\">\r\n        <!-- Valid from 2011-09-24T21:00:00 to 2011-09-25T03:00:00 -->\r\n        <symbol number=\"2\" name=\"Fair\" var=\"mf/02n.92\" />\r\n        <precipitation value=\"0.0\" />\r\n        <!-- Valid at 2011-09-24T21:00:00 -->\r\n        <windDirection deg=\"277.4\" code=\"W\" name=\"West\" />\r\n        <windSpeed mps=\"4.7\" name=\"Gentle breeze\" />\r\n        <temperature unit=\"celsius\" value=\"11\" />\r\n        <pressure unit=\"hPa\" value=\"1013.6\" />\r\n      </time>\r\n      <time from=\"2011-09-25T03:00:00\" to=\"2011-09-25T09:00:00\" period=\"1\">\r\n        <!-- Valid from 2011-09-25T03:00:00 to 2011-09-25T09:00:00 -->\r\n        <symbol number=\"3\" name=\"Partly cloudy\" var=\"03d\" />\r\n        <precipitation value=\"0.3\" />\r\n        <!-- Valid at 2011-09-25T03:00:00 -->\r\n        <windDirection deg=\"252.9\" code=\"WSW\" name=\"West-southwest\" />\r\n        <windSpeed mps=\"3.3\" name=\"Light breeze\" />\r\n        <temperature unit=\"celsius\" value=\"9\" />\r\n        <pressure unit=\"hPa\" value=\"1015.4\" />\r\n      </time>\r\n      <time from=\"2011-09-25T09:00:00\" to=\"2011-09-25T15:00:00\" period=\"2\">\r\n        <!-- Valid from 2011-09-25T09:00:00 to 2011-09-25T15:00:00 -->\r\n        <symbol number=\"5\" name=\"Rain showers\" var=\"05d\" />\r\n        <precipitation value=\"0.5\" />\r\n        <!-- Valid at 2011-09-25T09:00:00 -->\r\n        <windDirection deg=\"252.4\" code=\"WSW\" name=\"West-southwest\" />\r\n        <windSpeed mps=\"4.5\" name=\"Gentle breeze\" />\r\n        <temperature unit=\"celsius\" value=\"12\" />\r\n        <pressure unit=\"hPa\" value=\"1016.0\" />\r\n      </time>\r\n      <time from=\"2011-09-25T15:00:00\" to=\"2011-09-25T21:00:00\" period=\"3\">\r\n        <!-- Valid from 2011-09-25T15:00:00 to 2011-09-25T21:00:00 -->\r\n        <symbol number=\"3\" name=\"Partly cloudy\" var=\"mf/03n.92\" />\r\n        <precipitation value=\"2.4\" />\r\n        <!-- Valid at 2011-09-25T15:00:00 -->\r\n        <windDirection deg=\"287.4\" code=\"WNW\" name=\"West-northwest\" />\r\n        <windSpeed mps=\"5.9\" name=\"Moderate breeze\" />\r\n        <temperature unit=\"celsius\" value=\"15\" />\r\n        <pressure unit=\"hPa\" value=\"1017.6\" />\r\n      </time>\r\n      <time from=\"2011-09-25T21:00:00\" to=\"2011-09-26T03:00:00\" period=\"0\">\r\n        <!-- Valid from 2011-09-25T21:00:00 to 2011-09-26T03:00:00 -->\r\n        <symbol number=\"9\" name=\"Rain\" var=\"09\" />\r\n        <precipitation value=\"2.2\" />\r\n        <!-- Valid at 2011-09-25T21:00:00 -->\r\n        <windDirection deg=\"259.2\" code=\"W\" name=\"West\" />\r\n        <windSpeed mps=\"2.5\" name=\"Light breeze\" />\r\n        <temperature unit=\"celsius\" value=\"12\" />\r\n        <pressure unit=\"hPa\" value=\"1019.0\" />\r\n      </time>\r\n      <time from=\"2011-09-26T03:00:00\" to=\"2011-09-26T09:00:00\" period=\"1\">\r\n        <!-- Valid from 2011-09-26T03:00:00 to 2011-09-26T09:00:00 -->\r\n        <symbol number=\"2\" name=\"Fair\" var=\"02d\" />\r\n        <precipitation value=\"0.0\" />\r\n        <!-- Valid at 2011-09-26T03:00:00 -->\r\n        <windDirection deg=\"229.8\" code=\"SW\" name=\"Southwest\" />\r\n        <windSpeed mps=\"3.7\" name=\"Gentle breeze\" />\r\n        <temperature unit=\"celsius\" value=\"11\" />\r\n        <pressure unit=\"hPa\" value=\"1019.4\" />\r\n      </time>\r\n      <time from=\"2011-09-26T09:00:00\" to=\"2011-09-26T15:00:00\" period=\"2\">\r\n        <!-- Valid from 2011-09-26T09:00:00 to 2011-09-26T15:00:00 -->\r\n        <symbol number=\"4\" name=\"Cloudy\" var=\"04\" />\r\n        <precipitation value=\"0.0\" />\r\n        <!-- Valid at 2011-09-26T09:00:00 -->\r\n        <windDirection deg=\"226.7\" code=\"SW\" name=\"Southwest\" />\r\n        <windSpeed mps=\"4.2\" name=\"Gentle breeze\" />\r\n        <temperature unit=\"celsius\" value=\"12\" />\r\n        <pressure unit=\"hPa\" value=\"1019.3\" />\r\n      </time>\r\n      <time from=\"2011-09-26T15:00:00\" to=\"2011-09-26T21:00:00\" period=\"3\">\r\n        <!-- Valid from 2011-09-26T15:00:00 to 2011-09-26T21:00:00 -->\r\n        <symbol number=\"3\" name=\"Partly cloudy\" var=\"mf/03n.95\" />\r\n        <precipitation value=\"0.0\" />\r\n        <!-- Valid at 2011-09-26T15:00:00 -->\r\n        <windDirection deg=\"282.3\" code=\"WNW\" name=\"West-northwest\" />\r\n        <windSpeed mps=\"4.9\" name=\"Gentle breeze\" />\r\n        <temperature unit=\"celsius\" value=\"19\" />\r\n        <pressure unit=\"hPa\" value=\"1019.8\" />\r\n      </time>\r\n      <time from=\"2011-09-26T21:00:00\" to=\"2011-09-27T03:00:00\" period=\"0\">\r\n        <!-- Valid from 2011-09-26T21:00:00 to 2011-09-27T03:00:00 -->\r\n        <symbol number=\"2\" name=\"Fair\" var=\"mf/02n.99\" />\r\n        <precipitation value=\"0.0\" />\r\n        <!-- Valid at 2011-09-26T21:00:00 -->\r\n        <windDirection deg=\"294.8\" code=\"WNW\" name=\"West-northwest\" />\r\n        <windSpeed mps=\"3.6\" name=\"Gentle breeze\" />\r\n        <temperature unit=\"celsius\" value=\"14\" />\r\n        <pressure unit=\"hPa\" value=\"1021.1\" />\r\n      </time>\r\n      <time from=\"2011-09-27T03:00:00\" to=\"2011-09-27T09:00:00\" period=\"1\">\r\n        <!-- Valid from 2011-09-27T03:00:00 to 2011-09-27T09:00:00 -->\r\n        <symbol number=\"4\" name=\"Cloudy\" var=\"04\" />\r\n        <precipitation value=\"0.0\" />\r\n        <!-- Valid at 2011-09-27T03:00:00 -->\r\n        <windDirection deg=\"240.5\" code=\"WSW\" name=\"West-southwest\" />\r\n        <windSpeed mps=\"2.7\" name=\"Light breeze\" />\r\n        <temperature unit=\"celsius\" value=\"12\" />\r\n        <pressure unit=\"hPa\" value=\"1022.4\" />\r\n      </time>\r\n      <time from=\"2011-09-27T09:00:00\" to=\"2011-09-27T15:00:00\" period=\"2\">\r\n        <!-- Valid from 2011-09-27T09:00:00 to 2011-09-27T15:00:00 -->\r\n        <symbol number=\"1\" name=\"Fair\" var=\"01d\" />\r\n        <precipitation value=\"0.0\" />\r\n        <!-- Valid at 2011-09-27T09:00:00 -->\r\n        <windDirection deg=\"212.9\" code=\"SSW\" name=\"South-southwest\" />\r\n        <windSpeed mps=\"3.8\" name=\"Gentle breeze\" />\r\n        <temperature unit=\"celsius\" value=\"11\" />\r\n        <pressure unit=\"hPa\" value=\"1022.8\" />\r\n      </time>\r\n      <time from=\"2011-09-27T15:00:00\" to=\"2011-09-27T21:00:00\" period=\"3\">\r\n        <!-- Valid from 2011-09-27T15:00:00 to 2011-09-27T21:00:00 -->\r\n        <symbol number=\"4\" name=\"Cloudy\" var=\"04\" />\r\n        <precipitation value=\"0.0\" />\r\n        <!-- Valid at 2011-09-27T15:00:00 -->\r\n        <windDirection deg=\"205.9\" code=\"SSW\" name=\"South-southwest\" />\r\n        <windSpeed mps=\"3.7\" name=\"Gentle breeze\" />\r\n        <temperature unit=\"celsius\" value=\"16\" />\r\n        <pressure unit=\"hPa\" value=\"1022.1\" />\r\n      </time>\r\n      <time from=\"2011-09-27T21:00:00\" to=\"2011-09-28T03:00:00\" period=\"0\">\r\n        <!-- Valid from 2011-09-27T21:00:00 to 2011-09-28T03:00:00 -->\r\n        <symbol number=\"3\" name=\"Partly cloudy\" var=\"mf/03n.02\" />\r\n        <precipitation value=\"0.0\" />\r\n        <!-- Valid at 2011-09-27T21:00:00 -->\r\n        <windDirection deg=\"183.7\" code=\"S\" name=\"South\" />\r\n        <windSpeed mps=\"2.0\" name=\"Light breeze\" />\r\n        <temperature unit=\"celsius\" value=\"14\" />\r\n        <pressure unit=\"hPa\" value=\"1019.8\" />\r\n      </time>\r\n      <time from=\"2011-09-28T03:00:00\" to=\"2011-09-28T09:00:00\" period=\"1\">\r\n        <!-- Valid from 2011-09-28T03:00:00 to 2011-09-28T09:00:00 -->\r\n        <symbol number=\"3\" name=\"Partly cloudy\" var=\"03d\" />\r\n        <precipitation value=\"0.6\" />\r\n        <!-- Valid at 2011-09-28T03:00:00 -->\r\n        <windDirection deg=\"175.1\" code=\"S\" name=\"South\" />\r\n        <windSpeed mps=\"3.9\" name=\"Gentle breeze\" />\r\n        <temperature unit=\"celsius\" value=\"13\" />\r\n        <pressure unit=\"hPa\" value=\"1017.6\" />\r\n      </time>\r\n      <time from=\"2011-09-28T09:00:00\" to=\"2011-09-28T15:00:00\" period=\"2\">\r\n        <!-- Valid from 2011-09-28T09:00:00 to 2011-09-28T15:00:00 -->\r\n        <symbol number=\"9\" name=\"Rain\" var=\"09\" />\r\n        <precipitation value=\"0.8\" />\r\n        <!-- Valid at 2011-09-28T09:00:00 -->\r\n        <windDirection deg=\"185.2\" code=\"S\" name=\"South\" />\r\n        <windSpeed mps=\"5.4\" name=\"Gentle breeze\" />\r\n        <temperature unit=\"celsius\" value=\"14\" />\r\n        <pressure unit=\"hPa\" value=\"1014.4\" />\r\n      </time>\r\n      <time from=\"2011-09-28T15:00:00\" to=\"2011-09-28T21:00:00\" period=\"3\">\r\n        <!-- Valid from 2011-09-28T15:00:00 to 2011-09-28T21:00:00 -->\r\n        <symbol number=\"3\" name=\"Partly cloudy\" var=\"mf/03n.02\" />\r\n        <precipitation value=\"0.0\" />\r\n        <!-- Valid at 2011-09-28T15:00:00 -->\r\n        <windDirection deg=\"259.1\" code=\"W\" name=\"West\" />\r\n        <windSpeed mps=\"6.4\" name=\"Moderate breeze\" />\r\n        <temperature unit=\"celsius\" value=\"17\" />\r\n        <pressure unit=\"hPa\" value=\"1014.4\" />\r\n      </time>\r\n      <time from=\"2011-09-28T21:00:00\" to=\"2011-09-29T03:00:00\" period=\"0\">\r\n        <!-- Valid from 2011-09-28T21:00:00 to 2011-09-29T03:00:00 -->\r\n        <symbol number=\"1\" name=\"Fair\" var=\"mf/01n.06\" />\r\n        <precipitation value=\"0.0\" />\r\n        <!-- Valid at 2011-09-28T21:00:00 -->\r\n        <windDirection deg=\"233.5\" code=\"SW\" name=\"Southwest\" />\r\n        <windSpeed mps=\"5.1\" name=\"Gentle breeze\" />\r\n        <temperature unit=\"celsius\" value=\"13\" />\r\n        <pressure unit=\"hPa\" value=\"1015.7\" />\r\n      </time>\r\n      <time from=\"2011-09-29T03:00:00\" to=\"2011-09-29T09:00:00\" period=\"1\">\r\n        <!-- Valid from 2011-09-29T03:00:00 to 2011-09-29T09:00:00 -->\r\n        <symbol number=\"2\" name=\"Fair\" var=\"02d\" />\r\n        <precipitation value=\"0.3\" />\r\n        <!-- Valid at 2011-09-29T03:00:00 -->\r\n        <windDirection deg=\"226.5\" code=\"SW\" name=\"Southwest\" />\r\n        <windSpeed mps=\"3.9\" name=\"Gentle breeze\" />\r\n        <temperature unit=\"celsius\" value=\"10\" />\r\n        <pressure unit=\"hPa\" value=\"1014.9\" />\r\n      </time>\r\n      <time from=\"2011-09-29T09:00:00\" to=\"2011-09-29T15:00:00\" period=\"2\">\r\n        <!-- Valid from 2011-09-29T09:00:00 to 2011-09-29T15:00:00 -->\r\n        <symbol number=\"5\" name=\"Rain showers\" var=\"05d\" />\r\n        <precipitation value=\"0.4\" />\r\n        <!-- Valid at 2011-09-29T09:00:00 -->\r\n        <windDirection deg=\"236.0\" code=\"SW\" name=\"Southwest\" />\r\n        <windSpeed mps=\"3.2\" name=\"Light breeze\" />\r\n        <temperature unit=\"celsius\" value=\"11\" />\r\n        <pressure unit=\"hPa\" value=\"1014.6\" />\r\n      </time>\r\n      <time from=\"2011-09-29T15:00:00\" to=\"2011-09-29T21:00:00\" period=\"3\">\r\n        <!-- Valid from 2011-09-29T15:00:00 to 2011-09-29T21:00:00 -->\r\n        <symbol number=\"1\" name=\"Fair\" var=\"mf/01n.06\" />\r\n        <precipitation value=\"0.0\" />\r\n        <!-- Valid at 2011-09-29T15:00:00 -->\r\n        <windDirection deg=\"335.8\" code=\"NNW\" name=\"North-northwest\" />\r\n        <windSpeed mps=\"3.6\" name=\"Gentle breeze\" />\r\n        <temperature unit=\"celsius\" value=\"15\" />\r\n        <pressure unit=\"hPa\" value=\"1015.7\" />\r\n      </time>\r\n      <time from=\"2011-09-29T21:00:00\" to=\"2011-09-30T03:00:00\" period=\"0\">\r\n        <!-- Valid from 2011-09-29T21:00:00 to 2011-09-30T03:00:00 -->\r\n        <symbol number=\"4\" name=\"Cloudy\" var=\"04\" />\r\n        <precipitation value=\"0.0\" />\r\n        <!-- Valid at 2011-09-29T21:00:00 -->\r\n        <windDirection deg=\"342.2\" code=\"NNW\" name=\"North-northwest\" />\r\n        <windSpeed mps=\"2.3\" name=\"Light breeze\" />\r\n        <temperature unit=\"celsius\" value=\"10\" />\r\n        <pressure unit=\"hPa\" value=\"1017.2\" />\r\n      </time>\r\n      <time from=\"2011-09-30T03:00:00\" to=\"2011-09-30T09:00:00\" period=\"1\">\r\n        <!-- Valid from 2011-09-30T03:00:00 to 2011-09-30T09:00:00 -->\r\n        <symbol number=\"4\" name=\"Cloudy\" var=\"04\" />\r\n        <precipitation value=\"0.0\" />\r\n        <!-- Valid at 2011-09-30T03:00:00 -->\r\n        <windDirection deg=\"35.0\" code=\"NE\" name=\"Northeast\" />\r\n        <windSpeed mps=\"2.5\" name=\"Light breeze\" />\r\n        <temperature unit=\"celsius\" value=\"11\" />\r\n        <pressure unit=\"hPa\" value=\"1018.8\" />\r\n      </time>\r\n      <time from=\"2011-09-30T09:00:00\" to=\"2011-09-30T15:00:00\" period=\"2\">\r\n        <!-- Valid from 2011-09-30T09:00:00 to 2011-09-30T15:00:00 -->\r\n        <symbol number=\"1\" name=\"Fair\" var=\"01d\" />\r\n        <precipitation value=\"0.0\" />\r\n        <!-- Valid at 2011-09-30T09:00:00 -->\r\n        <windDirection deg=\"45.2\" code=\"NE\" name=\"Northeast\" />\r\n        <windSpeed mps=\"4.9\" name=\"Gentle breeze\" />\r\n        <temperature unit=\"celsius\" value=\"11\" />\r\n        <pressure unit=\"hPa\" value=\"1021.4\" />\r\n      </time>\r\n      <time from=\"2011-09-30T15:00:00\" to=\"2011-09-30T21:00:00\" period=\"3\">\r\n        <!-- Valid from 2011-09-30T15:00:00 to 2011-09-30T21:00:00 -->\r\n        <symbol number=\"1\" name=\"Fair\" var=\"mf/01n.09\" />\r\n        <precipitation value=\"0.0\" />\r\n        <!-- Valid at 2011-09-30T15:00:00 -->\r\n        <windDirection deg=\"44.1\" code=\"NE\" name=\"Northeast\" />\r\n        <windSpeed mps=\"4.7\" name=\"Gentle breeze\" />\r\n        <temperature unit=\"celsius\" value=\"15\" />\r\n        <pressure unit=\"hPa\" value=\"1023.4\" />\r\n      </time>\r\n      <time from=\"2011-09-30T21:00:00\" to=\"2011-10-01T03:00:00\" period=\"0\">\r\n        <!-- Valid from 2011-09-30T21:00:00 to 2011-10-01T03:00:00 -->\r\n        <symbol number=\"1\" name=\"Fair\" var=\"mf/01n.12\" />\r\n        <precipitation value=\"0.0\" />\r\n        <!-- Valid at 2011-09-30T21:00:00 -->\r\n        <windDirection deg=\"61.4\" code=\"ENE\" name=\"East-northeast\" />\r\n        <windSpeed mps=\"2.8\" name=\"Light breeze\" />\r\n        <temperature unit=\"celsius\" value=\"10\" />\r\n        <pressure unit=\"hPa\" value=\"1025.8\" />\r\n      </time>\r\n    </tabular>\r\n  </forecast>\r\n</weatherdata>');
/*!40000 ALTER TABLE `forecasts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `latest_readings`
--

DROP TABLE IF EXISTS `latest_readings`;
/*!50001 DROP VIEW IF EXISTS `latest_readings`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `latest_readings` (
  `reading_id` int(11),
  `location_id` int(11),
  `temperature` decimal(5,2),
  `date_obtained` datetime,
  `source_type_id` int(11),
  `wind_direction` varchar(20),
  `wind_speed` decimal(5,2),
  `humidity` int(11),
  `condition_type_id` int(11)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations` (
  `location_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `yr_no_url` varchar(999) NOT NULL,
  `geonames_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `longitude` float(10,6) NOT NULL,
  `latitude` float(10,6) NOT NULL,
  `is_enabled` tinyint(4) NOT NULL DEFAULT '1',
  `latvian_state_roads_id` varchar(20) DEFAULT NULL,
  `use_google` tinyint(4) NOT NULL,
  `meteo_lv_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`location_id`),
  KEY `country_id` (`country_id`),
  CONSTRAINT `locations_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,1,'/Latvia/Riga/Riga',456172,'Rīga',56.945999,24.105900,1,NULL,1,15),(2,1,'/Latvia/Preilu/Aglona',461631,'Aglona',56.133301,27.016701,1,NULL,1,NULL),(3,1,'/Latvia/Aizkraukles/Aizkraukle',461615,'Aizkraukle',56.604801,25.255301,1,NULL,1,NULL),(4,1,'/Latvia/Liepajas_fylke/Aizpute',461602,'Aizpute',56.716702,21.600000,1,NULL,1,NULL),(5,1,'/Latvia/Ventspils_fylke/Ance',461506,'Ance',57.513802,22.023001,0,NULL,0,NULL),(6,1,'/Latvia/Aluksnes/Ape/',461442,'Ape',57.539299,26.692900,0,NULL,0,NULL),(7,1,'/Latvia/Dobeles/Auce/',461336,'Auce',56.459801,22.901699,1,NULL,1,NULL),(8,1,'/Latvia/Balvu/Balvi/',461163,'Balvi',57.131302,27.265800,1,NULL,1,NULL),(9,1,'/Latvia/Bauskas/Bauska/',461114,'Bauska',56.407501,24.190599,1,'LV05',1,NULL),(10,1,'/Latvia/Cesu/Cēsis/',460570,'Cēsis',57.311901,25.274599,1,NULL,1,NULL),(11,1,'/Latvia/Annet/Dobele/',460312,'Dobele',56.625000,23.278601,1,NULL,1,5),(12,1,'/Latvia/Daugavpils_fylke/Gulbene/',459669,'Gulbene',56.033298,25.950001,1,NULL,1,NULL),(13,1,'/Latvia/Annet/Jaunpils/',459357,'Jaunpils',56.732498,23.013599,1,NULL,1,NULL),(14,1,'/Latvia/Annet/Jelgava/',459279,'Jelgava',56.650002,23.712799,1,NULL,1,NULL),(15,1,'/Latvia/Jekabpils/Jēkabpils/',459283,'Jēkabpils',56.499001,25.857401,1,NULL,1,NULL),(16,1,'/Latvia/Annet/Jūrmala/',459201,'Jūrmala',56.967999,23.770399,1,'LV31',1,NULL),(17,1,'/Latvia/Tukuma/Kandava/',459031,'Kandava',57.040901,22.774700,1,NULL,1,NULL),(18,1,'/Latvia/Kuldigas/Kuldīga/',458460,'Kuldīga',56.973999,21.957199,1,NULL,1,NULL),(19,1,'/Latvia/Talsu/Kolka/',458682,'Kolka',57.750000,22.583300,1,NULL,1,8),(20,1,'/Latvia/Ogres/Lielvārde/',457965,'Lielvārde',56.720699,24.807400,1,NULL,1,NULL),(21,1,'/Latvia/Liepaja/Liepāja~457955/',457955,'Liepāja',56.516701,21.016701,1,NULL,1,9),(22,1,'/Latvia/Madonas/Lubāna/',457799,'Lubāna',56.900002,26.716700,1,NULL,1,NULL),(23,1,'/Latvia/Madonas/Madona/',457714,'Madona',56.853298,26.216999,1,NULL,1,NULL),(24,1,'/Latvia/Riga_fylke/Mālpils/',457676,'Mālpils',57.011101,24.963100,1,NULL,1,NULL),(25,1,'/Latvia/Talsu/Mērsrags/',457408,'Mērsrags',57.335400,23.124599,1,NULL,1,NULL),(26,1,'/Latvia/Aizkraukles/Nereta/',457148,'Nereta',56.202801,25.307501,1,NULL,1,NULL),(27,1,'/Latvia/Liepajas_fylke/Nīca/',457142,'Nīca',56.346001,21.063999,1,NULL,1,NULL),(28,1,'/Latvia/Annet/Olaine/',457052,'Olaine',56.785301,23.938101,1,NULL,1,NULL),(29,1,'/Latvia/Liepajas_fylke/Priekule/',456506,'Priekule',56.446800,21.589701,1,NULL,1,NULL),(30,1,'/Latvia/Liepajas_fylke/Pāvilosta/',456827,'Pāvilosta',56.887901,21.185900,1,NULL,1,NULL),(31,1,'/Latvia/Gulbenes/Ranka/',456305,'Ranka',57.216702,26.183300,1,NULL,1,NULL),(32,1,'/Latvia/Talsu/Roja/',456107,'Roja',57.500000,22.816700,1,NULL,1,NULL),(33,1,'/Latvia/Rezekne/Rēzekne~456202/',456202,'Rēzekne',56.500000,27.316700,1,'LV26',1,NULL),(34,1,'/Latvia/Valmieras/Rūjiena/',456008,'Rūjiena',57.897499,25.331600,1,NULL,1,NULL),(35,1,'/Latvia/Limbažu/Salacgrīva/',455910,'Salacgrīva',57.753601,24.358101,1,NULL,1,NULL),(36,1,'/Latvia/Riga_fylke/Salaspils/',455898,'Salaspils',56.860100,24.365400,1,NULL,1,NULL),(37,1,'/Latvia/Saldus/Saldus/',455890,'Saldus',56.663601,22.488100,1,NULL,1,18),(38,1,'/Latvia/Riga_fylke/Sigulda/',455718,'Sigulda',57.151901,24.864700,1,'LV02',1,NULL),(39,1,'/Latvia/Kuldigas/Skrunda/',455520,'Skrunda',56.683300,22.016701,1,NULL,1,NULL),(40,1,'/Latvia/Annet/Skulte/',455499,'Skulte',56.919399,23.953300,1,'LV44',1,NULL),(41,1,'/Latvia/Valkas/Smiltene/',455406,'Smiltene',57.424400,25.901600,1,'LV18',1,NULL),(42,1,'/Latvia/Talsu/Talsi/',454970,'Talsi',57.245602,22.581400,1,'LV32',1,NULL),(43,1,'/Latvia/Annet/Tukums/',454768,'Tukums',56.966900,23.155300,1,NULL,1,NULL),(44,1,'/Latvia/Ventspils_fylke/Ugāle/',454722,'Ugāle',57.266701,22.033300,1,NULL,1,NULL),(45,1,'/Latvia/Talsu/Valdemārpils/',454584,'Valdemārpils',57.370701,22.591900,1,NULL,1,NULL),(46,1,'/Latvia/Valkas/Valka/',454572,'Valka',57.775200,26.010099,1,NULL,1,NULL),(47,1,'/Latvia/Valmieras/Valmiera/',453754,'Valmiera',57.541100,25.427500,1,'LV16',1,NULL),(48,1,'/Latvia/Cesu/Vecpiebalga/',454408,'Vecpiebalga',57.060902,25.816200,1,NULL,1,NULL),(49,1,'/Latvia/Ventspils/Ventspils/',454310,'Ventspils',57.389400,21.560600,1,NULL,1,NULL),(50,1,'/Latvia/Madonas/Ērgļi/',460001,'Ērgļi',56.897499,25.636700,1,NULL,1,NULL),(51,1,'/Latvia/Riga_fylke/Lilaste/',457893,'Lilaste',57.187500,24.336399,1,'LV01',1,NULL),(52,1,'/Latvia/Riga_fylke/Saulkalne/',455814,'Saulkalne',56.844700,24.433100,1,'LV03',1,NULL),(53,1,'/Latvia/Riga_fylke/Ķekava/',458880,'Ķekava',56.826599,24.230000,1,'LV04',1,NULL),(54,1,'/Latvia/Limbažu/Dunte/',460178,'Dunte',57.407501,24.423901,1,'LV07',1,NULL),(55,1,'/Latvia/Annet/Sloka/',455440,'Sloka',56.953602,23.618099,1,'LV06',1,NULL),(56,1,'/Latvia/Annet/Vircava/',454107,'Vircava',56.559700,23.771900,1,'LV08',1,NULL),(57,1,'/Latvia/Riga_fylke/Inciems/',459564,'Inciems',57.257500,24.882799,1,'LV09',1,NULL),(58,1,'/Latvia/Cesu/Melturi/',457421,'Melturi',57.200001,25.233299,1,'LV10',1,NULL),(59,1,'/Latvia/Ogres/Kaibala/',459182,'Kaibala',56.700802,24.873899,1,'LV11',1,NULL),(60,1,'/Latvia/Cesu/Zariņi/',453948,'Zariņi',57.383301,25.533300,1,'LV13',1,NULL),(61,1,'/Latvia/Annet/Kalnciems/',459102,'Kalnciens',56.801102,23.609699,1,'LV14',1,NULL),(62,1,'/Latvia/Limbažu/Vitrupe/',454056,'Vitrupe',57.595798,24.520800,1,'LV15',1,NULL),(63,1,'/Latvia/Valkas/Strenči/',455166,'Strenči',57.625702,25.685400,1,'LV17',1,NULL),(64,1,'/Latvia/Tukuma/Pūre/',456420,'Pūre',57.035198,22.910299,1,'LV19',1,NULL),(65,1,'/Latvia/Ventspils_fylke/Pope/',456550,'Pope',57.397999,21.852400,1,'LV20',1,NULL),(66,1,'/Latvia/Annet/Annenieki/',461464,'Annenieki',56.672199,23.089701,1,'LV21',1,NULL),(67,1,'/Latvia/Kuldigas/Rudbārži/',456044,'Rudbārži',56.650002,21.883301,1,'LV23',1,NULL),(68,1,'/Latvia/Aizkraukles/Rīteri/',456140,'Ādmiņi',56.599998,25.516701,1,'LV24',1,NULL),(69,1,'/Latvia/Jekabpils/Atašiene/',461349,'Atašiene',56.545700,26.399599,1,'LV25',1,NULL),(70,1,'/Latvia/Preilu/Līvāni/',457860,'Līvāni',56.354301,26.175800,1,'LV28',1,NULL),(71,1,'/Latvia/Daugavpils/Daugavpils~460413/',460413,'Daugavpils',55.883301,26.533300,1,'LV29',1,4),(72,1,'/Latvia/Kraslavas/Krāslava/',458623,'Krāslava',55.895100,27.167999,1,'LV30',1,NULL),(73,1,'/Latvia/Annet/Dalbe/',460460,'Dalbe',56.740101,23.896999,1,'LV42',1,NULL),(74,1,'/Latvia/Aluksnes/Vireši/',454103,'Vireši',57.454700,26.367500,1,'LV33',1,NULL),(75,1,'/Latvia/Annet/Lāči/',458352,'Lāči',56.849998,23.366699,1,'LV35',1,NULL),(76,1,'/Latvia/Rezekne_fylke/Feimaņi/',459952,'Freimaņi',56.266701,27.049999,1,'LV34',1,NULL),(77,1,'/Latvia/Liepajas_fylke/Kalvene/',459050,'Kalvene',56.616699,21.700001,1,'LV36',1,NULL),(78,1,'/Latvia/Riga_fylke/Garkalne~456089/',456089,'Garkalne',57.046101,24.421400,1,'LV38',1,NULL),(79,1,'/Latvia/Cesu/Stalbe/',455293,'Stalbe',57.370701,25.031099,1,'LV37',1,NULL),(80,1,'/Latvia/Annet/Ķemeri/',458871,'Ķemeri',56.945000,23.487200,1,'LV39',1,NULL),(81,1,'/Latvia/Aizkraukles/Mucenieki/',457254,'Mucenieki',56.700001,25.116699,0,'LV40',0,NULL),(82,1,'/Latvia/Annet/Apšupe/',461409,'Apšupe',56.781399,23.353100,1,'LV45',1,NULL),(83,1,'/Latvia/Riga_fylke/Ādaži/',461650,'Ādaži',57.075802,24.321400,1,'LV41',1,NULL),(84,1,'/Latvia/Rezekne_fylke/Viļāni/',454178,'Viļāni',56.552502,26.924500,1,'LV46',1,NULL),(85,1,'/Latvia/Liepajas_fylke/Nīca/',457142,'Nīca',56.346001,21.063999,1,'LV47',1,NULL),(86,1,'/Latvia/Ludzas/Kārsava/',458972,'Kārsava',56.784100,27.688299,1,'LV48',1,NULL),(87,1,'/Latvia/Daugavpils_fylke/Nīcgale/',457141,'Nīcgale',56.150002,26.350000,1,'LV49',1,NULL),(88,1,'/Latvia/Cesu/Rauna/',456272,'Rauna',57.331699,25.609501,1,'LV50',1,NULL),(89,1,'/Latvia/Bauskas/Dzimtmisa/',457288,'Bērziņi',56.681900,24.247200,0,'LV51',0,NULL),(90,1,'/Latvia/Aluksnes/Alūksne/',461528,'Alūksne',57.416698,27.049999,1,NULL,1,1),(91,1,'/Latvia/Aizkraukles/Skrīveri/',455523,'Skrīveri',56.645000,25.120600,1,NULL,1,19);
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `radar_readings`
--

DROP TABLE IF EXISTS `radar_readings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `radar_readings` (
  `reading_id` int(11) NOT NULL AUTO_INCREMENT,
  `date_obtained` datetime NOT NULL,
  `source_type_id` int(11) NOT NULL,
  `image_bytes` longblob NOT NULL,
  PRIMARY KEY (`reading_id`),
  KEY `source_type_id` (`source_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `radar_readings`
--

LOCK TABLES `radar_readings` WRITE;
/*!40000 ALTER TABLE `radar_readings` DISABLE KEYS */;
/*!40000 ALTER TABLE `radar_readings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `readings`
--

DROP TABLE IF EXISTS `readings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `readings` (
  `reading_id` int(11) NOT NULL AUTO_INCREMENT,
  `location_id` int(11) NOT NULL,
  `temperature` decimal(5,2) DEFAULT NULL,
  `date_obtained` datetime NOT NULL,
  `source_type_id` int(11) NOT NULL,
  `wind_direction` varchar(20) DEFAULT NULL,
  `wind_speed` decimal(5,2) DEFAULT NULL,
  `humidity` int(11) DEFAULT NULL,
  `condition_type_id` int(11) NOT NULL,
  `date_measured` datetime DEFAULT NULL,
  `temperature_delta` decimal(5,2) DEFAULT NULL,
  `visibility` int(11) DEFAULT NULL,
  `dew_point` decimal(5,2) DEFAULT NULL,
  `wind_speed_max` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`reading_id`),
  KEY `source_type_id` (`source_type_id`),
  KEY `location_id` (`location_id`),
  KEY `condition_type_fk` (`condition_type_id`),
  CONSTRAINT `readings_ibfk_1` FOREIGN KEY (`source_type_id`) REFERENCES `source_types` (`type_id`),
  CONSTRAINT `readings_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `locations` (`location_id`),
  CONSTRAINT `readings_ibfk_3` FOREIGN KEY (`condition_type_id`) REFERENCES `condition_types` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=434 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `readings`
--

LOCK TABLES `readings` WRITE;
/*!40000 ALTER TABLE `readings` DISABLE KEYS */;
INSERT INTO `readings` VALUES (342,51,'13.30','2011-09-23 00:02:15',3,'SW','4.30',80,1,'2011-09-23 11:55:15','0.40',2000,'10.00','9.60'),(343,38,'11.50','2011-09-23 00:02:15',3,'W','0.00',93,1,'2011-09-23 11:59:15','0.10',888,'10.50','0.00'),(344,52,'12.30','2011-09-23 00:02:15',3,'SW','2.70',90,1,'2011-09-23 11:54:15','-0.40',NULL,'10.70','5.20'),(345,53,'12.30','2011-09-23 00:02:15',3,NULL,NULL,99,1,'2011-09-23 11:56:15','-0.30',NULL,'12.10',NULL),(346,9,'13.10','2011-09-23 00:02:15',3,NULL,NULL,80,1,'2011-09-23 11:56:15','0.20',NULL,'9.80',NULL),(347,54,'13.30','2011-09-23 00:02:15',3,'SW','1.60',81,1,'2011-09-23 11:57:15','-0.70',NULL,'10.00','6.20'),(348,56,'12.50','2011-09-23 00:02:15',3,'SW','3.70',85,1,'2011-09-23 11:57:15','-0.30',NULL,'10.10','7.00'),(349,57,'12.10','2011-09-23 00:02:15',3,'SW','3.70',97,1,'2011-09-23 11:53:15','-0.20',2000,'11.70','6.60'),(350,58,'12.00','2011-09-23 00:02:15',3,'W','2.20',100,1,'2011-09-23 11:57:15','0.20',NULL,'12.00','7.60'),(351,59,'11.70','2011-09-23 00:02:15',3,'SW',NULL,NULL,1,'2011-09-23 11:59:15','-0.10',NULL,NULL,NULL),(352,60,'13.00','2011-09-23 00:02:15',3,'W','0.70',81,1,'2011-09-23 00:01:15','0.00',2000,'9.80','0.80'),(353,61,'11.40','2011-09-23 00:02:15',3,NULL,NULL,90,1,'2011-09-23 00:01:15','-0.50',NULL,'9.70',NULL),(354,62,'13.60','2011-09-23 00:02:15',3,'W','5.30',83,1,'2011-09-23 11:54:15','-0.40',2000,'10.80','7.70'),(355,47,'11.80','2011-09-23 00:02:15',3,'SW','1.80',92,1,'2011-09-23 00:00:15','-0.20',2000,'10.50','3.90'),(356,63,'12.40','2011-09-23 00:02:15',3,'SW','1.00',94,1,'2011-09-23 11:57:15','0.30',NULL,'11.50','3.50'),(357,41,'11.60','2011-09-23 00:02:15',3,'S','1.90',87,1,'2011-09-23 11:58:15','-0.20',NULL,'9.60','4.30'),(358,64,'10.50','2011-09-23 00:02:15',3,'S','2.00',96,1,'2011-09-23 00:01:15','-0.90',NULL,'9.90','4.40'),(359,65,'11.50','2011-09-23 00:02:15',3,'SW','0.90',95,1,'2011-09-23 11:54:15','0.70',NULL,'10.70','2.80'),(360,66,'11.80','2011-09-23 00:02:15',3,'NW','3.90',91,1,'2011-09-23 00:00:15','-0.20',NULL,'10.50','7.20'),(361,67,'10.70','2011-09-23 00:02:15',3,'SW','3.40',100,1,'2011-09-23 11:52:15','-0.80',2000,'10.70','5.80'),(362,68,'12.10','2011-09-23 00:02:15',3,'SW','2.40',84,1,'2011-09-23 11:51:15','-0.40',2000,'9.60','4.90'),(363,69,'12.00','2011-09-23 00:02:15',3,'SW','2.60',89,1,'2011-09-23 11:52:15','-1.00',2000,'10.30','4.00'),(364,33,'13.00','2011-09-23 00:02:15',3,'W','2.90',85,1,'2011-09-23 11:56:15','-0.50',2000,'10.60','7.20'),(365,70,'12.70','2011-09-23 00:02:15',3,'SW',NULL,88,1,'2011-09-23 11:54:15','-0.70',NULL,'10.90',NULL),(366,71,'13.30','2011-09-23 00:02:15',3,'SW',NULL,85,1,'2011-09-23 11:53:15','-0.70',NULL,'10.80',NULL),(367,72,'12.40','2011-09-23 00:02:15',3,'SW',NULL,87,1,'2011-09-23 11:58:15','-1.60',NULL,'10.30',NULL),(368,16,'11.40','2011-09-23 00:02:15',3,NULL,NULL,92,1,'2011-09-23 11:52:15','-0.90',2000,'10.20',NULL),(369,42,'10.30','2011-09-23 00:02:15',3,'SW','2.10',98,1,'2011-09-23 11:51:15','-0.70',2000,'9.90','4.80'),(370,73,'12.00','2011-09-23 00:02:15',3,'SW','2.10',90,1,'2011-09-23 11:53:15','-0.30',NULL,'10.50','4.80'),(371,74,'11.80','2011-09-23 00:02:15',3,'SW','1.00',92,1,'2011-09-23 00:00:15','-0.40',2000,'10.50','2.50'),(372,75,'11.10','2011-09-23 00:02:15',3,'SE','1.90',95,1,'2011-09-23 11:56:15','-1.00',NULL,'10.30','4.10'),(373,76,'12.30','2011-09-23 00:02:15',3,'SW','0.60',89,1,'2011-09-23 11:54:15','-1.20',2000,'10.60','2.50'),(374,77,'10.40','2011-09-23 00:02:15',3,'SW','0.00',95,1,'2011-09-23 00:00:15','-0.90',2000,'9.60','0.00'),(375,78,'12.60','2011-09-23 00:02:15',3,'N',NULL,91,1,'2011-09-23 11:56:15','0.50',2000,'11.20',NULL),(376,79,'12.00','2011-09-23 00:02:15',3,'W','0.90',94,1,'2011-09-23 11:53:15','-0.10',2000,'11.10','3.80'),(377,80,'10.60','2011-09-23 00:02:15',3,NULL,NULL,98,1,'2011-09-23 11:58:15','-1.20',2000,'10.30',NULL),(378,81,'12.00','2011-09-23 00:02:15',3,NULL,NULL,98,1,'2011-09-23 11:59:15','-0.10',2000,'11.70',NULL),(379,40,'13.00','2011-09-23 00:02:15',3,'W','0.00',81,1,'2011-09-23 11:57:15','-0.70',2000,'9.80','0.20'),(380,82,'11.50','2011-09-23 00:02:15',3,'SW','3.20',95,1,'2011-09-23 11:53:15','-0.80',2000,'10.80','5.00'),(381,83,'12.60','2011-09-23 00:02:15',3,'SW','3.10',89,1,'2011-09-23 11:54:15','-0.40',2000,'10.80','5.30'),(382,84,'12.80','2011-09-23 00:02:15',3,'SW','4.70',87,1,'2011-09-23 11:57:15','-0.80',2000,'10.80','8.40'),(383,85,'12.70','2011-09-23 00:02:15',3,'W',NULL,83,1,'2011-09-23 00:00:15','-0.30',2000,'9.90',NULL),(384,86,'13.50','2011-09-23 00:02:15',3,NULL,NULL,84,1,'2011-09-23 11:55:15','-0.70',2000,'10.90',NULL),(385,87,'13.10','2011-09-23 00:02:15',3,'SW','2.20',86,1,'2011-09-23 11:52:15','0.00',2000,'10.90','5.60'),(386,88,'11.50','2011-09-23 00:02:15',3,'W','0.00',90,1,'2011-09-23 00:01:15','0.20',2000,'10.00','0.00'),(387,89,'11.70','2011-09-23 00:02:15',3,'W','0.00',93,1,'2011-09-23 11:54:15','-0.40',2000,'10.70','0.00'),(388,51,'13.30','2011-09-23 00:12:32',3,'SW','3.80',81,1,'2011-09-23 00:05:32','0.40',2000,'10.10','7.80'),(389,38,'11.50','2011-09-23 00:12:32',3,'W','0.00',93,1,'2011-09-23 11:59:32','0.10',888,'10.50','0.00'),(390,52,'12.30','2011-09-23 00:12:32',3,'SW','3.20',89,1,'2011-09-23 00:05:32','-0.40',NULL,'10.50','6.80'),(391,53,'12.30','2011-09-23 00:12:32',3,NULL,NULL,98,1,'2011-09-23 00:06:32','-0.30',NULL,'12.00',NULL),(392,9,'13.10','2011-09-23 00:12:32',3,NULL,NULL,80,1,'2011-09-23 11:56:32','0.20',NULL,'9.80',NULL),(393,54,'13.30','2011-09-23 00:12:32',3,'S','1.80',78,1,'2011-09-23 00:08:32','-0.70',NULL,'9.60','5.60'),(394,56,'12.70','2011-09-23 00:12:32',3,'SW','3.80',85,1,'2011-09-23 00:07:32','0.00',NULL,'10.20','6.80'),(395,57,'12.00','2011-09-23 00:12:32',3,'SW','3.90',98,1,'2011-09-23 00:03:32','-0.30',2000,'11.70','7.00'),(396,58,'12.00','2011-09-23 00:12:32',3,'SW','1.90',100,1,'2011-09-23 00:08:32','0.10',NULL,'12.00','5.80'),(397,59,'11.90','2011-09-23 00:12:32',3,'SW',NULL,NULL,1,'2011-09-23 00:10:32','0.10',NULL,NULL,NULL),(398,60,'13.00','2011-09-23 00:12:32',3,'W','0.70',81,1,'2011-09-23 00:11:32','0.00',2000,'9.80','0.90'),(399,61,'11.40','2011-09-23 00:12:32',3,NULL,NULL,90,1,'2011-09-23 00:01:32','-0.50',NULL,'9.70',NULL),(400,62,'13.50','2011-09-23 00:12:32',3,'W','5.10',82,1,'2011-09-23 00:05:32','-0.50',2000,'10.60','7.10'),(401,47,'11.80','2011-09-23 00:12:32',3,'SW','1.80',92,1,'2011-09-23 00:00:32','-0.20',2000,'10.50','3.90'),(402,63,'12.40','2011-09-23 00:12:32',3,'SW','1.20',94,1,'2011-09-23 00:07:32','0.30',NULL,'11.50','4.80'),(403,41,'11.60','2011-09-23 00:12:32',3,'S','1.90',87,1,'2011-09-23 11:58:32','-0.20',NULL,'9.60','4.30'),(404,64,'10.30','2011-09-23 00:12:32',3,'S','1.90',97,1,'2011-09-23 00:11:32','-1.00',NULL,'9.80','4.00'),(405,65,'11.60','2011-09-23 00:12:32',3,'SW','1.00',94,1,'2011-09-23 00:05:32','0.90',NULL,'10.60','3.20'),(406,66,'11.60','2011-09-23 00:12:32',3,'NW','4.00',92,1,'2011-09-23 00:11:32','-0.10',NULL,'10.40','7.30'),(407,67,'10.60','2011-09-23 00:12:32',3,'SW','3.00',100,1,'2011-09-23 00:02:32','-0.80',2000,'10.60','4.90'),(408,68,'12.20','2011-09-23 00:12:32',3,'SW','2.70',85,1,'2011-09-23 00:02:32','-0.10',2000,'9.70','5.90'),(409,69,'11.90','2011-09-23 00:12:32',3,'SW','2.70',89,1,'2011-09-23 00:03:32','-1.10',2000,'10.10','4.40'),(410,33,'13.00','2011-09-23 00:12:32',3,'W','2.90',85,1,'2011-09-23 00:06:32','-0.40',2000,'10.60','6.00'),(411,70,'12.70','2011-09-23 00:12:32',3,'SW',NULL,88,1,'2011-09-23 00:04:32','-0.80',NULL,'10.80',NULL),(412,71,'13.20','2011-09-23 00:12:32',3,'SW',NULL,85,1,'2011-09-23 00:03:32','-0.30',NULL,'10.60',NULL),(413,72,'12.40','2011-09-23 00:12:32',3,'SW',NULL,87,1,'2011-09-23 00:08:32','-1.30',NULL,'10.20',NULL),(414,16,'11.30','2011-09-23 00:12:32',3,NULL,NULL,92,1,'2011-09-23 00:03:32','-1.00',2000,'10.10',NULL),(415,42,'10.20','2011-09-23 00:12:32',3,'SW','2.50',98,1,'2011-09-23 00:02:32','-0.70',2000,'9.90','4.80'),(416,73,'11.90','2011-09-23 00:12:32',3,'SW','2.00',90,1,'2011-09-23 00:03:32','-0.40',NULL,'10.40','4.80'),(417,74,'11.80','2011-09-23 00:12:32',3,'SW','1.00',91,1,'2011-09-23 00:11:32','0.00',2000,'10.40','3.10'),(418,75,'11.10','2011-09-23 00:12:32',3,'SE','1.70',96,1,'2011-09-23 00:07:32','-0.90',NULL,'10.40','3.50'),(419,76,'12.30','2011-09-23 00:12:32',3,'SW','0.60',89,1,'2011-09-23 11:54:32','-1.20',2000,'10.60','2.50'),(420,77,'10.20','2011-09-23 00:12:32',3,'SW','0.00',95,1,'2011-09-23 00:10:32','-0.90',2000,'9.50','0.00'),(421,78,'12.60','2011-09-23 00:12:32',3,'N',NULL,90,1,'2011-09-23 00:06:32','0.50',2000,'11.10',NULL),(422,79,'11.90','2011-09-23 00:12:32',3,'W','0.90',94,1,'2011-09-23 00:03:32','-0.20',2000,'11.00','4.00'),(423,80,'10.40','2011-09-23 00:12:32',3,NULL,NULL,98,1,'2011-09-23 00:08:32','-1.40',2000,'10.20',NULL),(424,81,'12.00','2011-09-23 00:12:32',3,NULL,NULL,98,1,'2011-09-23 00:08:32','-0.10',2000,'11.60',NULL),(425,40,'13.00','2011-09-23 00:12:32',3,'W','0.00',81,1,'2011-09-23 00:07:32','-0.70',2000,'9.90','0.20'),(426,82,'11.50','2011-09-23 00:12:32',3,'SW','3.50',95,1,'2011-09-23 00:03:32','-0.60',2000,'10.70','6.40'),(427,83,'12.40','2011-09-23 00:12:32',3,'SW','2.90',89,1,'2011-09-23 00:05:32','-0.60',2000,'10.70','6.10'),(428,84,'12.70','2011-09-23 00:12:32',3,'SW','4.30',87,1,'2011-09-23 00:07:32','-0.90',2000,'10.50','6.20'),(429,85,'12.60','2011-09-23 00:12:32',3,'W',NULL,83,1,'2011-09-23 00:11:32','-0.20',2000,'9.80',NULL),(430,86,'13.50','2011-09-23 00:12:32',3,NULL,NULL,83,1,'2011-09-23 00:06:32','-0.70',2000,'10.80',NULL),(431,87,'13.20','2011-09-23 00:12:32',3,'SW','1.90',86,1,'2011-09-23 00:03:32','0.10',2000,'10.90','5.00'),(432,88,'11.70','2011-09-23 00:12:32',3,'W','0.00',89,1,'2011-09-23 00:11:32','0.40',2000,'10.00','0.00'),(433,89,'11.80','2011-09-23 00:12:32',3,'W','0.00',93,1,'2011-09-23 00:04:32','-0.20',2000,'10.70','0.00');
/*!40000 ALTER TABLE `readings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `source_types`
--

DROP TABLE IF EXISTS `source_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `source_types` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `source_types`
--

LOCK TABLES `source_types` WRITE;
/*!40000 ALTER TABLE `source_types` DISABLE KEYS */;
INSERT INTO `source_types` VALUES (1,'GOOGLE'),(2,'YR_NO'),(3,'LATVIAN_STATE_ROADS'),(4,'METEO_LV');
/*!40000 ALTER TABLE `source_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `latest_readings`
--

/*!50001 DROP TABLE IF EXISTS `latest_readings`*/;
/*!50001 DROP VIEW IF EXISTS `latest_readings`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `latest_readings` AS select `r`.`reading_id` AS `reading_id`,`r`.`location_id` AS `location_id`,`r`.`temperature` AS `temperature`,`r`.`date_obtained` AS `date_obtained`,`r`.`source_type_id` AS `source_type_id`,`r`.`wind_direction` AS `wind_direction`,`r`.`wind_speed` AS `wind_speed`,`r`.`humidity` AS `humidity`,`r`.`condition_type_id` AS `condition_type_id` from (`readings` `r` left join `readings` `rl` on(((`rl`.`date_obtained` > `r`.`date_obtained`) and (`r`.`location_id` = `rl`.`location_id`)))) where isnull(`rl`.`location_id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-09-23 19:35:13

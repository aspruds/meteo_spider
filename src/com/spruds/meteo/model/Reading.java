package com.spruds.meteo.model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import org.hibernate.annotations.Parameter;
import org.hibernate.annotations.Type;

@Entity
@Table(name="readings")
public class Reading implements Serializable {
    @Id
    @Column(name="READING_ID")
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id;

    @ManyToOne( cascade = {CascadeType.PERSIST, CascadeType.MERGE} )
    @JoinColumn(name="LOCATION_ID")
    private Location location;

    @Type(
        type = "com.spruds.meteo.model.types.GenericEnumUserType",
        parameters = {
                @Parameter(name  = "enumClass", value = "com.spruds.meteo.model.SourceType"),
                @Parameter(name  = "identifierMethod", value = "getValue"),
                @Parameter(name  = "valueOfMethod", value = "valueOf")
        }
    )
    @Column(name="SOURCE_TYPE_ID")
    private SourceType source;

    @Type(
        type = "com.spruds.meteo.model.types.GenericEnumUserType",
        parameters = {
                @Parameter(name  = "enumClass", value = "com.spruds.meteo.model.ConditionType"),
                @Parameter(name  = "identifierMethod", value = "getValue"),
                @Parameter(name  = "valueOfMethod", value = "valueOf")
        }
    )
    @Column(name="CONDITION_TYPE_ID")
    private ConditionType conditionType;

    @Column(name="TEMPERATURE")
    private Float temperature;

    @Column(name="TEMPERATURE_DELTA")
    private Float temperatureDelta;

    @Column(name="DEW_POINT")
    private Float dewPoint;

    @Column(name="WIND_DIRECTION")
    private String windDirection;

    @Column(name="WIND_SPEED")
    private Float windSpeed;

    @Column(name="WIND_SPEED_MAX")
    private Float windSpeedMax;

    @Column(name="HUMIDITY")
    private Integer humidity;

    @Column(name="VISIBILITY")
    private Integer visibility;

    @Column(name="DATE_OBTAINED")
    @Temporal(javax.persistence.TemporalType.TIMESTAMP)
    private Date dateObtained;

    @Column(name="DATE_MEASURED")
    @Temporal(javax.persistence.TemporalType.TIMESTAMP)
    private Date dateMeasured;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Location getLocation() {
        return location;
    }

    public void setLocation(Location location) {
        this.location = location;
    }

    public Float getTemperature() {
        return temperature;
    }

    public void setTemperature(Float temperature) {
        this.temperature = temperature;
    }

    public Date getDateObtained() {
        return dateObtained;
    }

    public void setDateObtained(Date dateObtained) {
        this.dateObtained = dateObtained;
    }

    public SourceType getSource() {
        return source;
    }

    public void setSource(SourceType source) {
        this.source = source;
    }

    public String getWindDirection() {
        return windDirection;
    }

    public void setWindDirection(String windDirection) {
        this.windDirection = windDirection;
    }

    public Float getWindSpeed() {
        return windSpeed;
    }

    public void setWindSpeed(Float windSpeed) {
        this.windSpeed = windSpeed;
    }

    public Integer getHumidity() {
        return humidity;
    }

    public void setHumidity(Integer humidity) {
        this.humidity = humidity;
    }

    public ConditionType getConditionType() {
        return conditionType;
    }

    public void setConditionType(ConditionType conditionType) {
        this.conditionType = conditionType;
    }

    public Date getDateMeasured() {
        return dateMeasured;
    }

    public void setDateMeasured(Date dateMeasured) {
        this.dateMeasured = dateMeasured;
    }

    public Float getTemperatureDelta() {
        return temperatureDelta;
    }

    public void setTemperatureDelta(Float temperatureDelta) {
        this.temperatureDelta = temperatureDelta;
    }

    public Integer getVisibility() {
        return visibility;
    }

    public void setVisibility(Integer visibility) {
        this.visibility = visibility;
    }

    public Float getDewPoint() {
        return dewPoint;
    }

    public void setDewPoint(Float dewPoint) {
        this.dewPoint = dewPoint;
    }

    public Float getWindSpeedMax() {
        return windSpeedMax;
    }

    public void setWindSpeedMax(Float windSpeedMax) {
        this.windSpeedMax = windSpeedMax;
    }
}

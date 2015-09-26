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
@Table(name="forecasts")
public class Forecast implements Serializable {
    @Id
    @Column(name="FORECAST_ID")
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

    @Column(name="DATE_OBTAINED")
    @Temporal(javax.persistence.TemporalType.TIMESTAMP)
    private Date dateObtained;
    
    @Column(name="FORECAST_DATA")
    private String data;

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

    public SourceType getSource() {
        return source;
    }

    public void setSource(SourceType source) {
        this.source = source;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public Date getDateObtained() {
        return dateObtained;
    }

    public void setDateObtained(Date dateObtained) {
        this.dateObtained = dateObtained;
    }
}

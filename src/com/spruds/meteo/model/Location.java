package com.spruds.meteo.model;

import java.io.Serializable;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="locations")
public class Location implements Serializable {
    @Id
    @Column(name="LOCATION_ID")
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id;

    @ManyToOne( cascade = {CascadeType.PERSIST, CascadeType.MERGE} )
    @JoinColumn(name="COUNTRY_ID")
    private Country country;

    @Column(name="YR_NO_URL")
    private String yrNoUrl;

    @Column(name="NAME")
    private String name;

    @Column(name="GEONAMES_ID")
    private Long geonamesId;

    @Column(name="LATITUDE")
    private Float latitude;

    @Column(name="LONGITUDE")
    private Float longitude;

    @Column(name="IS_ENABLED")
    private boolean enabled;

    @Column(name="USE_GOOGLE")
    private boolean useGoogle;

    @Column(name="LATVIAN_STATE_ROADS_ID")
    private String latvianStateRoadsId;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Country getCountry() {
        return country;
    }

    public void setCountry(Country country) {
        this.country = country;
    }

    public String getYrNoUrl() {
        return yrNoUrl;
    }

    public void setYrNoUrl(String yrNoUrl) {
        this.yrNoUrl = yrNoUrl;
    }

    public Long getGeonamesId() {
        return geonamesId;
    }

    public void setGeonamesId(Long geonamesId) {
        this.geonamesId = geonamesId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String toString() {
        StringBuilder builder = new StringBuilder();
        builder.append("Location[id=");
        builder.append(id);
        builder.append(",name=");
        builder.append(name);
        builder.append("]");
        return builder.toString();
    }

    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    public Float getLatitude() {
        return latitude;
    }

    public void setLatitude(Float latitude) {
        this.latitude = latitude;
    }

    /**
     * @return the longitude
     */
    public Float getLongitude() {
        return longitude;
    }

    /**
     * @param longitude the longitude to set
     */
    public void setLongitude(Float longitude) {
        this.longitude = longitude;
    }

    /**
     * @return the useGoogle
     */
    public boolean isUseGoogle() {
        return useGoogle;
    }

    /**
     * @param useGoogle the useGoogle to set
     */
    public void setUseGoogle(boolean useGoogle) {
        this.useGoogle = useGoogle;
    }

    public String getLatvianStateRoadsId() {
        return latvianStateRoadsId;
    }

    public void setLatvianStateRoadsId(String latvianStateRoadsId) {
        this.latvianStateRoadsId = latvianStateRoadsId;
    }
}

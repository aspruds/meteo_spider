package com.spruds.meteo.model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import org.hibernate.annotations.Parameter;
import org.hibernate.annotations.Type;

@Entity
@Table(name="radar_readings")
public class RadarReading implements Serializable {
    @Id
    @Column(name="READING_ID")
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id;

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

    @Column(name="IMAGE_BYTES")
    private byte[] imageBytes;

    @Column(name="DATE_OBTAINED")
    @Temporal(javax.persistence.TemporalType.TIMESTAMP)
    private Date dateObtained;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public byte[] getImageBytes() {
        return imageBytes;
    }

    public void setImageBytes(byte[] imageBytes) {
        this.imageBytes = imageBytes;
    }
}

package com.spruds.meteo.service.data;

import com.spruds.meteo.model.Forecast;
import com.spruds.meteo.model.Location;
import com.spruds.meteo.model.Reading;
import com.spruds.meteo.service.xml.YrDataProvider;
import com.spruds.meteo.utils.DateUtils;
import java.sql.SQLException;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;

public class ForecastService {
    private HibernateTemplate template;
    private YrDataProvider yrDataProvider;
    private static final long MAX_AGE_IN_MINUTES = 30;
    
    public void save(Reading reading) {
        template.save(reading);
    }

    public Forecast getForecast(Location location) {
        Forecast latestForecast = getLatestForecast();
        if(latestForecast == null) {
            latestForecast = yrDataProvider.getData(location);
            template.save(latestForecast);
        }

        if(DateUtils.getAgeInMinutes(latestForecast.getDateObtained()) > MAX_AGE_IN_MINUTES) {
            Forecast updatedForecast = yrDataProvider.getData(location);
            latestForecast.setData(updatedForecast.getData());
            latestForecast.setDateObtained(updatedForecast.getDateObtained());
            template.update(latestForecast);
        }

        return latestForecast;
    }

    private Forecast getLatestForecast() {
        return (Forecast) template.execute(new HibernateCallback() {
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                Criteria crit = session.createCriteria(Forecast.class);
                crit.addOrder(Order.desc("dateObtained"));
                crit.setMaxResults(1);
                return crit.uniqueResult();
            }
        });
    }

    public void setTemplate(HibernateTemplate template) {
        this.template = template;
    }

    /**
     * @param yrDataProvider the yrDataProvider to set
     */
    public void setYrDataProvider(YrDataProvider yrDataProvider) {
        this.yrDataProvider = yrDataProvider;
    }
}

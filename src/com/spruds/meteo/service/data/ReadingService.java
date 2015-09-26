package com.spruds.meteo.service.data;

import com.spruds.meteo.model.Location;
import com.spruds.meteo.model.Reading;
import java.sql.SQLException;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;

public class ReadingService {
    private HibernateTemplate template;

    public void save(Reading reading) {
        template.save(reading);
    }

    public List<Reading> getLatestReadings() {
        return (List<Reading>) template.execute(new HibernateCallback() {
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                Query query = session.createSQLQuery("SELECT * FROM latest_readings ORDER BY location_id ASC").addEntity(Reading.class);
                return query.list();
            }
        });
    }

    public void setTemplate(HibernateTemplate template) {
        this.template = template;
    }
}

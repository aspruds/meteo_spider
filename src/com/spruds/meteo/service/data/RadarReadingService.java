package com.spruds.meteo.service.data;

import com.spruds.meteo.model.RadarReading;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;

public class RadarReadingService {
    private HibernateTemplate template;

    public void save(RadarReading reading) {
        template.save(reading);
    }

    public List<RadarReading> getLatestReadings() {
        DetachedCriteria crit = DetachedCriteria.forClass(RadarReading.class);
        crit.addOrder(Order.desc("dateObtained"));
        
        // find first 10 results
        return template.findByCriteria(crit, 0, 10);
    }

    public void purgeReadings() {
        Calendar currentDate = Calendar.getInstance();
        currentDate.add(Calendar.DATE, -7);
        final Date oneWeekAgo = currentDate.getTime();

        template.execute(new HibernateCallback() {
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                Query query = session.createQuery("DELETE FROM RadarReading WHERE dateObtained < :dateObtained");
                query.setDate("dateObtained", oneWeekAgo);
                return query.executeUpdate();
            }
        });
    }

    public void setTemplate(HibernateTemplate template) {
        this.template = template;
    }
}

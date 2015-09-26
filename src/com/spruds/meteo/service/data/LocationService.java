package com.spruds.meteo.service.data;

import com.spruds.meteo.model.Location;
import java.sql.SQLException;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;

public class LocationService {
    private HibernateTemplate template;

    public List<Location> getGoogleSupportedLocations() {
        return template.find("from Location WHERE useGoogle=true");
    }

    public Location findLocationByStateRoadsCode(final String code) {
        return (Location) template.execute(new HibernateCallback() {
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                Criteria crit = session.createCriteria(Location.class);
                crit.add(Restrictions.eq("latvianStateRoadsId", code));
                return crit.uniqueResult();
            }
        });
    }

    /**
     * @param template the template to set
     */
    public void setTemplate(HibernateTemplate template) {
        this.template = template;
    }
}

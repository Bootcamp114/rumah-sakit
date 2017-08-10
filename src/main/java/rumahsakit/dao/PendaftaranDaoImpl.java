package rumahsakit.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import rumahsakit.model.Pendaftaran;

@Repository
public class PendaftaranDaoImpl implements PendaftaranDao {

	@Autowired
	public SessionFactory sessionFactory;

	@Override
	public void save(Pendaftaran pen) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(pen);
		session.flush();
	}

}

package rumahsakit.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import rumahsakit.model.Pasien;
import rumahsakit.model.Poli;

public class RekamjejakDaoImpl implements RekamjejakDao {
	
	@Autowired
	public SessionFactory sessionFactory;

	@Override
	public List<Pasien> getByNoIdentitas(String noIdentitas) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		List<Pasien> list = session.createQuery("from " + Pasien.class.getName() + " where noidentitas = '" + noIdentitas + "'").list();
		return list;
	}

	@Override
	public List<Poli> getByPoli(String poli) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		List<Poli> list = session.createQuery("from " + Poli.class.getName() + " where poli = '" + poli + "'").list();
		return list;
	}

}

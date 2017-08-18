package rumahsakit.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import rumahsakit.model.Pasien;
import rumahsakit.model.Poli;

@Repository
public class PoliDaoImpl implements PoliDao {

	@Autowired
	public SessionFactory sessionFactory;

	@Override
	public void save(Poli pol) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(pol);
		session.flush();
	}

	@Override
	public void update(Poli pol) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.update(pol);
		session.flush();
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Poli pol = new Poli();
		pol.setId(id);
		session.delete(pol);
		session.flush();
	}

	@Override
	public Poli getById(int id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Poli pol = session.get(Poli.class, id);
		return pol;
	}

	@Override
	public List<Poli> getAllPoli() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		List<Poli> list = session.createCriteria(Poli.class).list();
		return list;
	}

}

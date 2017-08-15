package rumahsakit.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import rumahsakit.model.Resep;

@Repository
public class ResepDaoImpl implements ResepDao{

	private SessionFactory sessionFactory;
	
	
	@Override
	public void save(Resep resep) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(resep);
		session.flush();
	}

	@Override
	public void update(Resep resep) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.update(resep);
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Resep resep = new Resep();
		resep.setId(id);
		session.delete(resep);
		session.flush();
	}

	@Override
	public Resep getResepById(int id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Resep resep = session.get(Resep.class, id);
		return resep;
	}

	@Override
	public List<Resep> getAllResepByNoDaftar() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		List<Resep> listResep = session.createCriteria(Resep.class).list();
		return listResep;
	}

}

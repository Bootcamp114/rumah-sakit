package rumahsakit.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import rumahsakit.model.Apoteker;

@Repository
public class ApotekerDaoImpl implements ApotekerDao {
	
	@Autowired
	SessionFactory sessionFactory;

	@Override
	public void save(Apoteker apo) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(apo);
		session.flush();
	}

	@Override
	public void update(Apoteker apo) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.update(apo);
		session.flush();
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Apoteker apo = new Apoteker();
		apo.setId(id);
		session.delete(apo);
		session.flush();
	}

	@Override
	public Apoteker getById(int id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Apoteker apo = session.get(Apoteker.class, id);
		return apo;
	}

	@Override
	public List<Apoteker> getAll() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		List<Apoteker> list = session.createCriteria(Apoteker.class).list();
		return list;
	}
	
}

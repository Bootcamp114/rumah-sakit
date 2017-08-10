package rumahsakit.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import rumahsakit.model.Obat;

@Repository
public class ObatDaoImpl implements ObatDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void save(Obat obt) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(obt);
		session.flush();
	}

	@Override
	public void update(Obat obt) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.update(obt);
		session.flush();
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Obat obt = new Obat();
		obt.setId(id);
		session.delete(obt);
		session.flush();
	}

	@Override
	public Obat getById(int id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Obat obt = session.get(Obat.class, id);
		return obt;
	}

	@Override
	public List<Obat> getAll() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		List<Obat> list = session.createCriteria(Obat.class).list();
		return list;
	}

}

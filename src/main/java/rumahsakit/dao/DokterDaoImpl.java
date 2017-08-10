package rumahsakit.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import rumahsakit.model.Dokter;

@Repository
public class DokterDaoImpl implements DokterDao{

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void save(Dokter dokter) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(dokter);
		session.flush();
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Dokter dokter = new Dokter();
		dokter.setId(id);
		session.delete(dokter);
		session.flush();
	}

	@Override
	public void update(Dokter dokter) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.update(dokter);
		session.flush();
	}

	@Override
	public List<Dokter> getAllDokter() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		List<Dokter> listDokter = session.createCriteria(Dokter.class).list();
		return listDokter;
	}

	@Override
	public Dokter getDokterById(int id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Dokter dokter = session.get(Dokter.class, id);
		return dokter;
	}

}

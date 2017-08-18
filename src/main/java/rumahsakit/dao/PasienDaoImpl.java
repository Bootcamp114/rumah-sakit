package rumahsakit.dao;


import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import rumahsakit.model.Pasien;

@Repository
public class PasienDaoImpl implements PasienDao {

	@Autowired
	private SessionFactory sessionFactory;


	public void save(Pasien pas) {
		// TODO Auto-generated method stub
		Session session =  sessionFactory.getCurrentSession();
		session.save(pas);
		session.flush();
		
		
	}


	@Override
	public void update(Pasien pas) {
		// TODO Auto-generated method stub
		Session session =  sessionFactory.getCurrentSession();
		session.update(pas);
		session.flush();
	}

 
	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		Session session =  sessionFactory.getCurrentSession();
		Pasien pas = new Pasien();
		pas.setId(id);
		session.delete(pas);
		session.flush();
	}


	@Override
	public Pasien getById(int id) {
		// TODO Auto-generated method stub
		Session session =  sessionFactory.getCurrentSession();
		Pasien pas = session.get(Pasien.class, id);
		return pas;
	}


	@Override
	public List<Pasien> getAllPasien() {
		// TODO Auto-generated method stub
		Session session =  sessionFactory.getCurrentSession();
		List<Pasien> list = session.createCriteria(Pasien.class).list();
		return list;
	}
	
}

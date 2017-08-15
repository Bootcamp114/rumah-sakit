package rumahsakit.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import rumahsakit.model.Pemeriksaan;

@Repository
public class PemeriksaanDaoImpl implements PemeriksaanDao{

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void save(Pemeriksaan pemeriksaan) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(pemeriksaan);
		session.flush();
	}

	@Override
	public void update(Pemeriksaan pemeriksaan) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.update(pemeriksaan);
		session.flush();
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Pemeriksaan pemeriksaan = new Pemeriksaan();
		pemeriksaan.setId(id);
		session.delete(pemeriksaan);
		session.flush();
	}

	@Override
	public List<Pemeriksaan> getAllPemeriksaan() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		List<Pemeriksaan> listPemeriksaan = session.createCriteria(Pemeriksaan.class).list();
		return listPemeriksaan;
	}

	@Override
	public Pemeriksaan getPemeriksaanById(int id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Pemeriksaan pemeriksaan = session.get(Pemeriksaan.class, id);
		return pemeriksaan;
	}

}

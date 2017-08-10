package rumahsakit.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import rumahsakit.model.JenisPemeriksaan;

@Repository
public class JenisPemeriksaanImpl implements JenisPemeriksaanDao{

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void save(JenisPemeriksaan jenisPemeriksaan) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(jenisPemeriksaan);
		session.flush();
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		JenisPemeriksaan jenisPemeriksaan = new JenisPemeriksaan();
		jenisPemeriksaan.setId(id);
		session.delete(jenisPemeriksaan);
		session.flush();
	}

	@Override
	public void update(JenisPemeriksaan jenisPemeriksaan) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.update(jenisPemeriksaan);
		session.flush();
	}

	@Override
	public JenisPemeriksaan getJenisPemeriksaanById(int id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		JenisPemeriksaan jenisPemeriksaan = session.get(JenisPemeriksaan.class, id);
		return jenisPemeriksaan;
	}

	@Override
	public List<JenisPemeriksaan> getAllJenisPemeriksaan() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		List<JenisPemeriksaan> listJenisPemeriksaan = session.createCriteria(JenisPemeriksaan.class).list();
		return listJenisPemeriksaan;
	}

}

package rumahsakit.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import rumahsakit.model.Pasien;
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

	@Override
	public void update(Pendaftaran pen) {
		// TODO Auto-generated method stub
		Session session =  sessionFactory.getCurrentSession();
		session.update(pen);
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
	public Pendaftaran getById(int id) {
		// TODO Auto-generated method stub
		Session session =  sessionFactory.getCurrentSession();
		Pendaftaran pen = session.get(Pendaftaran.class, id);
		return pen;
	}

	@Override
	public List<Pendaftaran> getAllPendaftaran() {
		// TODO Auto-generated method stub
		Session session =  sessionFactory.getCurrentSession();
		List<Pendaftaran> list = session.createCriteria(Pendaftaran.class).list();
		return list;
	}

}

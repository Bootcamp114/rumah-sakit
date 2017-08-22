package rumahsakit.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import rumahsakit.model.DetailResep;
import rumahsakit.model.PembayaranObat;
@Repository
public class PembayaranDaoImpl implements PembayaranDao {

	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public void save(PembayaranObat pembayaranObat) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(pembayaranObat);
		session.flush();
	}

	@Override
	public List<DetailResep> getByResep(String noResep) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		List<DetailResep> list = session.createQuery("from " + DetailResep.class.getName() + "where id = '"+ noResep + "'").list();
		return list;
	}

}

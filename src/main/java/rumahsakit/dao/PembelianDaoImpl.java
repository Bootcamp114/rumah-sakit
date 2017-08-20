package rumahsakit.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import rumahsakit.model.DetailObat;
import rumahsakit.model.PembelianObat;

@Repository
public class PembelianDaoImpl implements PembelianDao {

	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public void save(DetailObat detail) {
		// TODO Auto-generated method stub
		Session session= sessionFactory.getCurrentSession();
		session.save(detail);
		session.flush();
	}

	@Override
	public List<DetailObat> getAll(String noFaktur) {
		// TODO Auto-generated method stub 
		Session session = sessionFactory.getCurrentSession();
		List<DetailObat> list = session.createQuery("from " + DetailObat.class.getName() + " where PEMBELIANOBAT_ID = '"+ noFaktur +"' ").list();
		return list;
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		DetailObat detail = new DetailObat();
		detail.setId(id);
		session.delete(detail);
		session.flush();
	}

	@Override
	public String hitungDetail() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select sum(total) from " + DetailObat.class.getName());
		List<Long> data = query.list();
		return String.valueOf(data.get(0));
	}

	@Override
	public void pembelian(PembelianObat pem) {
		// TODO Auto-generated method stub
		Session session= sessionFactory.getCurrentSession();
		session.save(pem);
		session.flush();
	}

}

package rumahsakit.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import rumahsakit.model.DetailResep;

@Repository
public class DetailResepDaoImpl implements DetailResepDao{

	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public void saveDetail(DetailResep detailResep) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(detailResep);
		session.flush();
	}

}

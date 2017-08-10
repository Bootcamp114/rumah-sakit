package rumahsakit.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import rumahsakit.model.Supplier;
@Repository
public class SupplierDaoImpl implements SupplierDao{
	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public void save(Supplier supp) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(supp);
		session.flush();
	}

	@Override
	public void update(Supplier supp) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Supplier getById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Supplier> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

}

package rumahsakit.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import rumahsakit.model.Resep;

@Repository
public class ResepDaoImpl implements ResepDao{

	private SessionFactory sessionFactory;
	
	
	@Override
	public void save() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Resep getResepById() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Resep> getAllResepByNoDaftar() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		List<Resep> listResep = session.createCriteria(Resep.class).list();
		return listResep;
	}

}

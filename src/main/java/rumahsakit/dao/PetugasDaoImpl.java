package rumahsakit.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import rumahsakit.model.Petugas;

@Repository
public class PetugasDaoImpl implements PetugasDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void save(Petugas pet) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(pet);
		session.flush();
	}

	@Override
	public void update(Petugas pet) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.update(pet);
		session.flush();
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Petugas pet = new Petugas();
		pet.setId(id);
		session.delete(pet);
		session.flush();
	}

	@Override
	public Petugas getById(int id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Petugas pet = session.get(Petugas.class, id);
		return pet;
	}

	@Override
	public List<Petugas> getAllPetugas() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		List<Petugas> list = session.createCriteria(Petugas.class).list();
		return list;
	}

}

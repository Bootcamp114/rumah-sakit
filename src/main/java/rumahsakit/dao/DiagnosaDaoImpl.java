package rumahsakit.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import rumahsakit.model.Diagnosa;

@Repository
public class DiagnosaDaoImpl implements DiagnosaDao{

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void save(Diagnosa diagnosa) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(diagnosa);
		session.flush();
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Diagnosa diagnosa = new Diagnosa();
		diagnosa.setId(id);
		session.delete(diagnosa);
		session.flush();
	}

	@Override
	public void update(Diagnosa diagnosa) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.update(diagnosa);
		session.flush();
	}

	@Override
	public List<Diagnosa> getAllDiagnosaByNoDiagnosa() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		List<Diagnosa> listDiagnosa = session.createCriteria(Diagnosa.class).list();
		return listDiagnosa;
	}

	@Override
	public Diagnosa getDiagnosaById(int id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Diagnosa diagnosa = session.get(Diagnosa.class, id);
		return diagnosa;
	}

}

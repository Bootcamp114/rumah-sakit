package rumahsakit.dao;

import java.util.List;

import org.hibernate.Query;
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
		Session session = sessionFactory.getCurrentSession();
		List<Diagnosa> listDiagnosa = session.createCriteria(Diagnosa.class).list();
		return listDiagnosa;
	}

	@Override
	public Diagnosa getDiagnosaById(int id) {
		Session session = sessionFactory.getCurrentSession();
		Diagnosa diagnosa = session.get(Diagnosa.class, id);
		return diagnosa;
	}

	@Override
	public List<Diagnosa> listDiagnosaByIdPeriksa(int idPeriksa) throws Exception{
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Diagnosa diagnosa where diagnosa.pemeriksaan.id = :param1");
		query.setInteger("param1", idPeriksa);
		List<Diagnosa> listDiagnosa = query.list();
		return listDiagnosa;
	}

}

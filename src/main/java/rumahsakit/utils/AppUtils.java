package rumahsakit.utils;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class AppUtils {
	
	@Autowired
	private SessionFactory sessionFactory;

	public String getNoUrut(){
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createSQLQuery("select seq_nourut_pendaftaran.nextval from dual");
		 List<Long> data = query.list();
		 
		 return String.valueOf(data.get(0));
	}
	
	public String getNoFaktur(){
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createSQLQuery("select seq_nofaktur_pembelian.nextval from dual");
		 List<Long> data = query.list();
		 
		 return String.valueOf(data.get(0));
	}
	
	public String getNoResep(){
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createSQLQuery("select seq_no_resep.nextval from dual");
		 List<Long> data = query.list();
		 
		 return String.valueOf(data.get(0));
	}
	
	public String getNoPeriksa(){
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createSQLQuery("select seq_no_periksa.nextval from dual");
		 List<Long> data = query.list();
		 
		 return String.valueOf(data.get(0));
	}
	
	public String getNoDiagnosa(){
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createSQLQuery("select seq_no_diagnosa.nextval from dual");
		 List<Long> data = query.list();
		 
		 return String.valueOf(data.get(0));
	}
}

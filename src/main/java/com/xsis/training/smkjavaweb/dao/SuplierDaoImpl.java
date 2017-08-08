package com.xsis.training.smkjavaweb.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xsis.training.smkjavaweb.model.Suplier;

@Repository
public class SuplierDaoImpl implements SuplierDao{

	@Autowired
	SessionFactory sessionFactory;
	
	public void save(Suplier suplier) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(suplier);
		session.flush();
	}

}

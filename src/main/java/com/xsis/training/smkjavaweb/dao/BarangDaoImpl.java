package com.xsis.training.smkjavaweb.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xsis.training.smkjavaweb.model.Barang;

@Repository
public class BarangDaoImpl implements BarangDao{

	@Autowired
	SessionFactory sessionFactory;
	
	public void save(Barang barang) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(barang);
		session.flush();
	}

}

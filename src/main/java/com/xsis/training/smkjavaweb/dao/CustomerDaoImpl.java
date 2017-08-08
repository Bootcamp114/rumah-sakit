package com.xsis.training.smkjavaweb.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xsis.training.smkjavaweb.model.Customer;

@Repository
public class CustomerDaoImpl implements CustomerDao{

	@Autowired
	SessionFactory sessionFactory;
	
	public void save(Customer customer) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(customer);
		session.flush();
	}

	public List<Customer> getAllCustomer() {
		// TODO Auto-generated method stub
		return null;
	}

}

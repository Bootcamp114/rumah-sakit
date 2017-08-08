package com.xsis.training.smkjavaweb.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xsis.training.smkjavaweb.model.Department;

@Repository
public class DepartmentDaoImpl implements DepartmentDao{

	@Autowired
	SessionFactory sessionFactory;
	
	public void save(Department department) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(department);
		session.flush();
	}

	public List<Department> getAllDepartment() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.createCriteria(Department.class).list();
		
	}

}

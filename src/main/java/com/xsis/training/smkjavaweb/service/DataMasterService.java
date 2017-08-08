package com.xsis.training.smkjavaweb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xsis.training.smkjavaweb.dao.DepartmentDao;
import com.xsis.training.smkjavaweb.model.Department;

@Service
@Transactional
public class DataMasterService {
	
	//department data master
	@Autowired
	DepartmentDao departmentDao;

	public void save(Department department) {
		// TODO Auto-generated method stub
		departmentDao.save(department);
	}

	public List<Department> getAllDepartment() {
		// TODO Auto-generated method stub
		return departmentDao.getAllDepartment();
		
	} 
	
}

package com.xsis.training.smkjavaweb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xsis.training.smkjavaweb.dao.EmployeeDao;
import com.xsis.training.smkjavaweb.model.Employee;

@Service
@Transactional
public class EmployeeServiceImpl implements EmployeeService{

	@Autowired
	private EmployeeDao employeeDao;
	
	public void save(Employee employee) {
		// TODO Auto-generated method stub
		employeeDao.save(employee);
		
	}

	public List<Employee> getAllEmployee() {
		// TODO Auto-generated method stub
		return employeeDao.getAllEmployee();
	}

	public void delete(int id) {
		// TODO Auto-generated method stub
		employeeDao.delete(id);
	}

	public Employee getEmployeeById(int id) {
		// TODO Auto-generated method stub
		Employee emp = employeeDao.getEmployeeById(id);
		return emp;
	}

	public void update(Employee emp) {
		// TODO Auto-generated method stub
		employeeDao.update(emp);
	}

}

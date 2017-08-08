package com.xsis.training.smkjavaweb.dao;

import java.util.List;

import com.xsis.training.smkjavaweb.model.Employee;

public interface EmployeeDao {

	//save
	public void save(Employee e);
	//update
	public void update(Employee e);
	//delete
	public void delete(int id);
	//getAll
	public List<Employee> getAllEmployee();
	public Employee getEmployeeById(int id);
}

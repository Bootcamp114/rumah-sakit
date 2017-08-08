package com.xsis.training.smkjavaweb.service;

import java.util.List;

import com.xsis.training.smkjavaweb.model.Employee;

public interface EmployeeService {
	public void save(Employee employee);

	public List<Employee> getAllEmployee();

	public void delete(int id);

	public Employee getEmployeeById(int id);

	public void update(Employee emp);
}

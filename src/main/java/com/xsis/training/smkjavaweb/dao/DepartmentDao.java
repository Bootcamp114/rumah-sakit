package com.xsis.training.smkjavaweb.dao;

import java.util.List;

import com.xsis.training.smkjavaweb.model.Department;

public interface DepartmentDao {

	public void save(Department department);

	public List<Department> getAllDepartment();
}

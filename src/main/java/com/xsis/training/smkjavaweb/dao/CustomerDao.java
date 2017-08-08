package com.xsis.training.smkjavaweb.dao;

import java.util.List;

import com.xsis.training.smkjavaweb.model.Customer;

public interface CustomerDao {
	

	void save(Customer customer);

	List<Customer> getAllCustomer();

}

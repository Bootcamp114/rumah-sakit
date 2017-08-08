package com.xsis.training.smkjavaweb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xsis.training.smkjavaweb.dao.BarangDao;
import com.xsis.training.smkjavaweb.dao.CustomerDao;
import com.xsis.training.smkjavaweb.dao.SuplierDao;
import com.xsis.training.smkjavaweb.model.Barang;
import com.xsis.training.smkjavaweb.model.Customer;
import com.xsis.training.smkjavaweb.model.Suplier;

@Service
@Transactional
public class DataMasterServicePenjualan {

	@Autowired
	CustomerDao customerDao;
	
	@Autowired
	SuplierDao suplierDao;
	
	@Autowired
	BarangDao barangDao;
	
	public void saveCustomer(Customer customer) {
		// TODO Auto-generated method stub
		customerDao.save(customer);
	}

	public void saveSuplier(Suplier suplier) {
		// TODO Auto-generated method stub
		suplierDao.save(suplier);
	}

	public void saveBarang(Barang barang) {
		// TODO Auto-generated method stub
		barangDao.save(barang);
	}

	public List<Customer> getAllCustomer() {
		// TODO Auto-generated method stub
		return customerDao.getAllCustomer();
	}

	

}

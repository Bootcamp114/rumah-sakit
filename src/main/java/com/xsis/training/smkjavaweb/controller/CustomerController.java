package com.xsis.training.smkjavaweb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xsis.training.smkjavaweb.model.Customer;
import com.xsis.training.smkjavaweb.service.DataMasterServicePenjualan;

@Controller
@RequestMapping("/customer")
public class CustomerController {

	@Autowired
	DataMasterServicePenjualan dataServicePenjualan;
	
	@ResponseBody
	@RequestMapping(value = "/save", method=RequestMethod.POST)
	public Customer indexCustomer(@RequestBody Customer customer){
		dataServicePenjualan.saveCustomer(customer);
		return customer;
	}
}

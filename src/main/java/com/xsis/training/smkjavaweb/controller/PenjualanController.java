package com.xsis.training.smkjavaweb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xsis.training.smkjavaweb.model.Customer;
import com.xsis.training.smkjavaweb.service.DataMasterServicePenjualan;

@Controller
@RequestMapping("/penjualan")
public class PenjualanController {

	@Autowired
	DataMasterServicePenjualan dataMasterServicePenjualan;
	
	@RequestMapping
	public String index(Model model){
		List<Customer> listCustomer = dataMasterServicePenjualan.getAllCustomer();
		model.add("listCustomer", listCustomer);
		
		return "penjualan"; //load penjualan jsp
	}
	
	
}

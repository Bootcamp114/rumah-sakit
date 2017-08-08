package com.xsis.training.smkjavaweb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xsis.training.smkjavaweb.model.Suplier;
import com.xsis.training.smkjavaweb.service.DataMasterServicePenjualan;

@Controller
@RequestMapping("/suplier")
public class SuplierController {

	@Autowired
	DataMasterServicePenjualan dataServicePenjualan;
	
	@ResponseBody
	@RequestMapping(value="/save", method=RequestMethod.POST)
	public Suplier save(@RequestBody Suplier suplier){
		
		dataServicePenjualan.saveSuplier(suplier);
		return suplier;
	}
}

package com.xsis.training.smkjavaweb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xsis.training.smkjavaweb.model.Barang;
import com.xsis.training.smkjavaweb.service.DataMasterServicePenjualan;

@Controller
@RequestMapping("/barang")
public class BarangController {
	
	@Autowired
	DataMasterServicePenjualan dataMasterServicePenjualan;
	
	@ResponseBody
	@RequestMapping(value="/save", method=RequestMethod.POST)
	public Barang save(@RequestBody Barang barang){
		
		dataMasterServicePenjualan.saveBarang(barang);
		
		return barang;
	}

}

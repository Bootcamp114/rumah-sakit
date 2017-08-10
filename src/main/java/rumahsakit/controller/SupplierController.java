package rumahsakit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import rumahsakit.model.Supplier;
import rumahsakit.service.DataMasterPembelian;

@Controller
@RequestMapping("/supplier")
public class SupplierController {

	@Autowired
	private DataMasterPembelian dtPembelian;
	
	@ResponseBody
	@RequestMapping("/index")
	public String index(){
		return "supplier";
	}
	
	@RequestMapping(value="/save",method = RequestMethod.POST)
	@ResponseStatus(value=HttpStatus.CREATED)
	public void save(@RequestBody Supplier supp){
		dtPembelian.saveSupplier(supp);
	}
}

package rumahsakit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
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
	 
	@RequestMapping(value = "/update" , method = RequestMethod.PUT)
	@ResponseStatus(value = HttpStatus.OK)
	public void update(@RequestBody Supplier supp){
		dtPembelian.updateSupplier(supp);
	}
	
	@RequestMapping(value = "/delete/{id}" , method = RequestMethod.DELETE)
	@ResponseStatus(value=HttpStatus.OK)
	public void delete(@PathVariable int id){
		dtPembelian.deleteSupplier(id);
	}
	
	@RequestMapping(value = "/getall" , method = RequestMethod.GET)
	@ResponseStatus(value=HttpStatus.OK)
	public List<Supplier> getAll(){
		return dtPembelian.getAllSupplier();
	}
	
	@RequestMapping(value = "/edit/{id}" , method = RequestMethod.GET)
	@ResponseStatus(value=HttpStatus.OK)
	public Supplier getSupllierById(@PathVariable int id){
		return dtPembelian.getSupplierById(id);
	}
}

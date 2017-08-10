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

import rumahsakit.model.Apoteker;
import rumahsakit.model.Supplier;
import rumahsakit.service.DataMasterPembelian;
@Controller
@RequestMapping("/apoteker")
public class ApotekerController {
	@Autowired
	private DataMasterPembelian dtPembelian;
	
	@ResponseBody
	@RequestMapping("/index")
	public String index(){
		return "apoteker";
	}
	
	@RequestMapping(value="/save",method = RequestMethod.POST)
	@ResponseStatus(value=HttpStatus.CREATED)
	public void save(@RequestBody Apoteker apo){
		dtPembelian.saveApoteker(apo);
	}
	 
	@RequestMapping(value = "/update" , method = RequestMethod.PUT)
	@ResponseStatus(value = HttpStatus.OK)
	public void update(@RequestBody Apoteker apo){
		dtPembelian.updateApoteker(apo);
	}
	
	@RequestMapping(value = "/delete/{id}" , method = RequestMethod.DELETE)
	@ResponseStatus(value=HttpStatus.OK)
	public void delete(@PathVariable int id){
		dtPembelian.deleteApoteker(id);
	}
	@ResponseBody
	@RequestMapping(value = "/getall" , method = RequestMethod.GET)
	@ResponseStatus(value=HttpStatus.OK)
	public List<Apoteker> getAll(){
		return dtPembelian.getAllApoteker();
	}
	@ResponseBody
	@RequestMapping(value = "/edit/{id}" , method = RequestMethod.GET)
	@ResponseStatus(value=HttpStatus.OK)
	public Apoteker getApotekerById(@PathVariable int id){
		return dtPembelian.getApotekerById(id);
	}
}

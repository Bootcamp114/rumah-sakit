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
import rumahsakit.model.Obat;
import rumahsakit.service.DataMasterPembelian;
@Controller
@RequestMapping("/obat")
public class ObatController {
	@Autowired
	private DataMasterPembelian dtPembelian;
	
	@ResponseBody
	@RequestMapping("/index")
	public String index(){
		return "obat";
	}
	
	@RequestMapping(value="/save",method = RequestMethod.POST)
	@ResponseStatus(value=HttpStatus.CREATED)
	public void save(@RequestBody Obat obt){
		dtPembelian.saveObat(obt);
	}
	 
	@RequestMapping(value = "/update" , method = RequestMethod.PUT)
	@ResponseStatus(value = HttpStatus.OK)
	public void update(@RequestBody Obat obt){
		dtPembelian.updateObat(obt);
	}
	
	@RequestMapping(value = "/delete/{id}" , method = RequestMethod.DELETE)
	@ResponseStatus(value=HttpStatus.OK)
	public void delete(@PathVariable int id){
		dtPembelian.deleteObat(id);
	}
	@ResponseBody
	@RequestMapping(value = "/getall" , method = RequestMethod.GET)
	@ResponseStatus(value=HttpStatus.OK)
	public List<Obat> getAll(){
		return dtPembelian.getAllObat();
	}
	@ResponseBody
	@RequestMapping(value = "/edit/{id}" , method = RequestMethod.GET)
	@ResponseStatus(value=HttpStatus.OK)
	public Obat getObatById(@PathVariable int id){
		return dtPembelian.getObatById(id);
	}
}

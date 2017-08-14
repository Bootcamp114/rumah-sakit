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

import rumahsakit.model.Pasien;
import rumahsakit.model.Poli;
import rumahsakit.service.DataMasterPasien;
import rumahsakit.service.DataMasterPoli;

@Controller
@RequestMapping("/poli")
public class PoliController {
	
	@Autowired
	DataMasterPoli dataMasterPoli;
	
	@RequestMapping("/index")
	public String index() {
		return "poli";
	}
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	@ResponseStatus(value = HttpStatus.CREATED)
	public void save(@RequestBody Poli pol) {
		dataMasterPoli.savePoli(pol);
	}

	@RequestMapping(value = "/update", method = RequestMethod.PUT)
	@ResponseStatus(value = HttpStatus.OK)
	public void update(@RequestBody Poli pol) {
		dataMasterPoli.updatePoli(pol);
	}
 
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.DELETE)
	@ResponseStatus(value = HttpStatus.OK)
	public void delete(@PathVariable int id) {
		dataMasterPoli.deletePoli(id);
	}

	@RequestMapping(value = "/getdatabyid/{id}", method = RequestMethod.GET)
	@ResponseBody
	@ResponseStatus(value = HttpStatus.OK)
	public Poli getPasienById(@PathVariable int id) {
		Poli pol = dataMasterPoli.getById(id);
		return pol;
	}
	
	@ResponseBody
	@RequestMapping(value = "/getall", method = RequestMethod.POST)
	@ResponseStatus(value= HttpStatus.OK)
	public List<Poli> getAllPoli(){
		return dataMasterPoli.getAllPoli();
	}

}

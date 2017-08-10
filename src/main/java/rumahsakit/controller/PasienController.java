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
import rumahsakit.service.DataMasterPasien;

@Controller
@RequestMapping("/pasien")
public class PasienController {

	@Autowired
	DataMasterPasien dataMasterPasien;

	@RequestMapping("/index")
	public String index() {
		return "pasien";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	@ResponseStatus(value = HttpStatus.CREATED)
	public void save(@RequestBody Pasien pas) {
		dataMasterPasien.savePasien(pas);
	}

	@RequestMapping(value = "/update", method = RequestMethod.PUT)
	@ResponseStatus(value = HttpStatus.OK)
	public void update(@RequestBody Pasien pas) {
		dataMasterPasien.updatePasien(pas);
	}
 
	@RequestMapping(value = "/delete", method = RequestMethod.DELETE)
	@ResponseStatus(value = HttpStatus.OK)
	public void delete(@PathVariable int id) {
		dataMasterPasien.deletePasien(id);
	}

	@RequestMapping(value = "/getdatabyid/{id}", method = RequestMethod.GET)
	@ResponseBody
	@ResponseStatus(value = HttpStatus.OK)
	public Pasien getPasienById(@PathVariable int id) {
		Pasien pas = dataMasterPasien.getById(id);
		return pas;
	}
	
	@ResponseBody
	@RequestMapping(value = "/getall", method = RequestMethod.GET)
	@ResponseStatus(value= HttpStatus.OK)
	public List<Pasien> getAllPasien(){
		return dataMasterPasien.getAllPasien();
	}
}

package rumahsakit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import rumahsakit.model.Dokter;
import rumahsakit.model.JenisPemeriksaan;
import rumahsakit.model.Poli;
import rumahsakit.service.DataMasterPemeriksaan;

@Controller
@RequestMapping("/dokter")
public class DokterController {

	@Autowired
	private DataMasterPemeriksaan service;
	
	@RequestMapping
	public String index(Model model){
		List<Poli> listPoli = service.getAllPoli();
		model.addAttribute("listPoli", listPoli);
		return "dokter";
	}
	
	@ResponseBody
	@RequestMapping(value = "/save" , method = RequestMethod.POST)
	@ResponseStatus(value = HttpStatus.CREATED)
	public Dokter save(@RequestBody Dokter dokter){
		//service.saveDokter(dokter);
		return dokter;
	}
	
	@RequestMapping(value = "/update" , method = RequestMethod.PUT)
	@ResponseStatus(value = HttpStatus.OK)
	public void update(@RequestBody Dokter dokter){
		service.updateDokter(dokter);
	}
	
	@RequestMapping(value = "/delete/{id}" , method = RequestMethod.DELETE)
	@ResponseStatus(value = HttpStatus.OK)
	public void delete(@PathVariable int id){
		service.deleteDokter(id);
	}
	
	@ResponseBody
	@RequestMapping(value = "/getById/{id}" , method = RequestMethod.GET)
	@ResponseStatus(value = HttpStatus.OK)
	public Dokter getDokterById(@PathVariable int id){
		return service.getDokterById(id);
	}
	
	@ResponseBody
	@RequestMapping(value = "/getPoliById/{id}" , method = RequestMethod.GET)
	@ResponseStatus(value = HttpStatus.OK)
	public Poli getPoliById(@PathVariable int id){
		return service.getPoliById(id);
	}
	
	@ResponseBody
	@RequestMapping(value = "/getAll" , method = RequestMethod.POST)
	@ResponseStatus(value = HttpStatus.OK)
	public List<Dokter> getAllDokter(){
		return service.getAllDokter();
	}
	
	/*@ResponseBody
	@RequestMapping(value = "/getAllPoli" , method = RequestMethod.POST)
	@ResponseStatus(value = HttpStatus.OK)
	public List<Poli> getAllPoli(){
		return service.getAllPoli();
	}*/
}

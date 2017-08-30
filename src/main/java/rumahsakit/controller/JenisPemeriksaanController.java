package rumahsakit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import rumahsakit.model.JenisPemeriksaan;
import rumahsakit.service.DataMasterPemeriksaan;

@Controller
@RequestMapping("/jenispemeriksaan")
public class JenisPemeriksaanController {

	@Autowired
	private DataMasterPemeriksaan service;
	
	@RequestMapping
	public String index(Model model){
		model.addAttribute("listJenis",service.getAllJenisPemeriksaan());
		return "jenispemeriksaan";
	}
	@ResponseBody
	@RequestMapping(value = "/save" , method = RequestMethod.POST)
	public ResponseEntity<JenisPemeriksaan> save(@RequestBody JenisPemeriksaan jenisPemeriksaan) throws Exception{
		try {
			service.saveJenisPemeriksaan(jenisPemeriksaan);
		} catch (Exception e) {
			return new ResponseEntity<JenisPemeriksaan>(jenisPemeriksaan, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return new ResponseEntity<JenisPemeriksaan>(jenisPemeriksaan, HttpStatus.OK);
	}
	
	@ResponseBody
	@RequestMapping(value = "/update" , method = RequestMethod.PUT)
	public ResponseEntity<JenisPemeriksaan> update(@RequestBody JenisPemeriksaan jenisPemeriksaan) throws Exception{
		try {
			service.updateJenisPemeriksaan(jenisPemeriksaan);
		} catch (Exception e) {
			return new ResponseEntity<JenisPemeriksaan>(jenisPemeriksaan, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return new ResponseEntity<JenisPemeriksaan>(jenisPemeriksaan, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/delete/{id}" , method = RequestMethod.DELETE)
	@ResponseStatus(value = HttpStatus.OK)
	public void delete(@PathVariable int id){
		service.deleteJenisPemeriksaan(id);
	}
	
	@ResponseBody
	@RequestMapping(value = "/getById/{id}" , method = RequestMethod.GET)
	@ResponseStatus(value = HttpStatus.OK)
	public JenisPemeriksaan getJenisPemeriksaanById(@PathVariable int id){
		return service.getJenisPemeriksaanById(id);
	}
	
	@ResponseBody
	@RequestMapping(value = "/getAll" , method = RequestMethod.POST)
	@ResponseStatus(value = HttpStatus.OK)
	public List<JenisPemeriksaan> getAllJenisPemeriksaan(){
		return service.getAllJenisPemeriksaan();
	}
}

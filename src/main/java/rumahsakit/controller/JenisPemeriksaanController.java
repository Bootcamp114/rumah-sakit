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

import rumahsakit.model.JenisPemeriksaan;
import rumahsakit.service.DataMasterPemeriksaan;

@Controller
@RequestMapping("/jenispemeriksaan")
public class JenisPemeriksaanController {

	@Autowired
	private DataMasterPemeriksaan service;
	
	@RequestMapping
	public String index(){
		return "jenispemeriksaan";
	}
	
	@RequestMapping(value = "/save" , method = RequestMethod.POST)
	@ResponseStatus(value = HttpStatus.CREATED)
	public void save(@RequestBody JenisPemeriksaan jenisPemeriksaan){
		service.saveJenisPemeriksaan(jenisPemeriksaan);
	}
	
	@RequestMapping(value = "/update" , method = RequestMethod.PUT)
	@ResponseStatus(value = HttpStatus.OK)
	public void update(@RequestBody JenisPemeriksaan jenisPemeriksaan){
		service.updateJenisPemeriksaan(jenisPemeriksaan);
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

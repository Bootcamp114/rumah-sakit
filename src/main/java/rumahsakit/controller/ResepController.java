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

import rumahsakit.model.Obat;
import rumahsakit.model.Pendaftaran;
import rumahsakit.model.Resep;
import rumahsakit.service.DataMasterPembelian;
import rumahsakit.service.DataMasterPendaftaran;
import rumahsakit.service.DataMasterResep;

@Controller
@RequestMapping("/resep")
public class ResepController {

	@Autowired
	private DataMasterResep serviceResep;
	@Autowired
	private DataMasterPembelian serviceObat;
	@Autowired
	private DataMasterPendaftaran serviceDaftar;
	
	@RequestMapping
	public String index(Model model , Model daftar){
		List<Obat> listObat = serviceObat.getAllObat();
		model.addAttribute("listObat", listObat);
		List<Pendaftaran> listDaftar = serviceDaftar.getAlPendaftaran();
		daftar.addAttribute("listDaftar", listDaftar);
		return "resep";
	}
	
	@RequestMapping(value = "/save" , method = RequestMethod.POST)
	@ResponseStatus(value = HttpStatus.CREATED)
	public void save(@RequestBody Resep resep){
		serviceResep.saveResep(resep);
	}
	
	@RequestMapping(value = "/update" , method = RequestMethod.PUT)
	@ResponseStatus(value = HttpStatus.OK)
	public void update(@RequestBody Resep resep){
		serviceResep.updateResep(resep);
	}
	
	@RequestMapping(value = "/delete/{id}" , method = RequestMethod.DELETE)
	@ResponseStatus(value = HttpStatus.OK)
	public void delete(@PathVariable int id){
		serviceResep.deleteResep(id);
	}
	
	@ResponseBody
	@RequestMapping(value = "/getResepById/{id}" , method = RequestMethod.GET)
	@ResponseStatus(value = HttpStatus.OK)
	public Resep getResepById(@PathVariable int id){
		return serviceResep.getResepById(id);
	}
	
	@ResponseBody
	@RequestMapping(value = "/getAllResep" , method = RequestMethod.POST)
	@ResponseStatus(value = HttpStatus.OK)
	public List<Resep> getAllResep(){
		return serviceResep.getAllResep();
	}
}

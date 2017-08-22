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
import rumahsakit.model.Obat;
import rumahsakit.model.Pendaftaran;
import rumahsakit.model.Resep;
import rumahsakit.service.DataMasterPembelian;
import rumahsakit.service.DataMasterPemeriksaan;
import rumahsakit.service.DataMasterPendaftaran;
import rumahsakit.service.DataMasterResep;
import rumahsakit.utils.AppUtils;

@Controller
@RequestMapping("/resep")
public class ResepController {

	@Autowired
	private DataMasterResep serviceResep;
	@Autowired
	private DataMasterPembelian serviceObat;
	@Autowired
	private DataMasterPendaftaran serviceDaftar;
	@Autowired
	private DataMasterPemeriksaan servicePeriksa;
	@Autowired
	private AppUtils appUtils;
	
	@RequestMapping
	public String index(Model model , Model daftar){
		List<Obat> listObat = serviceObat.getAllObat();
		model.addAttribute("listObat", listObat);
		List<Pendaftaran> listDaftar = serviceDaftar.getAlPendaftaran();
		daftar.addAttribute("listDaftar", listDaftar);
		List<Dokter> listDokter = servicePeriksa.getAllDokter();
		model.addAttribute("listDokter", listDokter);
		model.addAttribute("noResep", appUtils.getNoResep());
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
	
	@ResponseBody
	@RequestMapping(value = "/getObatById/{id}" , method = RequestMethod.GET)
	@ResponseStatus(value = HttpStatus.OK)
	public Obat getObatById(@PathVariable int id){
		return serviceObat.getObatById(id);
	}
	
	@ResponseBody
	@RequestMapping(value = "/getPasienById/{id}" , method = RequestMethod.GET)
	@ResponseStatus(value = HttpStatus.OK)
	public Pendaftaran getDaftarById(@PathVariable int id){
		return serviceDaftar.getById(id);
	}
}

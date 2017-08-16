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

import rumahsakit.model.Diagnosa;
import rumahsakit.model.Dokter;
import rumahsakit.model.JenisPemeriksaan;
import rumahsakit.model.Pemeriksaan;
import rumahsakit.model.Pendaftaran;
import rumahsakit.service.DataMasterPemeriksaan;
import rumahsakit.service.DataMasterPendaftaran;

@Controller
@RequestMapping("/pemeriksaan")
public class PemeriksaanController {

	@Autowired
	private DataMasterPemeriksaan service;
	@Autowired
	private DataMasterPendaftaran serviceDaftar;
	
	@RequestMapping
	public String index(Model model , Model modelJenisPeriksa , Model modelNoDaftar ){
		List<Dokter> listDokter = service.getAllDokter();
		model.addAttribute("listDokter", listDokter);
		List<JenisPemeriksaan> listJenis = service.getAllJenisPemeriksaan();
		modelJenisPeriksa.addAttribute("listJenis", listJenis);
		List<Pendaftaran> listDaftar = serviceDaftar.getAlPendaftaran();
		modelNoDaftar.addAttribute("listDaftar", listDaftar);
		return "pemeriksaan";
	}
	 
	@RequestMapping(value = "/saveDiagnosa" , method = RequestMethod.POST)
	@ResponseStatus(value = HttpStatus.CREATED)
	public void saveDiagnosa(@RequestBody Diagnosa diagnosa){
		service.saveDiagnosa(diagnosa);
	}
	
	@RequestMapping(value = "/updateDiagnosa" , method = RequestMethod.PUT)
	@ResponseStatus(value = HttpStatus.OK)
	public void updateDiagnosa(@RequestBody Diagnosa diagnosa){
		service.updateDiagnosa(diagnosa);
	}
	
	@RequestMapping(value = "/deleteDiagnosa/{id}" , method = RequestMethod.DELETE)
	@ResponseStatus(value = HttpStatus.OK)
	public void deleteDiagnosa(@PathVariable int id){
		service.deleteDiagnosa(id);
	}
	
	@ResponseBody
	@RequestMapping(value = "/getDiagnosaById/{id}" , method = RequestMethod.GET)
	@ResponseStatus(value = HttpStatus.OK)
	public Diagnosa getDiagnosaById(@PathVariable int id){
		return service.getDiagnosaById(id);
	}
	
	@ResponseBody
	@RequestMapping(value = "/getDiagnosaByNoDiagnosa" , method = RequestMethod.POST)
	@ResponseStatus(value = HttpStatus.OK)
	public List<Diagnosa> getDiagnosaByNoDiagnosa(){
		return service.getAllDiagnosaByNoDiagnosa();
	}
	
	@RequestMapping(value = "/savePemeriksaan" , method = RequestMethod.POST)
	@ResponseStatus(value = HttpStatus.CREATED)
	public void savePemeriksaan(@RequestBody Pemeriksaan pemeriksaan){
		service.savePemeriksaan(pemeriksaan);
	}
}

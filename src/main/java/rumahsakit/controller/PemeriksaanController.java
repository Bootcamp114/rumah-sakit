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

import rumahsakit.model.Diagnosa;
import rumahsakit.model.Dokter;
import rumahsakit.model.JenisPemeriksaan;
import rumahsakit.model.Pemeriksaan;
import rumahsakit.model.Pendaftaran;
import rumahsakit.service.DataMasterPemeriksaan;
import rumahsakit.service.DataMasterPendaftaran;
import rumahsakit.utils.AppUtils;

@Controller
@RequestMapping("/pemeriksaan")
public class PemeriksaanController {

	@Autowired
	private DataMasterPemeriksaan service;
	@Autowired
	private DataMasterPendaftaran serviceDaftar;
	@Autowired
	private AppUtils appUtil;
	@RequestMapping
	public String index(Model model , Model modelJenisPeriksa , Model modelNoDaftar ){
		List<Dokter> listDokter = service.getAllDokter();
		model.addAttribute("listDokter", listDokter);
		List<JenisPemeriksaan> listJenis = service.getAllJenisPemeriksaan();
		modelJenisPeriksa.addAttribute("listJenis", listJenis);
		List<Pendaftaran> listDaftar = serviceDaftar.getAlPendaftaran();
		modelNoDaftar.addAttribute("listDaftar", listDaftar);
		model.addAttribute("noPeriksa", appUtil.getNoPeriksa());
		model.addAttribute("noDiagnosa", appUtil.getNoDiagnosa());
		model.addAttribute("listPemeriksaan", service.getAllPemriksaan());
		return "pemeriksaan";
	}
	 
	@ResponseBody
	@RequestMapping(value = "/savePemeriksaan" , method = RequestMethod.POST)
	public ResponseEntity<Pemeriksaan> savePemeriksaan(@RequestBody Pemeriksaan pemeriksaan)throws Exception{
		try {
			service.savePemeriksaan(pemeriksaan);	
		} catch (Exception e) {
			return new ResponseEntity<Pemeriksaan>(pemeriksaan, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return new ResponseEntity<Pemeriksaan>(pemeriksaan, HttpStatus.OK);
	}
	
	@ResponseBody
	@RequestMapping(value = "/getAllPemeriksaan" , method = RequestMethod.POST)
	@ResponseStatus(value = HttpStatus.OK)
	public List<Pemeriksaan> getAllPemeriksaan(){
		return service.getAllPemriksaan();
	}
	
	@ResponseBody
	@RequestMapping(value = "/delete" , method = RequestMethod.DELETE)
	@ResponseStatus(value = HttpStatus.OK)
	public void delete(int id){
		service.delete(id);
	}
	
	//pendfataran
	@ResponseBody
	@RequestMapping(value = "/getPendaftaranById/{id}" , method = RequestMethod.GET)
	@ResponseStatus(value = HttpStatus.OK)
	public Pendaftaran getPendaftaranById(@PathVariable int id){
		return serviceDaftar.getById(id);
	}
	
	@ResponseBody
	@RequestMapping(value = "/getdiagnosaByIdPeriksa/{id}" , method = RequestMethod.GET)
	@ResponseStatus(value = HttpStatus.OK)
	public List<Diagnosa> getDiagnosaByIdPeriksa(@PathVariable int id) throws Exception{
		return service.listDiagnosaByIdPeriksa(id);
	}
	
	//end pendaftraan
}

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

import rumahsakit.model.Pasien;
import rumahsakit.model.Pendaftaran;
import rumahsakit.model.Petugas;
import rumahsakit.model.Poli;
import rumahsakit.service.DataMasterPasien;
import rumahsakit.service.DataMasterPendaftaran;
import rumahsakit.service.DataMasterPetugas;
import rumahsakit.service.DataMasterPoli;
import rumahsakit.utils.AppUtils;

@Controller
@RequestMapping("/pendaftaran")
public class PendaftaranController {

	@Autowired
	DataMasterPendaftaran dataMasterPendaftaran;
	@Autowired
	DataMasterPasien dataMasterPasien;
	@Autowired
	DataMasterPoli dataMasterPoli;
	@Autowired
	DataMasterPetugas dataMasterPetugas;
	@Autowired
	private AppUtils appUtils;
	

	@RequestMapping("/index")
	public String index( Model model) {    
		String noUrut = appUtils.getNoUrut();
		model.addAttribute("noUrut", noUrut);
		List<Pasien> pas = dataMasterPasien.getAllPasien();
		List<Poli> pol = dataMasterPoli.getAllPoli();
		List<Petugas> pet = dataMasterPetugas.getAllPetugas();
		model.addAttribute("listPetugas", pet);
		model.addAttribute("lisPoli",pol);
		model.addAttribute("listPasien",pas);
		return "pendaftaran";
	}

	@ResponseBody
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	@ResponseStatus(value = HttpStatus.CREATED)
	public void save(@RequestBody Pendaftaran pen) {
		dataMasterPendaftaran.savePendaftaran(pen);
		
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.PUT)
	@ResponseStatus(value = HttpStatus.OK)
	public void update(@RequestBody Pendaftaran pen) {
		dataMasterPendaftaran.updatePendaftaran(pen);
	}
 
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.DELETE)
	@ResponseStatus(value = HttpStatus.OK)
	public void delete(@PathVariable int id) {
		dataMasterPendaftaran.deletePendaftaran(id);
	}

	@RequestMapping(value = "/getdatabyid/{id}", method = RequestMethod.GET)
	@ResponseBody
	@ResponseStatus(value = HttpStatus.OK)
	public Pendaftaran getPendaftaranById(@PathVariable int id) {
		Pendaftaran pen = dataMasterPendaftaran.getById(id);
		return pen;
	}
	@ResponseBody
	@RequestMapping(value = "/getno/{noIdentitas}")
	public List<Pasien> getByNo(@PathVariable String noIdentitas){
		return dataMasterPendaftaran.getByNoIdentitas(noIdentitas);
	}
	
	@ResponseBody
	@RequestMapping(value = "/getpo/{poli}")
	public List<Poli> getByPo(@PathVariable String poli){
		return dataMasterPendaftaran.getByPoli(poli);
	}
	
	@ResponseBody
	@RequestMapping(value = "/getpet/{petugas}")
	public List<Petugas> getByPet(@PathVariable String petugas){
		return dataMasterPendaftaran.getByPetugas(petugas);
	}
	
	@ResponseBody
	@RequestMapping(value = "/getall", method = RequestMethod.POST)
	@ResponseStatus(value= HttpStatus.OK)
	public List<Pendaftaran> getAllPendaftaran(){
		return dataMasterPendaftaran.getAlPendaftaran();
	}
	
	
}

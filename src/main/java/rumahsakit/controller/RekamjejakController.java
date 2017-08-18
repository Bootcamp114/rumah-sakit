package rumahsakit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
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
import rumahsakit.service.DataMasterPoli;

@Controller
@RequestMapping("/rekamjejak")
public class RekamjejakController {

		@Autowired
		DataMasterPendaftaran dataMasterPendaftaran;
		@Autowired
		DataMasterPasien dataMasterPasien;
		@Autowired
		DataMasterPoli dataMasterPoli;
		
	@RequestMapping("/index")
	public String index(Model model) {
		List<Pasien> listPasien = dataMasterPasien.getAllPasien();
		List<Pendaftaran> listPendaftaran = dataMasterPendaftaran.getAlPendaftaran();
		List<Poli> listPoli = dataMasterPoli.getAllPoli();
		model.addAttribute("listPendaftaran", listPendaftaran);
		model.addAttribute("listPasien", listPasien);
		model.addAttribute("listPoli", listPoli);
		return "rekamjejak";
	}
	
	@ResponseBody
	@RequestMapping(value = "/getpo/{poli}")
	public List<Poli> getByPo(@PathVariable String poli){
		return dataMasterPendaftaran.getByPoli(poli);
	}
	
	@ResponseBody
	@RequestMapping(value = "/getno/{noIdentitas}")
	public List<Pasien> getByPas(@PathVariable String noIdentitas){
		return dataMasterPendaftaran.getByNoIdentitas(noIdentitas);
	}

	@RequestMapping(value="/getall", method = RequestMethod.POST)
	@ResponseBody
	@ResponseStatus(value=HttpStatus.OK)
	public List<Pendaftaran> getAllPendaftaran() {
		return dataMasterPendaftaran.getAlPendaftaran();
	}

}

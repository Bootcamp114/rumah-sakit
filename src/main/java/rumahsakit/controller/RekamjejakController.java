package rumahsakit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import rumahsakit.model.Pasien;
import rumahsakit.model.Pendaftaran;
import rumahsakit.model.Petugas;
import rumahsakit.service.DataMasterPasien;
import rumahsakit.service.DataMasterPendaftaran;

@Controller
@RequestMapping("/rekamjejak")
public class RekamjejakController {

		@Autowired
		DataMasterPendaftaran dataMasterPendaftaran;
		@Autowired
		DataMasterPasien dataMasterPasien;
		
	@RequestMapping("/index")
	public String index(Model model) {
		List<Pasien> listPasien = dataMasterPasien.getAllPasien();
		List<Pendaftaran> listPendaftaran = dataMasterPendaftaran.getAlPendaftaran();
		model.addAttribute("listPendaftaran", listPendaftaran);
		model.addAttribute("listPasien", listPasien);
		return "rekamjejak";
	}

	@RequestMapping(value="/getall", method = RequestMethod.POST)
	@ResponseBody
	@ResponseStatus(value=HttpStatus.OK)
	public List<Pendaftaran> getAllPendaftaran() {
		return dataMasterPendaftaran.getAlPendaftaran();
	}

}

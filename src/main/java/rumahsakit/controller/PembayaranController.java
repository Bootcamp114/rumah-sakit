package rumahsakit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;

import rumahsakit.model.DetailResep;
import rumahsakit.model.PembayaranObat;
import rumahsakit.model.Resep;
import rumahsakit.service.DataMasterPembayaran;
import rumahsakit.service.DataMasterPemeriksaan;

@Controller
@RequestMapping("/pembayaran")
public class PembayaranController {
	@Autowired
	DataMasterPemeriksaan dtPemeriksaan;
	@Autowired
	DataMasterPembayaran dtPembayaran;
	@RequestMapping("/index")
	public String index(Model model){
		List<Resep> list = dtPemeriksaan.getAllResep();
		model.addAttribute("listResep",list);
		return "pembayaran";
	}
	
	@RequestMapping(value = "/save" , method= RequestMethod.POST)
	@ResponseStatus(value = HttpStatus.CREATED)
	public void save(PembayaranObat pembayaran){
		dtPembayaran.save(pembayaran);
	}
	
	@RequestMapping(value = "/getbyresep/{id]" , method = RequestMethod.GET)
	public List<DetailResep> getByResep(String noResep){
		return dtPembayaran.getByResep(noResep);
	}
}

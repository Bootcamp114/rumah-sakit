package rumahsakit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import rumahsakit.model.Resep;
import rumahsakit.service.DataMasterPemeriksaan;

@Controller
@RequestMapping("/pembayaran")
public class PembayaranController {
	@Autowired
	DataMasterPemeriksaan dtPemeriksaan;
	@RequestMapping("/index")
	public String index(Model model){
		List<Resep> list = dtPemeriksaan.getAllResep();
		model.addAttribute("listResep",list);
		return "pembayaran";
	}
}

package rumahsakit.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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

import rumahsakit.model.DetailObat;
import rumahsakit.model.Obat;
import rumahsakit.model.PembelianObat;
import rumahsakit.service.DataMasterPembelian;
import rumahsakit.utils.AppUtils;

@Controller
@RequestMapping("/pembelian")
public class PembelianController {

	
	@Autowired
	DataMasterPembelian dataMasterPembelian;
	@Autowired
	private AppUtils appUtils;
	
	@RequestMapping("/index")
	public String index(Model model , DetailObat obat){
		List<Obat> list = dataMasterPembelian.getAllObat(); 
		model.addAttribute("listObat", list);
		model.addAttribute("noFaktur",appUtils.getNoFaktur());
		return "pembelian";
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/edit/{id}" , method = RequestMethod.GET)
	@ResponseStatus(value=HttpStatus.OK)
	public Obat getObatById(@PathVariable int id){
		return dataMasterPembelian.getObatById(id);
	}
	
	@RequestMapping(value = "/selesai" , method = RequestMethod.POST)
	@ResponseStatus(value = HttpStatus.CREATED)
	public void save(@RequestBody PembelianObat pem){
		dataMasterPembelian.savePembelian(pem);
	}
	
	@ResponseBody
	@RequestMapping(value = "/getalldetail" , method = RequestMethod.POST)
	@ResponseStatus(value = HttpStatus.OK)
	public List<DetailObat> getAllDetail(HttpServletRequest request){
		return dataMasterPembelian.getAllDetail(request.getParameter("noFaktur"));
	}
	
	@RequestMapping(value = "/delete/{id}" , method = RequestMethod.DELETE)
	@ResponseStatus(value = HttpStatus.OK)
	public void delete(@PathVariable int id){
		dataMasterPembelian.deleteDetail(id);
	}
}

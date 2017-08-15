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
import rumahsakit.service.DataMasterPemeriksaan;

@Controller
@RequestMapping("/pemeriksaan")
public class PemeriksaanController {

	@Autowired
	private DataMasterPemeriksaan service;
	
	@RequestMapping
	public String index(Model model){
		List<Dokter> listDokter = service.getAllDokter();
		model.addAttribute("listDokter", listDokter);
		return "pemeriksaan";
	}
	
	@ResponseBody
	@RequestMapping(value = "/saveDiagnosa" , method = RequestMethod.POST)
	@ResponseStatus(value = HttpStatus.CREATED)
	public Diagnosa saveDiagnosa(@RequestBody Diagnosa diagnosa){
		//service.saveDiagnosa(diagnosa);
		return diagnosa;
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
	@RequestMapping(value = "/getDiagnosaByNoDiagnosa/{noDiagnosa}" , method = RequestMethod.POST)
	@ResponseStatus(value = HttpStatus.OK)
	public List<Diagnosa> getDiagnosaByNoDiagnosa(@PathVariable String noDiagnosa){
		return service.getAllDiagnosaByNoDiagnosa(noDiagnosa);
	}
}

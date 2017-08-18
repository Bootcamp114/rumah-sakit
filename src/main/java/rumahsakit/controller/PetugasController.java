package rumahsakit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import rumahsakit.model.Petugas;
import rumahsakit.service.DataMasterPetugas;

@Controller
@RequestMapping("/petugas")
public class PetugasController {

	@Autowired
	DataMasterPetugas dataMasterPetugas;

	@RequestMapping("/index")
	public String index() {
		return "petugas";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	@ResponseStatus(value = HttpStatus.CREATED)
	public void save(@RequestBody Petugas pet) {
		dataMasterPetugas.savePetugas(pet);
	}

	@RequestMapping(value = "/update", method = RequestMethod.PUT)
	@ResponseStatus(value = HttpStatus.OK)
	public void update(@RequestBody Petugas pet) {
		dataMasterPetugas.updatePetugas(pet);
	}

	@RequestMapping(value = "/delete/{id}", method = RequestMethod.DELETE)
	@ResponseStatus(value = HttpStatus.OK)
	public void delete(@PathVariable int id) {
		dataMasterPetugas.deletePetugas(id);
	}

	@RequestMapping(value = "/getdatabyid/{id}", method = RequestMethod.GET)
	@ResponseBody
	@ResponseStatus(value = HttpStatus.OK)
	public Petugas getPetugasById(@PathVariable int id) {
		Petugas pet = dataMasterPetugas.getById(id);
		return pet;
	}

	@ResponseBody
	@RequestMapping(value = "/getall", method = RequestMethod.POST)
	@ResponseStatus(value = HttpStatus.OK)
	public List<Petugas> getAllPetugas() {
		return dataMasterPetugas.getAllPetugas();
	}
}

package rumahsakit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;
import rumahsakit.model.Pendaftaran;
import rumahsakit.service.DataMasterPendaftaran;

@Controller
@RequestMapping("/pendaftaran")
public class PendaftaranController {

	@Autowired
	DataMasterPendaftaran dataMasterPendaftaran;

	@RequestMapping("/index")
	public String index() {
		return "pendaftaran";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	@ResponseStatus(value = HttpStatus.CREATED)
	public void save(@RequestBody Pendaftaran pen) {
		dataMasterPendaftaran.savePendaftaran(pen);
	}
}

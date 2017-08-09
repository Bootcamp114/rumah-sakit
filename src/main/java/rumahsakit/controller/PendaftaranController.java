package rumahsakit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/pendaftaran")
public class PendaftaranController {

	@RequestMapping("/index")
	public String index() {
		return "pendaftaran";
	}

}

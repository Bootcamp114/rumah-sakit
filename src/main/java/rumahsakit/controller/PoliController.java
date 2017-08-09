package rumahsakit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/poli")
public class PoliController {

	@RequestMapping("/index")
	public String index() {
		return "poli";
	}


}

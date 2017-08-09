package rumahsakit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/dokter")
public class DokterController {

	@RequestMapping
	public String index(){
		return "dokter";
	}
	
}

package rumahsakit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/pemeriksaan")
public class PemeriksaanController {

	@RequestMapping
	public String index(){
		return "pemeriksaan";
	}
	
}

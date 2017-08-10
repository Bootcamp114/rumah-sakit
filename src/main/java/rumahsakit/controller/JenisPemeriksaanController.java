package rumahsakit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/jenispemeriksaan")
public class JenisPemeriksaanController {

	@RequestMapping
	public String index(){
		return "jenispemeriksaan";
	}
	
}

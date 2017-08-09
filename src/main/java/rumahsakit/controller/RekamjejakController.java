package rumahsakit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/rekamjejak")
public class RekamjejakController {

	@RequestMapping("/index")
	public String index() {
		return "rekamjejak";
	}


}

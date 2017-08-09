package rumahsakit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/pembelian")
public class PembelianController {
	@RequestMapping("/index")
	public String index(){
		return "pembelian";
	}
}

package com.xsis.training.smkjavaweb.controller;

import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.xsis.training.smkjavaweb.model.Employee;

//RestFull => JSON

@Controller
public class Example {

	@ResponseBody
	@RequestMapping(value="/example", method=RequestMethod.GET)
	@ResponseStatus(value=HttpStatus.OK)
	public String index(){
		return "hallo world";
	}
	
	@ResponseBody
	@RequestMapping(value="/delete/{id}", method=RequestMethod.DELETE)
	@ResponseStatus(value=HttpStatus.OK)
	public String delete(@PathVariable int id){
		return "id : "+ id;
	}
	
	@ResponseBody
	@RequestMapping(value="/data", method=RequestMethod.POST)
	public Employee getEmployee(@RequestBody Employee emp){
		emp.setAddress("bogor");
		
		return emp;
	}
	
	@ResponseBody
	@RequestMapping(value="/mypath")
	public String getExecuted(@RequestParam("data") String data, @RequestParam("param") String data2){
		return data + data2;
	}
	
	@ResponseBody
	@RequestMapping(value="/mypath2/{id}/{email}")
	public String examplePath(@PathVariable int id, 
									@PathVariable String email){
		return "user id : "+ id + ", email : "+ email;
	}
	
}

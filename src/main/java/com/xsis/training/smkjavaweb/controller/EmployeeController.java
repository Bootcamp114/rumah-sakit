package com.xsis.training.smkjavaweb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.xsis.training.smkjavaweb.model.Employee;
import com.xsis.training.smkjavaweb.service.EmployeeService;
import com.xsis.training.smkjavaweb.service.EmployeeServiceImpl;

import jdk.net.SocketFlow.Status;

@Controller
@RequestMapping("/employee")
public class EmployeeController {
	@Autowired
	EmployeeService employeeService;
	
	@RequestMapping
	public String index(){
		return "employee";
	}
	
	
	@ResponseBody
	@RequestMapping(value="/save", method=RequestMethod.POST)
	@ResponseStatus(value=HttpStatus.CREATED)
	public Employee save(@RequestBody Employee emp){
		
		employeeService.save(emp);
		return emp;
	}
	
	@ResponseBody
	@RequestMapping(value="/getAll", method=RequestMethod.GET)
	@ResponseStatus(value=HttpStatus.OK)
	public List<Employee> getAllEmployee(){
		return employeeService.getAllEmployee();
	}
	
	@RequestMapping(value="/delete/{id}", method = RequestMethod.DELETE)
	@ResponseStatus(value=HttpStatus.OK)
	public void delete(@PathVariable int id){
		employeeService.delete(id);
	}
	
	@RequestMapping(value="/getdatabyid/{id}", method = RequestMethod.GET)
	@ResponseBody
	@ResponseStatus(value=HttpStatus.OK)
	public Employee getEmployeeById(@PathVariable int id){
		System.out.println("id "+ id);
		Employee emp = employeeService.getEmployeeById(id);
		
		return emp;
	}
	
	@RequestMapping(value = "/update", method=RequestMethod.PUT)
	@ResponseStatus(value=HttpStatus.OK)
	public void update(@RequestBody Employee emp){
		employeeService.update(emp);
	}

}

package com.xsis.training.smkjavaweb.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

@Entity
@Table(name="xsis_employee")
@JsonIdentityInfo(generator=ObjectIdGenerators.
IntSequenceGenerator.class, property="@id")
public class Employee {
	
	public Employee(){}

	public Employee(int id, String name, String email, String address, Double salary, Department department) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.address = address;
		this.salary = salary;
		this.department = department;
	}


	@Id //primary key
	@GeneratedValue(strategy = GenerationType.SEQUENCE) //auto increment
	private int id;
	@Column(name="name", nullable = false)
	private String name;
	@Column(name="email", unique = true)
	private String email;
	private String address;
	private Double salary;
	@ManyToOne
	private Department department;
	
	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Double getSalary() {
		return salary;
	}
	public void setSalary(Double salary) {
		this.salary = salary;
	}
	
	

}

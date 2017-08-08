package com.xsis.training.smkjavaweb.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

@Entity
@Table(name="xsis_department")
@JsonIdentityInfo(generator=ObjectIdGenerators.
IntSequenceGenerator.class, property="@id")
public class Department {

	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE)
	private int id;
	@Column(name="name_department", nullable=false)
	private String nameDepartment;
	private String telpon;
	private String webSiteUrl;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy="department")
	private List<Employee> listEmployee;
	
	
	public Department(int id, String nameDepartment, String telpon, String webSiteUrl, List<Employee> listEmployee) {
		super();
		this.id = id;
		this.nameDepartment = nameDepartment;
		this.telpon = telpon;
		this.webSiteUrl = webSiteUrl;
		this.listEmployee = listEmployee;
	}

	public List<Employee> getListEmployee() {
		return listEmployee;
	}

	public void setListEmployee(List<Employee> listEmployee) {
		this.listEmployee = listEmployee;
	}

	public Department(){}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNameDepartment() {
		return nameDepartment;
	}

	public void setNameDepartment(String nameDepartment) {
		this.nameDepartment = nameDepartment;
	}

	public String getTelpon() {
		return telpon;
	}

	public void setTelpon(String telpon) {
		this.telpon = telpon;
	}

	public String getWebSiteUrl() {
		return webSiteUrl;
	}

	public void setWebSiteUrl(String webSiteUrl) {
		this.webSiteUrl = webSiteUrl;
	}
	
	
}

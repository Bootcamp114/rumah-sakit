package com.xsis.training.smkjavaweb.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

@Entity
@Table(name="SMK_CUSTOMER")
@JsonIdentityInfo(generator=ObjectIdGenerators.
IntSequenceGenerator.class, property="@id")
public class Customer {
	
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE)
	private int id;
	private String name;
	private String address;
	private String noHp;
	@OneToMany(mappedBy="customer", fetch=FetchType.LAZY)
	private List<Penjualan> listPenjualan;
	public Customer(){}

	public Customer(int id, String name, String address, String noHp, List<Penjualan> listPenjualan) {
		super();
		this.id = id;
		this.name = name;
		this.address = address;
		this.noHp = noHp;
		this.listPenjualan = listPenjualan;
	}



	public List<Penjualan> getListPenjualan() {
		return listPenjualan;
	}
	
	public void setListPenjualan(List<Penjualan> listPenjualan) {
		this.listPenjualan = listPenjualan;
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

	public String getNoHp() {
		return noHp;
	}

	public void setNoHp(String noHp) {
		this.noHp = noHp;
	}
	
}

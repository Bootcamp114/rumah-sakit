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
@Table(name="SMK_SUPLIER")
@JsonIdentityInfo(generator=ObjectIdGenerators.
IntSequenceGenerator.class, property="@id")
public class Suplier {

	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE)
	private int id;
	private String name;
	private String address;
	@OneToMany(fetch=FetchType.LAZY, mappedBy="suplier")
	private List<Barang> barangs;
	public Suplier(){}
	
	public Suplier(int id, String name, String address, List<Barang> barangs) {
		super();
		this.id = id;
		this.name = name;
		this.address = address;
		this.barangs = barangs;
	}

	public List<Barang> getBarangs() {
		return barangs;
	}
	
	public void setBarangs(List<Barang> barangs) {
		this.barangs = barangs;
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
	
}

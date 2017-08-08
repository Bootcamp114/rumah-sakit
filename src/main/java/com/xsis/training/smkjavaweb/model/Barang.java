package com.xsis.training.smkjavaweb.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

@Entity
@Table(name="SMK_BARANG")
@JsonIdentityInfo(generator=ObjectIdGenerators.
IntSequenceGenerator.class, property="@id")
public class Barang {

	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE)
	private int id;
	private String  name;
	private Double price;
	private int jumlah;
	@ManyToOne
	private Suplier suplier;
	@OneToMany(fetch=FetchType.LAZY, mappedBy="barang")
	private List<DetailPenjualan> detailPenjualan;
	public Barang(){}

	public Barang(int id, String name, Double price, int jumlah, Suplier suplier,
			List<DetailPenjualan> detailPenjualan) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.jumlah = jumlah;
		this.suplier = suplier;
		this.detailPenjualan = detailPenjualan;
	}


	public List<DetailPenjualan> getDetailPenjualan() {
		return detailPenjualan;
	}
	
	public void setDetailPenjualan(List<DetailPenjualan> detailPenjualan) {
		this.detailPenjualan = detailPenjualan;
	}
	
	public Barang(int id, String name, Double price, int jumlah, Suplier suplier) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.jumlah = jumlah;
		this.suplier = suplier;
	}

	public Suplier getSuplier() {
		return suplier;
	}
	
	public void setSuplier(Suplier suplier) {
		this.suplier = suplier;
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

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public int getJumlah() {
		return jumlah;
	}

	public void setJumlah(int jumlah) {
		this.jumlah = jumlah;
	}
	
	
}

package com.xsis.training.smkjavaweb.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

@Entity
@Table(name="SMK_PENJUALAN")
@JsonIdentityInfo(generator=ObjectIdGenerators.
IntSequenceGenerator.class, property="@id")
public class Penjualan {
	public Penjualan(){}
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private int id;
	@Column(unique=true)
	private String noFaktur;
	private Double jumlahTotalBarang;
	@ManyToOne
	private Customer customer;
	@OneToMany(fetch=FetchType.LAZY, mappedBy="penjualan")
	private List<DetailPenjualan> detailPenjualan;
	
	public Customer getCustomer() {
		return customer;
	}
	
	public Penjualan(int id, String noFaktur, Double jumlahTotalBarang, Customer customer,
			List<DetailPenjualan> detailPenjualan) {
		super();
		this.id = id;
		this.noFaktur = noFaktur;
		this.jumlahTotalBarang = jumlahTotalBarang;
		this.customer = customer;
		this.detailPenjualan = detailPenjualan;
	}

	public List<DetailPenjualan> getDetailPenjualan() {
		return detailPenjualan;
	}
	
	public void setDetailPenjualan(List<DetailPenjualan> detailPenjualan) {
		this.detailPenjualan = detailPenjualan;
	}
	
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNoFaktur() {
		return noFaktur;
	}
	public void setNoFaktur(String noFaktur) {
		this.noFaktur = noFaktur;
	}
	public Double getJumlahTotalBarang() {
		return jumlahTotalBarang;
	}
	public void setJumlahTotalBarang(Double jumlahTotalBarang) {
		this.jumlahTotalBarang = jumlahTotalBarang;
	}
	
	
	
}

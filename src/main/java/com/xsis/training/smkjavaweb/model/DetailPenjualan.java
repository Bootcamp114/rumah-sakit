package com.xsis.training.smkjavaweb.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

@Entity
@Table(name="SMK_DETAIL_PENJUALAN")
@JsonIdentityInfo(generator=ObjectIdGenerators.
IntSequenceGenerator.class, property="@id")
public class DetailPenjualan {

	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE)
	private int id;
	@ManyToOne
	private Penjualan penjualan;
	@ManyToOne
	private Barang barang;
	
	public DetailPenjualan(int id, Penjualan penjualan, Barang barang) {
		super();
		this.id = id;
		this.penjualan = penjualan;
		this.barang = barang;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Penjualan getPenjualan() {
		return penjualan;
	}
	public void setPenjualan(Penjualan penjualan) {
		this.penjualan = penjualan;
	}
	public Barang getBarang() {
		return barang;
	}
	public void setBarang(Barang barang) {
		this.barang = barang;
	}
	
	
}

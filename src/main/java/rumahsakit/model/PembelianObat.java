package rumahsakit.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

@Entity
@Table(name="rs_pembelian")
@JsonIdentityInfo(generator=ObjectIdGenerators.IntSequenceGenerator.class,property="@id")
public class PembelianObat {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private int id;
	private String noBeli;
	@OneToOne
	private Resep resep;
	@ManyToOne
	private Apoteker apoteker;
	private Double total;
	private String tanggal;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNoBeli() {
		return noBeli;
	}
	public void setNoBeli(String noBeli) {
		this.noBeli = noBeli;
	}
	public Resep getResep() {
		return resep;
	}
	public void setResep(Resep resep) {
		this.resep = resep;
	}
	public Apoteker getApoteker() {
		return apoteker;
	}
	public void setApoteker(Apoteker apoteker) {
		this.apoteker = apoteker;
	}
	public Double getTotal() {
		return total;
	}
	public void setTotal(Double total) {
		this.total = total;
	}
	public String getTanggal() {
		return tanggal;
	}
	public void setTanggal(String tanggal) {
		this.tanggal = tanggal;
	}
	
	public PembelianObat(){}
	public PembelianObat(int id, String noBeli, Resep resep, Apoteker apoteker, Double total, String tanggal) {
		super();
		this.id = id;
		this.noBeli = noBeli;
		this.resep = resep;
		this.apoteker = apoteker;
		this.total = total;
		this.tanggal = tanggal;
	}
	
	
}

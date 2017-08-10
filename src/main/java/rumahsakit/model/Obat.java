package rumahsakit.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

@Entity
@Table(name = "rs_obat")
@JsonIdentityInfo(generator=ObjectIdGenerators.IntSequenceGenerator.class,property="@id")
public class Obat {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private  int id;
	private String obat;
	private int harga;
	private String jenisObat;
	@ManyToOne
	private Resep resep;
	@ManyToOne
	private Supplier supplier;
	
	
	public Supplier getSuplier() {
		return supplier;
	}
	public void setSuplier(Supplier suplier) {
		this.supplier = suplier;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getObat() {
		return obat;
	}
	public void setObat(String obat) {
		this.obat = obat;
	}
	public int getHarga() {
		return harga;
	}
	public void setHarga(int harga) {
		this.harga = harga;
	}
	public String getJenisObat() {
		return jenisObat;
	}
	public void setJenisObat(String jenisObat) {
		this.jenisObat = jenisObat;
	}
	public Resep getResep() {
		return resep;
	}
	public void setResep(Resep resep) {
		this.resep = resep;
	}
	
	public Obat(){
		
	}
	public Obat(int id, String obat, int harga, String jenisObat, Resep resep, Supplier supplier) {
		super();
		this.id = id;
		this.obat = obat;
		this.harga = harga;
		this.jenisObat = jenisObat;
		this.resep = resep;
		this.supplier = supplier;
	}
	
	
	
}

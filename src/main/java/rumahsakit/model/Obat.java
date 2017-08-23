package rumahsakit.model;

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

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

@Entity
@Table(name = "rs_obat")
@JsonIdentityInfo(generator=ObjectIdGenerators.IntSequenceGenerator.class,property="@id")
public class Obat {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private  int id;
	@Column(unique = true)
	private String obat;
	private int harga;
	private String jenisObat;
	@ManyToOne
	private Supplier supplier;
	@OneToMany(fetch = FetchType.LAZY , mappedBy = "obat")
	private List<DetailResep> detailResep;
	
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
	
	
	public Supplier getSupplier() {
		return supplier;
	}
	public void setSupplier(Supplier supplier) {
		this.supplier = supplier;
	}
	
	public Obat(){
		
	}
	public List<DetailResep> getDetailResep() {
		return detailResep;
	}
	public void setDetailResep(List<DetailResep> detailResep) {
		this.detailResep = detailResep;
	}
	public Obat(int id, String obat, int harga, String jenisObat, Supplier supplier, List<DetailResep> detailResep) {
		super();
		this.id = id;
		this.obat = obat;
		this.harga = harga;
		this.jenisObat = jenisObat;
		this.supplier = supplier;
		this.detailResep = detailResep;
	}
	

	
	
}

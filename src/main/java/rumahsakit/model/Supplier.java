package rumahsakit.model;

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
@Table(name = "rs_supplier")
@JsonIdentityInfo(generator=ObjectIdGenerators.IntSequenceGenerator.class,property="@id")
public class Supplier {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private int id;
	private String supplier;
	private String alamat;
	private String telpon;
	@OneToMany(fetch = FetchType.LAZY , mappedBy = "supplier")
	private List<Obat> obat;
	
	public List<Obat> getObat() {
		return obat;
	}

	public void setObat(List<Obat> obat) {
		this.obat = obat;
	}

	public Supplier(){
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSupplier() {
		return supplier;
	}

	public void setSupplier(String supplier) {
		this.supplier = supplier;
	}

	public String getAlamat() {
		return alamat;
	}

	public void setAlamat(String alamat) {
		this.alamat = alamat;
	}

	public String getTelpon() {
		return telpon;
	}

	public void setTelpon(String telpon) {
		this.telpon = telpon;
	}

	public Supplier(int id, String supplier, String alamat, String telpon, List<Obat> obat) {
		super();
		this.id = id;
		this.supplier = supplier;
		this.alamat = alamat;
		this.telpon = telpon;
		this.obat = obat;
	}

	
	
	
}

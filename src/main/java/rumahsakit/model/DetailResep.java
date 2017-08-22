package rumahsakit.model;

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
@Table(name = "rs_detail_resep")
@JsonIdentityInfo(generator = ObjectIdGenerators.IntSequenceGenerator.class, property = "@id")
public class DetailResep {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private int id;
	@ManyToOne
	private Obat obat;
	@ManyToOne
	private Resep resep;
	private String dosis;
	private int jumlah;
	
	
	public DetailResep() {
		// TODO Auto-generated constructor stub
	}


	public DetailResep(int id, Obat obat, Resep resep, String dosis, int jumlah) {
		super();
		this.id = id;
		this.obat = obat;
		this.resep = resep;
		this.dosis = dosis;
		this.jumlah = jumlah;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public Obat getObat() {
		return obat;
	}


	public void setObat(Obat obat) {
		this.obat = obat;
	}


	public Resep getResep() {
		return resep;
	}


	public void setResep(Resep resep) {
		this.resep = resep;
	}


	public String getDosis() {
		return dosis;
	}


	public void setDosis(String dosis) {
		this.dosis = dosis;
	}


	public int getJumlah() {
		return jumlah;
	}


	public void setJumlah(int jumlah) {
		this.jumlah = jumlah;
	}
	
	
}

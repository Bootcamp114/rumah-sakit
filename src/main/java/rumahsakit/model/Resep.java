package rumahsakit.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

@Entity
@Table(name = "rs_resep")
@JsonIdentityInfo(generator = ObjectIdGenerators.IntSequenceGenerator.class, property = "@id")
public class Resep {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private int id;
	@OneToOne
	private Pendaftaran pendaftaran;
	private String noResep;
	private String dosis;
	private int jumlah;
	@OneToMany(fetch = FetchType.LAZY , mappedBy = "resep")
	private List<DetailResep> detailResep;
	
	public Resep() {
		// TODO Auto-generated constructor stub
	}


	
	public Resep(int id, Pendaftaran pendaftaran, String noResep, String dosis, int jumlah,
			List<DetailResep> detailResep) {
		super();
		this.id = id;
		this.pendaftaran = pendaftaran;
		this.noResep = noResep;
		this.dosis = dosis;
		this.jumlah = jumlah;
		this.detailResep = detailResep;
	}



	public List<DetailResep> getDetailResep() {
		return detailResep;
	}

	public void setDetailResep(List<DetailResep> detailResep) {
		this.detailResep = detailResep;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Pendaftaran getPendaftaran() {
		return pendaftaran;
	}

	public void setPendaftaran(Pendaftaran pendaftaran) {
		this.pendaftaran = pendaftaran;
	}

	public String getNoResep() {
		return noResep;
	}

	public void setNoResep(String noResep) {
		this.noResep = noResep;
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

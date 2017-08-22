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
	@ManyToOne
	private Dokter dokter;
	private String noResep;
	@OneToMany(fetch = FetchType.LAZY , mappedBy = "resep")
	private List<DetailResep> detailResep;
	
	public Resep() {
		// TODO Auto-generated constructor stub
	}

	

	public Resep(int id, Pendaftaran pendaftaran, Dokter dokter, String noResep, List<DetailResep> detailResep) {
		super();
		this.id = id;
		this.pendaftaran = pendaftaran;
		this.dokter = dokter;
		this.noResep = noResep;
		this.detailResep = detailResep;
	}

	

	public Dokter getDokter() {
		return dokter;
	}



	public void setDokter(Dokter dokter) {
		this.dokter = dokter;
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

	public List<DetailResep> getDetailResep() {
		return detailResep;
	}

	public void setDetailResep(List<DetailResep> detailResep) {
		this.detailResep = detailResep;
	}
	
	
}

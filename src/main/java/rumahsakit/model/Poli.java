package rumahsakit.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

@Entity
@Table(name = "rs_poli")
@JsonIdentityInfo(generator = ObjectIdGenerators.IntSequenceGenerator.class, property = "@id")
public class Poli {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private int id;
	private String poli;
	private String ruangan;
	private int biaya;
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "poli")
	private List<Dokter> dokter;
	@OneToOne
	private Pendaftaran pendaftaran;
	
	public Poli(){}

	public Poli(int id, String poli, String ruangan, int biaya, List<Dokter> dokter, Pendaftaran pendaftaran) {
		super();
		this.id = id;
		this.poli = poli;
		this.ruangan = ruangan;
		this.biaya = biaya;
		this.dokter = dokter;
		this.pendaftaran = pendaftaran;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPoli() {
		return poli;
	}

	public void setPoli(String poli) {
		this.poli = poli;
	}

	public String getRuangan() {
		return ruangan;
	}

	public void setRuangan(String ruangan) {
		this.ruangan = ruangan;
	}

	public int getBiaya() {
		return biaya;
	}

	public void setBiaya(int biaya) {
		this.biaya = biaya;
	}

	public List<Dokter> getDokter() {
		return dokter;
	}

	public void setDokter(List<Dokter> dokter) {
		this.dokter = dokter;
	}

	public Pendaftaran getPendaftaran() {
		return pendaftaran;
	}

	public void setPendaftaran(Pendaftaran pendaftaran) {
		this.pendaftaran = pendaftaran;
	}
	
	

}

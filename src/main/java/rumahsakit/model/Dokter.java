package rumahsakit.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
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
@Table(name = "rs_dokter")
@JsonIdentityInfo(generator=ObjectIdGenerators.IntSequenceGenerator.class,property="@id")
public class Dokter {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private int id;
	@Column(unique = true)
	private int nip;
	private String nama;
	private String jk;
	private String alamat;
	private String noHp;
	@ManyToOne
	private Poli poli;
	@OneToMany(fetch = FetchType.LAZY , mappedBy = "dokter" , cascade = CascadeType.ALL)
	private List<Pemeriksaan> pemeriksaan;
	
	public Dokter() {
		// TODO Auto-generated constructor stub
	}

	public Dokter(int id, int nip, String nama, String jk, String alamat, String noHp, Poli poli,
			List<Pemeriksaan> pemeriksaan) {
		super();
		this.id = id;
		this.nip = nip;
		this.nama = nama;
		this.jk = jk;
		this.alamat = alamat;
		this.noHp = noHp;
		this.poli = poli;
		this.pemeriksaan = pemeriksaan;
	}



	public Poli getPoli() {
		return poli;
	}



	public void setPoli(Poli poli) {
		this.poli = poli;
	}



	public List<Pemeriksaan> getPemeriksaan() {
		return pemeriksaan;
	}

	public void setPemeriksaan(List<Pemeriksaan> pemeriksaan) {
		this.pemeriksaan = pemeriksaan;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getNip() {
		return nip;
	}

	public void setNip(int nip) {
		this.nip = nip;
	}

	public String getNama() {
		return nama;
	}

	public void setNama(String nama) {
		this.nama = nama;
	}

	public String getJk() {
		return jk;
	}

	public void setJk(String jk) {
		this.jk = jk;
	}

	public String getAlamat() {
		return alamat;
	}

	public void setAlamat(String alamat) {
		this.alamat = alamat;
	}

	public String getNoHp() {
		return noHp;
	}

	public void setNoHp(String noHp) {
		this.noHp = noHp;
	}
	
	
	
}

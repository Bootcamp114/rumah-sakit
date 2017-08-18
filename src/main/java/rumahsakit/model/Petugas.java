package rumahsakit.model;

import java.util.List;

import javax.persistence.Column;
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
@Table(name = "rs_petugas")
@JsonIdentityInfo(generator = ObjectIdGenerators.IntSequenceGenerator.class, property = "@id")
public class Petugas {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private int id;
	@Column(unique = true)
	private String nip;
	private String nama;
	private String alamat;
	private int nohp;
	private String jeniskelamin;
	@OneToMany(fetch = FetchType.LAZY, mappedBy="petugas")
	private List<Pendaftaran> pendaftaran;
	
	public Petugas (){}

	public Petugas(int id, String nip, String nama, String alamat, int nohp, String jeniskelamin,
			List<Pendaftaran> pendaftaran) {
		super();
		this.id = id;
		this.nip = nip;
		this.nama = nama;
		this.alamat = alamat;
		this.nohp = nohp;
		this.jeniskelamin = jeniskelamin;
		this.pendaftaran = pendaftaran;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNip() {
		return nip;
	}

	public void setNip(String nip) {
		this.nip = nip;
	}

	public String getNama() {
		return nama;
	}

	public void setNama(String nama) {
		this.nama = nama;
	}

	public String getAlamat() {
		return alamat;
	}

	public void setAlamat(String alamat) {
		this.alamat = alamat;
	}

	public int getNohp() {
		return nohp;
	}

	public void setNohp(int nohp) {
		this.nohp = nohp;
	}

	public String getJeniskelamin() {
		return jeniskelamin;
	}

	public void setJeniskelamin(String jeniskelamin) {
		this.jeniskelamin = jeniskelamin;
	}

	public List<Pendaftaran> getPendaftaran() {
		return pendaftaran;
	}

	public void setPendaftaran(List<Pendaftaran> pendaftaran) {
		this.pendaftaran = pendaftaran;
	}

	
	
	

}

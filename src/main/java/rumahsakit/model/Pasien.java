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
import javax.validation.constraints.Size;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

@Entity
@Table(name = "rs_pasien")
@JsonIdentityInfo(generator = ObjectIdGenerators.IntSequenceGenerator.class, property = "@id")
public class Pasien {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private int id;
	@Size(min=16, max=16)
	@Column(unique = true)
	private String noidentitas;
	private String nama;
	private String alamat;
	@Size(min=11, max=11)
	private String nohp;
	private String tanggallahir;
	private int umur;
	private String jeniskelamin;
	@OneToMany(fetch = FetchType.LAZY, mappedBy="pasien")
	private List<Pendaftaran> pendaftaran;
	
	public Pasien(){}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNoidentitas() {
		return noidentitas;
	}

	public void setNoidentitas(String noidentitas) {
		this.noidentitas = noidentitas;
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

	public String getNohp() {
		return nohp;
	}

	public void setNohp(String nohp) {
		this.nohp = nohp;
	}

	public String getTanggallahir() {
		return tanggallahir;
	}

	public void setTanggallahir(String tanggallahir) {
		this.tanggallahir = tanggallahir;
	}

	public int getUmur() {
		return umur;
	}

	public void setUmur(int umur) {
		this.umur = umur;
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

	public Pasien(int id, String noidentitas, String nama, String alamat, String nohp, String tanggallahir, int umur,
			String jeniskelamin, List<Pendaftaran> pendaftaran) {
		super();
		this.id = id;
		this.noidentitas = noidentitas;
		this.nama = nama;
		this.alamat = alamat;
		this.nohp = nohp;
		this.tanggallahir = tanggallahir;
		this.umur = umur;
		this.jeniskelamin = jeniskelamin;
		this.pendaftaran = pendaftaran;
	}

	
	
}

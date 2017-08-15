package rumahsakit.model;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

@Entity
@Table(name = "rs_pendaftaran")

@JsonIdentityInfo(generator = ObjectIdGenerators.IntSequenceGenerator.class, property = "@id")
public class Pendaftaran {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private int id;
	private String nodaftar;
	private String tanggal;
	private String keluhan;
	@OneToOne
	private Pemeriksaan pemeriksaan;
	@OneToOne
	private Resep resep;
	@OneToOne
	private Poli poli;
	@ManyToOne
	private Pasien pasien;
	@ManyToOne
	private Petugas petugas;
	
	public Pendaftaran(){}
	public Pendaftaran(int id, String nodaftar, String tanggal, String keluhan, Pemeriksaan pemeriksaan, Resep resep,
			Poli poli, Pasien pasien, Petugas petugas) {
		super();
		this.id = id;
		this.nodaftar = nodaftar;
		this.tanggal = tanggal;
		this.keluhan = keluhan;
		this.pemeriksaan = pemeriksaan;
		this.resep = resep;
		this.poli = poli;
		this.pasien = pasien;
		this.petugas = petugas;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNodaftar() {
		return nodaftar;
	}
	public void setNodaftar(String nodaftar) {
		this.nodaftar = nodaftar;
	}
	public String getTanggal() {
		return tanggal;
	}
	public void setTanggal(String tanggal) {
		this.tanggal = tanggal;
	}
	public String getKeluhan() {
		return keluhan;
	}
	public void setKeluhan(String keluhan) {
		this.keluhan = keluhan;
	}
	public Pemeriksaan getPemeriksaan() {
		return pemeriksaan;
	}
	public void setPemeriksaan(Pemeriksaan pemeriksaan) {
		this.pemeriksaan = pemeriksaan;
	}
	public Resep getResep() {
		return resep;
	}
	public void setResep(Resep resep) {
		this.resep = resep;
	}
	public Poli getPoli() {
		return poli;
	}
	public void setPoli(Poli poli) {
		this.poli = poli;
	}
	public Pasien getPasien() {
		return pasien;
	}
	public void setPasien(Pasien pasien) {
		this.pasien = pasien;
	}
	public Petugas getPetugas() {
		return petugas;
	}
	public void setPetugas(Petugas petugas) {
		this.petugas = petugas;
	}
	
	

}

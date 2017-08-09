package rumahsakit.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

@Entity
@Table(name = "rs_pemeriksaan")
@JsonIdentityInfo(generator = ObjectIdGenerators.IntSequenceGenerator.class, property = "@id")
public class Pemeriksaan {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private int id;
	private String noPemeriksaan;
	@OneToOne
	private Pendaftaran pendaftaran;
	@ManyToOne
	private JenisPemeriksaan jenisPemeriksaan;
	@ManyToOne
	private Dokter dokter;
	private String diagnosa;
	private String tindakan;
	private int beratBadan;
	private int tensiDiastolik;
	private int tensiSistolik;

	public Pemeriksaan() {
		// TODO Auto-generated constructor stub
	}

	public Pemeriksaan(int id, Pendaftaran pendaftaran, JenisPemeriksaan jenisPemeriksaan, Dokter dokter,
		 String diagnosa, String tindakan, int beratBadan, int tensiDiastolik, int tensiSistolik) {
		super();
		this.id = id;
		this.pendaftaran = pendaftaran;
		this.jenisPemeriksaan = jenisPemeriksaan;
		this.dokter = dokter;
		this.diagnosa = diagnosa;
		this.tindakan = tindakan;
		this.beratBadan = beratBadan;
		this.tensiDiastolik = tensiDiastolik;
		this.tensiSistolik = tensiSistolik;
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

	public JenisPemeriksaan getJenisPemeriksaan() {
		return jenisPemeriksaan;
	}

	public void setJenisPemeriksaan(JenisPemeriksaan jenisPemeriksaan) {
		this.jenisPemeriksaan = jenisPemeriksaan;
	}

	public Dokter getDokter() {
		return dokter;
	}

	public void setDokter(Dokter dokter) {
		this.dokter = dokter;
	}

	public String getDiagnosa() {
		return diagnosa;
	}

	public void setDiagnosa(String diagnosa) {
		this.diagnosa = diagnosa;
	}

	public String getTindakan() {
		return tindakan;
	}

	public void setTindakan(String tindakan) {
		this.tindakan = tindakan;
	}

	public int getBeratBadan() {
		return beratBadan;
	}

	public void setBeratBadan(int beratBadan) {
		this.beratBadan = beratBadan;
	}

	public int getTensiDiastolik() {
		return tensiDiastolik;
	}

	public void setTensiDiastolik(int tensiDiastolik) {
		this.tensiDiastolik = tensiDiastolik;
	}

	public int getTensiSistolik() {
		return tensiSistolik;
	}

	public void setTensiSistolik(int tensiSistolik) {
		this.tensiSistolik = tensiSistolik;
	}

}

package rumahsakit.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "rs_diagnosa")
public class Diagnosa {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private int id;
	private String noDiagnosa;
	private String diagnosa; 
	private String keterangan;
	@ManyToOne(cascade = CascadeType.ALL)
	private Pemeriksaan pemeriksaan;
	
	public Diagnosa() {
		// TODO Auto-generated constructor stub
	}
	
	public Diagnosa(int id, String noDiagnosa, String diagnosa, String keterangan, Pemeriksaan pemeriksaan) {
		super();
		this.id = id;
		this.noDiagnosa = noDiagnosa;
		this.diagnosa = diagnosa;
		this.keterangan = keterangan;
		this.pemeriksaan = pemeriksaan;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNoDiagnosa() {
		return noDiagnosa;
	}

	public void setNoDiagnosa(String noDiagnosa) {
		this.noDiagnosa = noDiagnosa;
	}

	public String getDiagnosa() {
		return diagnosa;
	}

	public void setDiagnosa(String diagnosa) {
		this.diagnosa = diagnosa;
	}

	public String getKeterangan() {
		return keterangan;
	}

	public void setKeterangan(String keterangan) {
		this.keterangan = keterangan;
	}

	public Pemeriksaan getPemeriksaan() {
		return pemeriksaan;
	}

	public void setPemeriksaan(Pemeriksaan pemeriksaan) {
		this.pemeriksaan = pemeriksaan;
	}
	
}

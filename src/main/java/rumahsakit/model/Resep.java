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

@Entity
@Table(name = "rs_resep")
public class Resep {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private int id;
	@OneToOne
	private Pendaftaran pendaftaran;
	private String noResep;
	@ManyToOne
	private Obat obat;
	private String dosis;
	private int jumlah;
	
	public Resep() {
		// TODO Auto-generated constructor stub
	}
	
	public Resep(int id, Pendaftaran pendaftaran, String noResep, Obat obat, String dosis, int jumlah) {
		super();
		this.id = id;
		this.pendaftaran = pendaftaran;
		this.noResep = noResep;
		this.obat = obat;
		this.dosis = dosis;
		this.jumlah = jumlah;
	}



	public Obat getObat() {
		return obat;
	}



	public void setObat(Obat obat) {
		this.obat = obat;
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

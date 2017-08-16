package rumahsakit.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "rs_pembelianobat")
public class PembelianObat {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE) 
	private int id;
	private String noFaktur;
	@OneToOne
	private DetailObat detailObat;
	private String tanggal;
	@ManyToOne
	private Apoteker apoteker;
	
	public PembelianObat(){
		
	}

	public PembelianObat(int id, String noFaktur, DetailObat detailObat, String tanggal, Apoteker apoteker) {
		super();
		this.id = id;
		this.noFaktur = noFaktur;
		this.detailObat = detailObat;
		this.tanggal = tanggal;
		this.apoteker = apoteker;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNoFaktur() {
		return noFaktur;
	}

	public void setNoFaktur(String noFaktur) {
		this.noFaktur = noFaktur;
	}

	public DetailObat getDetailObat() {
		return detailObat;
	}

	public void setDetailObat(DetailObat detailObat) {
		this.detailObat = detailObat;
	}

	public String getTanggal() {
		return tanggal;
	}

	public void setTanggal(String tanggal) {
		this.tanggal = tanggal;
	}

	public Apoteker getApoteker() {
		return apoteker;
	}

	public void setApoteker(Apoteker apoteker) {
		this.apoteker = apoteker;
	}
	
		
}

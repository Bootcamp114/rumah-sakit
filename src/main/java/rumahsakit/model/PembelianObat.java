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
@Table(name = "rs_pembelianobat")
@JsonIdentityInfo(generator=ObjectIdGenerators.IntSequenceGenerator.class,property="@id")
public class PembelianObat {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE) 
	private int id;
	private String noFaktur;
	@OneToMany(fetch = FetchType.LAZY , mappedBy = "pembelianObat")
	private List<DetailObat> detailObat;
	private Double totalHarga;
	private String tanggal;
	@ManyToOne
	private Apoteker apoteker;
	
	public PembelianObat(){
		
	}

	public PembelianObat(int id, String noFaktur, List<DetailObat> detailObat, Double totalHarga, String tanggal,
			Apoteker apoteker) {
		super();
		this.id = id;
		this.noFaktur = noFaktur;
		this.detailObat = detailObat;
		this.totalHarga = totalHarga;
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


	public List<DetailObat> getDetailObat() {
		return detailObat;
	}



	public void setDetailObat(List<DetailObat> detailObat) {
		this.detailObat = detailObat;
	}

	

	public Double getTotalHarga() {
		return totalHarga;
	}

	public void setTotalHarga(Double totalHarga) {
		this.totalHarga = totalHarga;
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

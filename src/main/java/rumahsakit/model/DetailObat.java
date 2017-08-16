package rumahsakit.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "rs_detailobat")
public class DetailObat {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private int id;
	@OneToOne
	private PembelianObat pembelianObat;
	@ManyToOne
	private Obat obat;
	private int jumlah;
	private Double total;
	
	public DetailObat(){
		
	}

	public DetailObat(int id, PembelianObat pembelianObat, Obat obat, int jumlah, Double total) {
		super();
		this.id = id;
		this.pembelianObat = pembelianObat;
		this.obat = obat;
		this.jumlah = jumlah;
		this.total = total;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public PembelianObat getPembelianObat() {
		return pembelianObat;
	}

	public void setPembelianObat(PembelianObat pembelianObat) {
		this.pembelianObat = pembelianObat;
	}

	public Obat getObat() {
		return obat;
	}

	public void setObat(Obat obat) {
		this.obat = obat;
	}

	public int getJumlah() {
		return jumlah;
	}

	public void setJumlah(int jumlah) {
		this.jumlah = jumlah;
	}

	public Double getTotal() {
		return total;
	}

	public void setTotal(Double total) {
		this.total = total;
	}

	
	
	
}

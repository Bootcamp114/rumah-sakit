package rumahsakit.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

@Entity
@Table(name = "rs_detail_resep")
@JsonIdentityInfo(generator = ObjectIdGenerators.IntSequenceGenerator.class, property = "@id")
public class DetailResep {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private int id;
	@ManyToOne
	private Obat obat;
	@ManyToOne
	private Resep resep;
	
	
	public DetailResep(int id, Obat obat, Resep resep) {
		super();
		this.id = id;
		this.obat = obat;
		this.resep = resep;
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

	public Resep getResep() {
		return resep;
	}

	public void setResep(Resep resep) {
		this.resep = resep;
	}
	
	
	
}

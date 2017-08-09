package rumahsakit.model;

import java.util.List;

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
@Table(name = "rs_jenis_pemeriksaan")
@JsonIdentityInfo(generator=ObjectIdGenerators.IntSequenceGenerator.class,property="@id")
public class JenisPemeriksaan {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private int id;
	private String jenisPemeriksaan;
	@OneToMany(fetch = FetchType.LAZY , mappedBy = "jenisPemeriksaan")
	private List<Pemeriksaan> pemeriksaan;
	
	public JenisPemeriksaan() {
		// TODO Auto-generated constructor stub
	}

	public JenisPemeriksaan(int id, String jenisPemeriksaan, List<Pemeriksaan> pemeriksaan) {
		super();
		this.id = id;
		this.jenisPemeriksaan = jenisPemeriksaan;
		this.pemeriksaan = pemeriksaan;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getJenisPemeriksaan() {
		return jenisPemeriksaan;
	}

	public void setJenisPemeriksaan(String jenisPemeriksaan) {
		this.jenisPemeriksaan = jenisPemeriksaan;
	}

	public List<Pemeriksaan> getPemeriksaan() {
		return pemeriksaan;
	}

	public void setPemeriksaan(List<Pemeriksaan> pemeriksaan) {
		this.pemeriksaan = pemeriksaan;
	}
	
	
}

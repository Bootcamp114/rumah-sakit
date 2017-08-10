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

}

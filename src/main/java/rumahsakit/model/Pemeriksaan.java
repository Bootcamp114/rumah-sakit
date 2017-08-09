package rumahsakit.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

@Entity
@Table(name = "rs_pemeriksaan")
@JsonIdentityInfo(generator=ObjectIdGenerators.IntSequenceGenerator.class,property="@id")
public class Pemeriksaan {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private int id;
	@ManyToOne
	private JenisPemeriksaan jenisPemeriksaan;
	@ManyToOne
	private Dokter dokter;
	private String keluhan;
	private String diagnosa;
	private String tindakan;
	private int beratBadan;
	private int tensiDiastolik;
	private int tensiSistolik;
	
}

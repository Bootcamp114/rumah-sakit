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
@Table(name = "rs_obat")
@JsonIdentityInfo(generator=ObjectIdGenerators.IntSequenceGenerator.class,property="@id")
public class Obat {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private  int id;
	private String obat;
	private int harga;
	private String jenisObat;
	@ManyToOne
	private Apoteker apoteker;
	@ManyToOne
	private Resep resep;
	
}

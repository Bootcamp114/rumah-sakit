package rumahsakit.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

@Entity
@Table(name = "rs_apoteker")
@JsonIdentityInfo(generator=ObjectIdGenerators.IntSequenceGenerator.class,property="@id")
public class Apoteker {
	@Id
	@GeneratedValue (strategy = GenerationType.SEQUENCE)
	private int id;
	private String nip;
	private String nama;
	private String jk;
	private String alamat;
	private String nohp;
}

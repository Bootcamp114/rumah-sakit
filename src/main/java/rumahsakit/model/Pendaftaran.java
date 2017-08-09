package rumahsakit.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "rs_pendaftaran")
public class Pendaftaran {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private int id;
	private int idpasien;
	private int idpoli;
	private int idpetugas;
	private String nodaftar;

}

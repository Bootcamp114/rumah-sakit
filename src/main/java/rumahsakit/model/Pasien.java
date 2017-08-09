package rumahsakit.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "rs_pasien")
public class Pasien {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private int id;
	@Column(unique = true)
	private String noidentitas;
	private String nama;
	private String alamat;
	private int nohp;
	private int umur;
}

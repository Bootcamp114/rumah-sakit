package rumahsakit.model;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "rs_resep")
public class Resep {

	private int id;
	private String dosis;
	private int jumlah;
	
}

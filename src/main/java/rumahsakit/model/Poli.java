package rumahsakit.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "rs_poli")
public class Poli {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private int id;
	private String poli;
	private String ruangan;
	private int biaya;
	@OneToMany(fetch = FetchType.LAZY , mappedBy = "poli")
	private List<Dokter> dokter;

}

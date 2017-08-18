package rumahsakit.dao;

import java.util.List;

import rumahsakit.model.Pasien;
import rumahsakit.model.Poli;

public interface RekamjejakDao {
	
	public List<Pasien> getByNoIdentitas(String noIdentitas);
	
	public List<Poli> getByPoli(String poli);
}

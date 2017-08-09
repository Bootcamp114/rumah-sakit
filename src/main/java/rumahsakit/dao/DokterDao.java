package rumahsakit.dao;

import java.util.List;

import rumahsakit.model.Dokter;

public interface DokterDao {

	public void save(Dokter dokter);
	public void delete(int id);
	public void update(Dokter dokter);
	public List<Dokter> getAllDokter();
	public Dokter getDokterById(int id);
	
}

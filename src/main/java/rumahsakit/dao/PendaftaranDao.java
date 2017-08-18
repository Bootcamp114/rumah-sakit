package rumahsakit.dao;

import java.util.List;

import rumahsakit.model.Pasien;
import rumahsakit.model.Pendaftaran;

public interface PendaftaranDao {
	public void save(Pendaftaran pen);
	 
	public void update(Pendaftaran pen);

	public void delete(int id);

	public Pendaftaran getById(int id);
	
	public List<Pendaftaran> getAllPendaftaran();

}

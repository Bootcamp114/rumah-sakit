package rumahsakit.dao;

import java.util.List;

import rumahsakit.model.Pasien;
import rumahsakit.model.Pendaftaran;
import rumahsakit.model.Petugas;
import rumahsakit.model.Poli;

public interface PendaftaranDao {
	public void save(Pendaftaran pen);
	 
	public void update(Pendaftaran pen);

	public void delete(int id);

	public Pendaftaran getById(int id);
	
	public List<Pendaftaran> getAllPendaftaran();

	public List<Pasien> getByNoIdentitas(String noIdentitas);
	
	public List<Poli> getByPoli(String poli);
	
	public List<Petugas> getByPetugas(String petugas);

}

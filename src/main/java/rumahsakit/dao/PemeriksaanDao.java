package rumahsakit.dao;

import java.util.List;

import rumahsakit.model.Pemeriksaan;

public interface PemeriksaanDao {
	
	public void save(Pemeriksaan pemeriksaan);
	public void update(Pemeriksaan pemeriksaan);
	public void delete(int id);
	public List<Pemeriksaan> getAllPemeriksaan();
	public Pemeriksaan getPemeriksaanById(int id);
	
}

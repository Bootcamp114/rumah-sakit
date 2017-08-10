package rumahsakit.dao;

import java.util.List;

import rumahsakit.model.Pasien;

public interface PasienDao {

	public void save(Pasien pas);
 
	public void update(Pasien pas);

	public void delete(int id);

	public Pasien getById(int id);
	
	public List<Pasien> getAllPasien();

}

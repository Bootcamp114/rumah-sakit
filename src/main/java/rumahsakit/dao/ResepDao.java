package rumahsakit.dao;

import java.util.List;

import rumahsakit.model.Resep;

public interface ResepDao {

	public void save(Resep resep);
	public void update(Resep resep);
	public void delete(int id);
	public Resep getResepById(int id);
	public List<Resep> getAllResepByNoDaftar();
	
}


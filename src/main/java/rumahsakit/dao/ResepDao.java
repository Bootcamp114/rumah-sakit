package rumahsakit.dao;

import java.util.List;

import rumahsakit.model.Resep;

public interface ResepDao {

	public void save();
	public void update();
	public void delete();
	public Resep getResepById();
	public List<Resep> getAllResepByNoDaftar(String noDaftar);
	
}


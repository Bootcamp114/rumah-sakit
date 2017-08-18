package rumahsakit.dao;

import java.util.List;

import rumahsakit.model.Petugas;



public interface PetugasDao {

	public void save(Petugas pet);
	 
	public void update(Petugas pet);

	public void delete(int id);

	public Petugas getById(int id);
	
	public List<Petugas> getAllPetugas();

}

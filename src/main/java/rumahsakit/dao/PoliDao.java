package rumahsakit.dao;

import java.util.List;
import rumahsakit.model.Poli;

public interface PoliDao {
	public void save(Poli pol);
	 
	public void update(Poli pol);

	public void delete(int id);

	public Poli getById(int id);
	
	public List<Poli> getAllPoli();
}

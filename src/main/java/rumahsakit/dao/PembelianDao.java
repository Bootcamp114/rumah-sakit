package rumahsakit.dao;

import java.util.List;

import rumahsakit.model.DetailObat;

public interface PembelianDao {

	public void save(DetailObat detail);
	public List<DetailObat> getAll(String noFaktur);
	public void delete(int id); 
	public String hitungDetail();
}

package rumahsakit.dao;

import java.util.List;

import rumahsakit.model.DetailObat;
import rumahsakit.model.PembelianObat;

public interface PembelianDao {

	public void save(DetailObat detail);
	public List<DetailObat> getAll(String noFaktur);
	public void delete(int id); 
	public String hitungDetail();
	public void pembelian(PembelianObat pem);
}

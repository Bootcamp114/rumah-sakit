package rumahsakit.dao;

import java.util.List;

import rumahsakit.model.DetailResep;
import rumahsakit.model.PembayaranObat;

public interface PembayaranDao {
	public void save(PembayaranObat pembayaranObat);
	public List<DetailResep> getByResep(String noResep);
}

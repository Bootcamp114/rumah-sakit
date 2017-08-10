package rumahsakit.dao;

import java.util.List;

import rumahsakit.model.JenisPemeriksaan;

public interface JenisPemeriksaanDao {
	public void save(JenisPemeriksaan jenisPemeriksaan);
	public void delete(int id);
	public void update(JenisPemeriksaan jenisPemeriksaan);
	public JenisPemeriksaan getJenisPemeriksaanById(int id);
	public List<JenisPemeriksaan> getAllJenisPemeriksaan();
}

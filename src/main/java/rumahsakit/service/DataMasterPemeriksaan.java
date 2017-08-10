package rumahsakit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import rumahsakit.dao.JenisPemeriksaanDao;
import rumahsakit.model.JenisPemeriksaan;

@Service
@Transactional
public class DataMasterPemeriksaan {

	@Autowired
	private JenisPemeriksaanDao jenisPemeriksaanDao;
	
	public void saveJenisPemeriksaan(JenisPemeriksaan jenisPemeriksaan){
		jenisPemeriksaanDao.save(jenisPemeriksaan);
	}
	
	public void updateJenisPemeriksaan(JenisPemeriksaan jenisPemeriksaan){
		jenisPemeriksaanDao.update(jenisPemeriksaan);
	}
	
	public void deleteJenisPemeriksaan(int id){
		jenisPemeriksaanDao.delete(id);
	}
	
	public List<JenisPemeriksaan> getAllJenisPemeriksaan(){
		return jenisPemeriksaanDao.getAllJenisPemeriksaan();
	}
	
	public JenisPemeriksaan getJenisPemeriksaanById(int id){
		return jenisPemeriksaanDao.getJenisPemeriksaanById(id);
	}
}

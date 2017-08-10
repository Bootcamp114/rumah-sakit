package rumahsakit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import rumahsakit.dao.DokterDao;
import rumahsakit.dao.JenisPemeriksaanDao;
import rumahsakit.dao.PoliDao;
import rumahsakit.model.Dokter;
import rumahsakit.model.JenisPemeriksaan;
import rumahsakit.model.Poli;

@Service
@Transactional
public class DataMasterPemeriksaan {

	@Autowired
	private JenisPemeriksaanDao jenisPemeriksaanDao;
	@Autowired
	private DokterDao dokterDao;
	@Autowired
	private PoliDao poliDao;
	
	//jenis pemeriksaan service
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
	
	//end jenis pemeriksaan service
	
	//dokter service
	public void saveDokter(Dokter dokter){
		dokterDao.save(dokter);
	}
	
	public void updateDokter(Dokter dokter){
		dokterDao.update(dokter);
	}
	
	public void deleteDokter(int id){
		dokterDao.delete(id);
	}
	
	public Dokter getDokterById(int id){
		return dokterDao.getDokterById(id);
	}
	
	public List<Dokter> getAllDokter(){
		return dokterDao.getAllDokter();
	}
	//end dokter service
	
	//get poli
	public List<Poli> getAllPoli(){
		return poliDao.getAllPoli();
	}
	//end get poli
}

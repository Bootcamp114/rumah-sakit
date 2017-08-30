package rumahsakit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import rumahsakit.dao.DiagnosaDao;
import rumahsakit.dao.DokterDao;
import rumahsakit.dao.JenisPemeriksaanDao;
import rumahsakit.dao.PemeriksaanDao;
import rumahsakit.dao.PoliDao;
import rumahsakit.dao.ResepDao;
import rumahsakit.model.Diagnosa;
import rumahsakit.model.Dokter;
import rumahsakit.model.JenisPemeriksaan;
import rumahsakit.model.Pemeriksaan;
import rumahsakit.model.Poli;
import rumahsakit.model.Resep;
import rumahsakit.utils.AppUtils;

@Service
@Transactional
public class DataMasterPemeriksaan {

	@Autowired
	private JenisPemeriksaanDao jenisPemeriksaanDao;
	@Autowired
	private DokterDao dokterDao;
	@Autowired
	private PoliDao poliDao;
	@Autowired
	private DiagnosaDao diagnosaDao;
	@Autowired
	private ResepDao resepDao;
	@Autowired
	private PemeriksaanDao pemeriksaanDao;
	@Autowired
	private AppUtils appUtil;
	
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
	
	public Poli getPoliById(int id){
		return poliDao.getById(id);
	}
	//end get poli
	
	//diagnosa
	
	public void saveDiagnosa(Diagnosa diagnosa){
		diagnosaDao.save(diagnosa);
	}
	
	public void deleteDiagnosa(int id){
		diagnosaDao.delete(id);
	}
	
	public void updateDiagnosa(Diagnosa diagnosa){
		diagnosaDao.update(diagnosa);
	}
	
	public List<Diagnosa> getAllDiagnosaByNoDiagnosa(){
		return diagnosaDao.getAllDiagnosaByNoDiagnosa();
	}
	
	public Diagnosa getDiagnosaById(int id){
		return diagnosaDao.getDiagnosaById(id);
	}
	
	public List<Diagnosa> listDiagnosaByIdPeriksa(int idPeriksa) throws Exception{
		return diagnosaDao.listDiagnosaByIdPeriksa(idPeriksa);
	}
	//end diagnosa
	
	//resep
		public List<Resep> getAllResep(){
			return resepDao.getAllResepByNoDaftar();
		}
		
		public void saveResep(Resep resep){
			resepDao.save(resep);
		}
		
		public void updateResep(Resep resep){
			resepDao.update(resep);
		}
		
		public void deleteResep(int id){
			resepDao.delete(id);
		}
		
		public Resep getResepById(int id){
			return resepDao.getResepById(id);
		}
	//end resep
	//pemeeriksaan
		public void savePemeriksaan(Pemeriksaan pemeriksaan){
			pemeriksaanDao.save(pemeriksaan);
			for(Diagnosa diagnosa : pemeriksaan.getDiagnosa()){
				diagnosa.setPemeriksaan(pemeriksaan);
				diagnosaDao.save(diagnosa);
			}
		}
		
		public List<Pemeriksaan> getAllPemriksaan(){
			return pemeriksaanDao.getAllPemeriksaan();
		}
		
		public void delete(int id){
			pemeriksaanDao.delete(id);
		}
	//end pemeriksaan
}

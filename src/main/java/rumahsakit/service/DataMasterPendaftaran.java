package rumahsakit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import rumahsakit.dao.PendaftaranDao;
import rumahsakit.model.Pasien;
import rumahsakit.model.Pendaftaran;
import rumahsakit.model.Petugas;
import rumahsakit.model.Poli;

@Service
@Transactional
public class DataMasterPendaftaran {

	@Autowired
	private PendaftaranDao pendaftaranDao;

	public void savePendaftaran(Pendaftaran pen) {
		pendaftaranDao.save(pen);
	}
	
	public void updatePendaftaran(Pendaftaran pen) {
		pendaftaranDao.update(pen);
	}

	public void deletePendaftaran(int id) {
		pendaftaranDao.delete(id);
	}

	public Pendaftaran getById(int id) {
		return pendaftaranDao.getById(id);
	}

	public List<Pendaftaran> getAlPendaftaran() {
		return pendaftaranDao.getAllPendaftaran();
	}
	public List<Pasien> getByNoIdentitas(String noIdentitas) {
		return pendaftaranDao.getByNoIdentitas(noIdentitas);
	}
	
	public List<Poli> getByPoli(String poli){
		return pendaftaranDao.getByPoli(poli);
	}
	
	public List<Petugas> getByPetugas(String petugas){
		return pendaftaranDao.getByPetugas(petugas);
	}
}

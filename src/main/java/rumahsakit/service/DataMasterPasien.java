package rumahsakit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import rumahsakit.dao.PasienDao;
import rumahsakit.model.Pasien;

@Service
@Transactional
public class DataMasterPasien {

	@Autowired
	private PasienDao pasienDao;

	public void savePasien(Pasien pas) {
		pasienDao.save(pas);
	}
 
	public void updatePasien(Pasien pas) {
		pasienDao.update(pas);
	}

	public void deletePasien(int id) {
		pasienDao.delete(id);
	}

	public Pasien getById(int id) {
		return pasienDao.getById(id);
	}

	public List<Pasien> getAllPasien() {
		return pasienDao.getAllPasien();
	}
}

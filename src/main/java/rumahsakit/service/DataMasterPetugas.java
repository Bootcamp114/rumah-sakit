package rumahsakit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import rumahsakit.dao.PetugasDao;
import rumahsakit.model.Petugas;

@Service
@Transactional
public class DataMasterPetugas {

	@Autowired
	private PetugasDao petugasDao;

	public void savePetugas(Petugas pet) {
		petugasDao.save(pet);

	}

	public void updatePetugas(Petugas pet) {
		petugasDao.update(pet);
	}

	public void deletePetugas(int id) {
		petugasDao.delete(id);
	}

	public Petugas getById(int id) {
		return petugasDao.getById(id);
	}

	public List<Petugas> getAllPetugas() {
		return petugasDao.getAllPetugas();
	}

}

package rumahsakit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import rumahsakit.dao.PoliDao;
import rumahsakit.model.Poli;

@Service
@Transactional
public class DataMasterPoli {
	
	@Autowired
	private PoliDao poliDao;
	
	public void savePoli(Poli pol) {
		poliDao.save(pol);
	}

	public void updatePoli(Poli pol) {
		poliDao.update(pol);
	}

	public void deletePoli(int id) {
		poliDao.delete(id);
	}

	public Poli getById(int id) {
		return poliDao.getById(id);
	}

	public List<Poli> getAllPoli() {
		return poliDao.getAllPoli();
	}
}

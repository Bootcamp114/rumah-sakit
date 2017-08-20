package rumahsakit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import rumahsakit.dao.RekamjejakDao;
import rumahsakit.model.Pasien;
import rumahsakit.model.Poli;
@Service
@Transactional
public class DataMasterRekamjejak {
	
	@Autowired
	private RekamjejakDao rekamjejakDao;
	
	public List<Pasien> getByNoIdentitas(String noIdentitas) {
		return rekamjejakDao.getByNoIdentitas(noIdentitas);
	}
	
	public List<Poli> getByPoli(String poli){   
		return rekamjejakDao.getByPoli(poli);
	}

}

package rumahsakit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import rumahsakit.dao.RekamjejakDao;
import rumahsakit.model.Pasien;
import rumahsakit.model.Poli;

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

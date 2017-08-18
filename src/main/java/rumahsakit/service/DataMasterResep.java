package rumahsakit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import rumahsakit.dao.ResepDao;
import rumahsakit.model.Resep;

@Service
@Transactional
public class DataMasterResep {
	
	@Autowired
	private ResepDao resepDao;
	
	public void saveResep(Resep resep){
		resepDao.save(resep);
	}
	
	public void deleteResep(int id){
		resepDao.delete(id);
	}
	
	public void updateResep(Resep resep){
		resepDao.update(resep);
	}
	
	public Resep getResepById(int id){
		return resepDao.getResepById(id);
	}
	
	public List<Resep> getAllResep(){
		return resepDao.getAllResepByNoDaftar();
	}
}


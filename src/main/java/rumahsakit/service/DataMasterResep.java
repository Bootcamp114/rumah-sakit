package rumahsakit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import rumahsakit.dao.DetailResepDao;
import rumahsakit.dao.ResepDao;
import rumahsakit.model.DetailResep;
import rumahsakit.model.Resep;

@Service
@Transactional
public class DataMasterResep {
	
	@Autowired
	private ResepDao resepDao;
	@Autowired
	private DetailResepDao detailResepDao;
	
	public void saveResep(Resep resep){
		resepDao.save(resep);
		for(DetailResep detailResep : resep.getDetailResep()){
			detailResep.setResep(resep);
			detailResepDao.saveDetail(detailResep);
		}
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


package rumahsakit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import rumahsakit.dao.ApotekerDao;
import rumahsakit.dao.SupplierDao;
import rumahsakit.model.Apoteker;
import rumahsakit.model.Supplier;
@Service
@Transactional
public class DataMasterPembelian {
	@Autowired
	SupplierDao supplierDao; 
	@Autowired 
	ApotekerDao apotekerDao;
	
	public void saveSupplier(Supplier supp){
		supplierDao.save(supp);
	}

	public void updateSupplier(Supplier supp) {
		// TODO Auto-generated method stub
		supplierDao.update(supp);
	}

	public void deleteSupplier(int id) {
		// TODO Auto-generated method stub
		supplierDao.delete(id);
	}

	public List<Supplier> getAllSupplier() {
		// TODO Auto-generated method stub
		return supplierDao.getAll();
	}

	public Supplier getSupplierById(int id) {
		// TODO Auto-generated method stub
		return supplierDao.getById(id);
	}
	
	public void saveApoteker(Apoteker apo){
		apotekerDao.save(apo);
	}

	public void updateApoteker(Apoteker apo) {
		// TODO Auto-generated method stub
		apotekerDao.update(apo);
	}

	public void deleteApoteker(int id) {
		// TODO Auto-generated method stub
		apotekerDao.delete(id);
	}

	public List<Apoteker> getAllApoteker() {
		// TODO Auto-generated method stub
		return apotekerDao.getAll();
	}

	public Apoteker getApotekerById(int id) {
		// TODO Auto-generated method stub
		return apotekerDao.getById(id);
	}
	
}

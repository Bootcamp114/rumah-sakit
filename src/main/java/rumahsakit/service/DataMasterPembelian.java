package rumahsakit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import rumahsakit.dao.SupplierDao;
import rumahsakit.model.Supplier;
@Service
@Transactional
public class DataMasterPembelian {
	@Autowired
	SupplierDao supplierDao;
	
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
	
}

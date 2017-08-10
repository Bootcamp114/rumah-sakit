package rumahsakit.service;

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
}

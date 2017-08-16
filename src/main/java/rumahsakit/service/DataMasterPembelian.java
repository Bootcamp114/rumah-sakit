package rumahsakit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import rumahsakit.dao.ApotekerDao;
import rumahsakit.dao.ObatDao;
import rumahsakit.dao.PembelianDao;
import rumahsakit.dao.SupplierDao;
import rumahsakit.model.Apoteker;
import rumahsakit.model.DetailObat;
import rumahsakit.model.Obat;
import rumahsakit.model.PembelianObat;
import rumahsakit.model.Pendaftaran;
import rumahsakit.model.Supplier;
@Service
@Transactional
public class DataMasterPembelian {
	@Autowired
	SupplierDao supplierDao; 
	@Autowired 
	ApotekerDao apotekerDao;
	@Autowired
	ObatDao obatDao;
	@Autowired
	PembelianDao pembelianDao;
	
	//Service Supplier-------------------------------------------------------------
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
	
	
	//Service Apoteker--------------------------------------------------------------
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
	
	//Service Obat------------------------------------------------------
	public void saveObat(Obat obt){
		obatDao.save(obt);
	}

	public void updateObat(Obat obt) {
		// TODO Auto-generated method stub
		obatDao.update(obt);
	}

	public void deleteObat(int id) {
		// TODO Auto-generated method stub
		obatDao.delete(id);
	}

	public List<Obat> getAllObat() {
		// TODO Auto-generated method stub
		return obatDao.getAll();
	}

	public Obat getObatById(int id) {
		// TODO Auto-generated method stub
		return obatDao.getById(id);
	}

	public void savePembelian(DetailObat detail) {
		// TODO Auto-generated method stub
		pembelianDao.save(detail);
	}

	public List<DetailObat> getAllDetail() {
		// TODO Auto-generated method stub
		return pembelianDao.getAll();
	}

	public void deleteDetail(int id) {
		// TODO Auto-generated method stub
		pembelianDao.delete(id);
	}

	public String hitungDetail() {
		// TODO Auto-generated method stub
		return pembelianDao.hitungDetail();
	}

}

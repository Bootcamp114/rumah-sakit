package rumahsakit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import rumahsakit.dao.PembayaranDao;
import rumahsakit.model.DetailResep;
import rumahsakit.model.PembayaranObat;
@Service
@Transactional
public class DataMasterPembayaran {

	@Autowired
	PembayaranDao pembayaranDao;
	
	public List<DetailResep> getByResep(String noResep) {
		// TODO Auto-generated method stub
		return pembayaranDao.getByResep(noResep);
	}

	public void save(PembayaranObat pembayaran) {
		// TODO Auto-generated method stub
		pembayaranDao.save(pembayaran);
	}

}

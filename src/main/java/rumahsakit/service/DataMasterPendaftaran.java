package rumahsakit.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import rumahsakit.dao.PendaftaranDao;
import rumahsakit.model.Pendaftaran;

@Service
@Transactional
public class DataMasterPendaftaran {

	@Autowired
	private PendaftaranDao pendaftaranDao;

	public void savePendaftaran(Pendaftaran pen) {
		pendaftaranDao.save(pen);
	}
}

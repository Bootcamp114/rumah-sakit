package rumahsakit.dao;

import java.util.List;

import rumahsakit.model.Diagnosa;

public interface DiagnosaDao {

	public void save(Diagnosa diagnosa);
	public void delete(int id);
	public void update(Diagnosa diagnosa);
	public List<Diagnosa> getAllDiagnosaByNoDiagnosa();
	public Diagnosa getDiagnosaById(int id);
	public List<Diagnosa> listDiagnosaByIdPeriksa(int idPeriksa) throws Exception;

}

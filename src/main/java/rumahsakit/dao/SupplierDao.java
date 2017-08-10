package rumahsakit.dao;

import java.util.List;

import rumahsakit.model.Supplier;

public interface SupplierDao {
	public void save(Supplier supp);
	public void update(Supplier supp);
	public void delete(int id);
	public Supplier getById(int id);
	public List<Supplier> getAll();
}
 
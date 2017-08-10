package rumahsakit.dao;

import java.util.List;

import rumahsakit.model.Apoteker;

public interface ApotekerDao {
public void save(Apoteker apo);
public void update(Apoteker apo);
public void delete(int id);
public Apoteker getById(int id);
public List<Apoteker> getAll();
}

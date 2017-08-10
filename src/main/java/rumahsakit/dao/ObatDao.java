package rumahsakit.dao;

import java.util.List;

import rumahsakit.model.Obat;

public interface ObatDao {
public void save(Obat obt);
public void update(Obat obt);
public void delete(int id);
public Obat getById(int id);
public List<Obat> getAll();
}

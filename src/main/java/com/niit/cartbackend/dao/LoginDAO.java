package com.niit.cartbackend.dao;
import java.util.List;
import com.niit.cartbackend.model.Login;
public interface LoginDAO {
	public List<Login> list();
	public Login get(int id);
	public void save(Login login);
	public void update(Login login);
	public void delete(int id);

}

package com.niit.cartbackend.dao;
import java.util.List;
import com.niit.cartbackend.model.Login;
import com.niit.cartbackend.model.Register;
public interface RegisterDAO
{
	public List<Register> list();
	public Login get(int id);
	public void saveOrUpdate(Register register);
	public void delete(int id);
}
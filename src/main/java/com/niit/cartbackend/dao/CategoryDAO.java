package com.niit.cartbackend.dao;

import java.util.List;

import com.niit.cartbackend.model.Category;

public interface CategoryDAO {
	public List<Category> list();
	public Category get(int id);
	public void saveorUpdate(Category category);

	public void  delete(int id);
	
	

}

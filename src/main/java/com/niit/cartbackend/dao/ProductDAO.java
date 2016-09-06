package com.niit.cartbackend.dao;

import java.util.List;

import com.niit.cartbackend.model.Product;


public interface ProductDAO {
	public List<Product> list();
	public Product  get(int id);
	public void saveorUpdate(Product product);
	
	public void  delete(int id);
	public int deleteProduct(int id);
	public List<Product> getAllProducts();
	

}

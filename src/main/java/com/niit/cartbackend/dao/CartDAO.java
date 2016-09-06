package com.niit.cartbackend.dao;

import java.util.List;

import com.niit.cartbackend.model.Cart;




public interface CartDAO {


	public List<Cart> list();

	public Cart get(int id);
	public void saveOrUpdate(Cart Cart);

	public int delete(int id);
	
	
	public int getTotalAmount(int id);

	public void update(Cart cart);

	public void save(Cart cart);


}

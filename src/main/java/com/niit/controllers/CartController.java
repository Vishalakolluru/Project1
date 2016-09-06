package com.niit.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.servlet.ModelAndView;

import com.niit.cartbackend.dao.CartDAO;

import com.niit.cartbackend.model.Cart;
import com.niit.cartbackend.model.Login;
import com.niit.cartbackend.model.Product;


@Controller
public class CartController {
	@Autowired
	CartDAO cd;
	@Autowired
	Cart c1;
	@Autowired
	Product p1;
	@ModelAttribute("Cart")
    public Cart addcart(){
    	return new Cart();
    }
	@ModelAttribute("Product")
    public Product add(){
    	return new Product();
    }
	@ModelAttribute("Login")
    public Login createuser(){
    	return new Login();
    }
	@RequestMapping("/mycart")
	public ModelAndView display5()
	{
		ModelAndView m1=new ModelAndView("mycart");
		return m1;		
	}
	@RequestMapping("storeCart")
	
	public String addcart(HttpServletRequest request, @Valid @ModelAttribute("Cart") Cart cart,@Valid @ModelAttribute("Product") Product product,@Valid @ModelAttribute("Login") Login login,
			BindingResult result) {
		System.out.println("values are successfully inserted");
		if (result.hasErrors()) {
			return "User";
		}
		cart.setPrice(product.getPrice());
		cart.setProductName(product.getName());
		cart.setQuantity(product.getQuantity());
		
		System.out.println("values are successfully inserted");
		cd.save(cart);
	
		return "User";
	}


}

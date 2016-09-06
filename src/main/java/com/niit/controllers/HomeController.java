package com.niit.controllers;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.google.gson.Gson;
import com.niit.cartbackend.dao.LoginDAO;
import com.niit.cartbackend.dao.ProductDAO;
import com.niit.cartbackend.dao.RegisterDAO;
import com.niit.cartbackend.dao.SupplierDAO;
import com.niit.cartbackend.model.Category;
import com.niit.cartbackend.model.Login;
import com.niit.cartbackend.model.Product;
import com.niit.cartbackend.model.Register;
import com.niit.cartbackend.model.Supplier;

@Controller
public class HomeController {
	@Autowired
	ProductDAO pd;
	@Autowired
	SupplierDAO s1;
	@Autowired
	LoginDAO us;
	@Autowired 
    RegisterDAO rd;
	@RequestMapping("/")
	public ModelAndView display()
	{
		ModelAndView m1=new ModelAndView("Home");
		return m1;		
	}
	@RequestMapping("/Home")
	public ModelAndView display5()
	{
		ModelAndView m1=new ModelAndView("Home");
		return m1;		
	}
	@RequestMapping("/Login")
	public ModelAndView display1()
	{
		ModelAndView m11=new ModelAndView("Login");
		return m11;		
	}
	@RequestMapping("/Products")
	public ModelAndView display6()
	{
		ModelAndView m2=new ModelAndView("Products");
		
		return m2;		
	}
	@RequestMapping("/Categories")
	public ModelAndView display7()
	{
		ModelAndView m3=new ModelAndView("Categories");
		
		return m3;		
	}
	
	@RequestMapping("/Register")
	public ModelAndView display2()
	{
		ModelAndView m3=new ModelAndView("Register");
		return m3;		
	}
	
	@ModelAttribute("Product")
	public Product addProduct(){
		return new Product();
	}
	@RequestMapping("/hai")
	public String display4()
	{
		return "Home";		
}
	@RequestMapping("storeproduct")
	public String addproduct(HttpServletRequest request,@Valid @ModelAttribute("Product")Product product,BindingResult result)
	       {
	 System.out.println("values are successfully inserted");
	     	if(result.hasErrors())
	    	{
	    		return "AddProduct";
	    	}
	     	String filename=product.getImg().getOriginalFilename();
	     	product.setImage(filename);
	     	
	     	try{
	     		byte[] bytes=new byte[product.getImg().getInputStream().available()];
	     		product.getImg().getInputStream().read(bytes);
	     		BufferedInputStream buffer=new BufferedInputStream(product.getImg().getInputStream());
	     		MultipartFile file=product.getImg();
	     		String path=request.getServletContext().getRealPath("/")+"resources/images";
	     		File rootPath=new File(path);
	     		if(!rootPath.exists())
	     			rootPath.mkdirs();
	     		File store=new File(rootPath.getAbsolutePath()+"/"+filename);
	     		System.out.println("Image path :"+path);
	     		OutputStream os=new FileOutputStream(store);
	     		os.write(bytes);
	     	}
	     	catch(Exception e){
	     		System.out.println(e.getMessage());
	     	}
	     	
			pd.saveorUpdate(product);
	    	return "RetriveProducts";
      }
	@ModelAttribute("Register")
    public Register createuser(){
    	return new Register();
    }
	@RequestMapping(value = "storeUser", method = RequestMethod.POST)
    public String addUser(HttpServletRequest request,@Valid @ModelAttribute("Register")Register register,@Valid @ModelAttribute("Login")Login login , BindingResult result, Model model){
       	
    	if(result.hasErrors()) {
    		System.out.println("hello world");
    		
    		return "Register";
    	}   	
    	rd.saveOrUpdate(register);
    	login.setId(register.getId());
    	login.setStatus(register.getStatus());
    	us.save(login);
    	return "Home";
       }
	
	@RequestMapping("/RetriveProducts")
	public ModelAndView displayRecords()
	{  
		ModelAndView m1=new ModelAndView("RetriveProducts");
		return m1;
	} 
	@RequestMapping("/edit")
	public ModelAndView edit()
	{  
		ModelAndView m2=new ModelAndView("edit");
		return m2;
	} 
	@RequestMapping(value="/list",method=RequestMethod.GET,produces="application/json")
    public @ResponseBody String showList(){
    	List list=pd.list();
    	Gson x=new Gson();
    	String json=x.toJson(list);
    	return json;
    }
	@RequestMapping(value="view",method=RequestMethod.GET)
    public ModelAndView view(@RequestParam int id, @ModelAttribute Product products){
    	Product product=pd.get(id);
    	return new ModelAndView("view","Product",product);
	}
	@RequestMapping("/delete")
    public ModelAndView deleteProduct(@RequestParam int id)
    {
	 System.out.println("hello welcome to niit");
	    pd.delete(id);
    	ModelAndView mv=new ModelAndView("RetriveProducts");
    	return mv;
    }
	
	@RequestMapping(value="/update",method=RequestMethod.POST)
    public ModelAndView updateChair(HttpServletRequest request,@Valid @ModelAttribute("Product")Product product,BindingResult result)
    {
    	
    	String filename=product.getImg().getOriginalFilename();
    	
    	product.setImage(filename);
    	
    	try{
    		byte[] bytes=new byte[product.getImg().getInputStream().available()];
    		product.getImg().getInputStream().read(bytes);
    		BufferedInputStream buffer=new BufferedInputStream(product.getImg().getInputStream());
    		MultipartFile file=product.getImg();
    		String path=request.getServletContext().getRealPath("/")+"resources/images";
    		File rootPath=new File(path);
    		if(!rootPath.exists())
    			rootPath.mkdirs();
    		File store=new File(rootPath.getAbsolutePath()+"/"+filename);
    		System.out.println("Image path :"+path);
    		OutputStream os=new FileOutputStream(store);
    		os.write(bytes);
    	}
    	catch(Exception e){
    		System.out.println(e.getMessage());
    	}		        
    	pd.saveorUpdate(product);
    	return new ModelAndView("RetriveProducts");
    }
	@RequestMapping(value="edit", method=RequestMethod.GET)
	public ModelAndView editProduct(@RequestParam int id){
	 System.out.println("hello .....................................");	
	 Product p1=pd.get(id);
	 System.out.println("hiii............");
	 System.out.println(" products"+p1.getName());
		return new ModelAndView("edit","Product",p1);
	}
	@RequestMapping("logoutsuccess")
	public ModelAndView logoutpage(){
		ModelAndView mv9 = new ModelAndView("logoutsuccess");
		return mv9;
	}

	@RequestMapping(value = "/Logout", method = RequestMethod.GET)
	public void logout(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws ServletException, IOException {
		HttpSession newsession = request.getSession(false);
		if (newsession != null) 
	    {
	         newsession.invalidate();

	    }
		response.sendRedirect("j_spring_security_logout");	
		}
	@RequestMapping("AddProduct")
	public ModelAndView display8() {

		ModelAndView mv3 = new ModelAndView("AddProduct");
		mv3.addObject("supplier", new Supplier());
        List suppliers= s1.list();
        mv3.addObject("suppliers", suppliers);
        return mv3;
	}
    }
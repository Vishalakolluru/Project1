package com.niit.controllers;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.google.gson.Gson;
import com.niit.cartbackend.dao.CategoryDAO;
import com.niit.cartbackend.dao.SupplierDAO;
import com.niit.cartbackend.model.Category;
import com.niit.cartbackend.model.Supplier;
@Controller
public class CategoryController 
{
	@Autowired
	CategoryDAO c1;
	@Autowired
	SupplierDAO s1;
	@RequestMapping("AddCategory")
	public ModelAndView display5()
	{
		ModelAndView m5=new ModelAndView("AddCategory");
		return m5;		
	}
	@ModelAttribute("Category")
	public Category addCategory(){
		return new Category();
	}
	@RequestMapping("storeCategory")
	public String addcategory(HttpServletRequest request,@Valid @ModelAttribute("Category")Category category,BindingResult result)
	       {
	 System.out.println("values are successfully inserted");
	     	if(result.hasErrors())
	    	{
	    		return "AddCategory";
	    	}
	     	
	    	
	    	c1.saveorUpdate(category);
	     
	    
	    	return "RetriveCategory";
}
	@RequestMapping("/RetriveCategory")
	public ModelAndView displaycategory()
	{  
		ModelAndView m=new ModelAndView("RetriveCategory");
		return m;
	} 
	@RequestMapping("/editcategory")
	public ModelAndView edit1()
	{  
		ModelAndView m6=new ModelAndView("editcategory");
		return m6;
	} 
	@RequestMapping(value="/list1",method=RequestMethod.GET,produces="application/json")
    public @ResponseBody String showList1(){
    	List<Category> list=c1.list();
    	Gson c=new Gson();
    	String json=c.toJson(list);
    	return json;
    }
	@RequestMapping(value="viewcategory",method=RequestMethod.GET)
    public ModelAndView viewcategory(@RequestParam int id, @ModelAttribute Category categories){
    	Category category=c1.get(id);
    	return new ModelAndView("viewcategory","Category",category);
	}
	@RequestMapping("/deletecategory")
    public ModelAndView deletecategory(@RequestParam int id)
    {
	 System.out.println("hello welcome to niit");
	  
	 c1.delete(id);
    	ModelAndView m7=new ModelAndView("RetriveCategory");
    	return m7;
    }
	@RequestMapping(value="/updatecategory",method=RequestMethod.POST)
    public ModelAndView updateCategory(HttpServletRequest request,@Valid @ModelAttribute("Category")Category category,BindingResult result)
    {
		c1.saveorUpdate(category);
    	return new ModelAndView("RetriveCategory");
    }
	@RequestMapping(value="editcategory", method=RequestMethod.GET)
	public ModelAndView editcategory(@RequestParam int id){
	 System.out.println("hello .....................................");	
	 Category cd=c1.get(id);
	 System.out.println("hiii............");
	 System.out.println("categories"+cd.getName());
		return new ModelAndView("editcategory","Category",cd);
	}
}
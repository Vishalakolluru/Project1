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
import com.niit.cartbackend.dao.SupplierDAO;
import com.niit.cartbackend.model.Supplier;

@Controller
public class SupplierController {
	@Autowired
	SupplierDAO sd;

	@RequestMapping("AddSupplier")
	public ModelAndView display7() {
		ModelAndView s = new ModelAndView("AddSupplier");
		return s;
	}

	@ModelAttribute("Supplier")
	public Supplier addSupplier() {
		return new Supplier();
	}

	@RequestMapping("storeSupplier")
	public String addsupplier(HttpServletRequest request, @Valid @ModelAttribute("Supplier") Supplier supplier,
			BindingResult result) {
		System.out.println("values are successfully inserted");
		if (result.hasErrors()) {
			return "AddSupplier";
		}

		sd.saveorUpdate(supplier);
		return "RetriveSupplier";
	}

	@RequestMapping("/RetriveSupplier")
	public ModelAndView displaysupplier() {
		ModelAndView s1 = new ModelAndView("RetriveSupplier");
		return s1;
	}

	@RequestMapping("/editsupplier")
	public ModelAndView edit2() {
		ModelAndView s2 = new ModelAndView("editsupplier");
		return s2;
	}

	@RequestMapping(value = "/list2", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody String showList2() {
		List<Supplier> list = sd.list();
		Gson s = new Gson();
		String json = s.toJson(list);
		return json;
	}

	@RequestMapping(value = "viewsupplier", method = RequestMethod.GET)
	public ModelAndView viewsupplier(@RequestParam int id, @ModelAttribute Supplier suppliers) {
		Supplier supplier = sd.get(id);
		return new ModelAndView("viewsupplier", "Supplier", supplier);
	}

	@RequestMapping("/deletesupplier")
	public ModelAndView deleteSupplier(@RequestParam int id) {
		System.out.println("hello welcome to niit");
		sd.delete(id);
		ModelAndView s4 = new ModelAndView("RetriveSupplier");
		return s4;
	}

	@RequestMapping(value = "/updatesupplier", method = RequestMethod.POST)
	public ModelAndView updateCategory(HttpServletRequest request, @Valid @ModelAttribute("Supplier") Supplier supplier,
			BindingResult result) {
		sd.saveorUpdate(supplier);
		return new ModelAndView("RetriveSupplier");
	}

	@RequestMapping(value = "editsupplier", method = RequestMethod.GET)
	public ModelAndView editsupplier(@RequestParam int id) {
		System.out.println("hello .....................................");
		Supplier sc = sd.get(id);
		System.out.println("hiii............");
		System.out.println("suppliers" + sc.getCategoryid());
		return new ModelAndView("editsupplier", "Supplier", sc);
	}
}
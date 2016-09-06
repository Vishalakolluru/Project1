package com.niit.controllers;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class AdminController
{
	@RequestMapping(value = "/welcome", method = RequestMethod.GET)
	public ModelAndView checkUserOne(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws Exception {
		System.out.println("hi");
		if (request.isUserInRole("ROLE_ADMIN")) {
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			String str = auth.getName(); 
			session = request.getSession(true);
			session.setAttribute("loggedInUser", str);
			ModelAndView m1 = new ModelAndView("Admin");
			return m1;
		}
		else
		{
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			String str = auth.getName(); 
			session = request.getSession(true);
			session.setAttribute("loggedInUser", str);
			ModelAndView m10 = new ModelAndView("User");
			return m10;
		}
		
	}
	@RequestMapping(value = "/fail2login", method = RequestMethod.GET)
	public ModelAndView loginerror(ModelMap model) {
		System.out.println("hello shiva..........................................");
		return new ModelAndView("Login", "error", true);
	}
}

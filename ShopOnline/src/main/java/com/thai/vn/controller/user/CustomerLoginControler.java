package com.thai.vn.controller.user;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.thai.vn.model.Customer;
import com.thai.vn.response.Response;
import com.thai.vn.service.CustomerService;
import com.thai.vn.service.ProductTypeService;

@Controller
public class CustomerLoginControler {

	@Autowired
	ProductTypeService productTypeService;

	@Autowired
	CustomerService customerService;

	@PostMapping("/login")
	public String login(ModelMap model,HttpSession session, HttpServletResponse response,
			@RequestParam("email1") String email, @RequestParam("password1") String password,
			@RequestParam(value = "remember-me", defaultValue = "false") boolean remember) {

		Response responseEntity = customerService.findByEmailAndPassword(email, password);

		  if (responseEntity.getStatus()){
		  
		  Customer customer = (Customer) responseEntity.getData();
		  
		  Cookie cookie1 = new Cookie("ck1",customer.getEmail()); Cookie cookie2 = new
		  Cookie("ck2",customer.getPassword());
		  
		  if(remember) { cookie1.setMaxAge(30*24*60*60);
		  cookie2.setMaxAge(30*24*60*60); }else { cookie1.setMaxAge(0);
		  cookie2.setMaxAge(0); }
		  
		  response.addCookie(cookie1); response.addCookie(cookie2);
		  
		  //model.addAttribute("Customer", customer); 
		  session.setAttribute("Customer", customer); 
		  }
		 

		  model.addAttribute("Response", responseEntity);
		  model.addAttribute("ProductTypes", productTypeService.findAll());
			return "user/index";
		 
	}
		
	  @GetMapping("/logout") public String logout(HttpSession session) {
		  session.removeAttribute("Customer");
		  return "redirect:/"; 
	  }
	 
		
}

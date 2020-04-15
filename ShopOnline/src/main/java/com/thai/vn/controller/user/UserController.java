package com.thai.vn.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.thai.vn.service.ProductService;
import com.thai.vn.service.ProductTypeService;


@Controller
public class UserController {

	@Autowired
	ProductTypeService productTypeService;
	
	@Autowired
	ProductService productService;
	
	@GetMapping("/")
	public String home(ModelMap model) {
			
		model.addAttribute("ProductTypes", productTypeService.findAll());
	
		return "user/index";
	}
	
	@GetMapping("/{id}")
	public String product(ModelMap model,@PathVariable("id") int id) {
		
		model.addAttribute("product", productService.getOne(id));
		return "user/product";
	}
	
	@GetMapping("/cart")
	public String cartt() {
		
		return "user/cart";
	}
}

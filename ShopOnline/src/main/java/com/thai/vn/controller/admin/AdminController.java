package com.thai.vn.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

	@RequestMapping("/admin")
	public String home() {
		
		return("layout_admin");
	}
	
	@RequestMapping("/admin/product_type")
	public String viewProduct() {
		
		return("admin/product_type");
	}
}

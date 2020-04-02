package com.thai.vn.api;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.thai.vn.model.Customer;
import com.thai.vn.response.Response;
import com.thai.vn.service.CustomerService;

@RestController()
public class CustomerAPI {

	@Autowired
	CustomerService customerService;

	
	
	@PutMapping("/customer")
	public ResponseEntity<Response> update(@RequestBody Customer customer){
		
		return ResponseEntity.ok(customerService.update(customer));
	}
	
	@PostMapping("/customer")
	public ResponseEntity<Response> insert(@RequestBody Customer customer){
		System.out.println(customer.toString());
		
		return ResponseEntity.ok(customerService.insert(customer));
	}
	
	
	
	  @PutMapping(value ="/customer/change_pw", params = {"id","password","password_new","comfirm"}) 
	  public ResponseEntity<Response> changePassword( @RequestParam Long id,
									  	@RequestParam String password,
									  	@RequestParam String password_new,
									  	@RequestParam String comfirm){
	
		  if (!password_new.equals(comfirm)) 
			  return ResponseEntity.ok( new Response(false, "Xác nhận mật khẩu không khớp", null));
	  
		  return ResponseEntity.ok(customerService.changePassword(id,password,password_new));
	  }
	 
	 

}

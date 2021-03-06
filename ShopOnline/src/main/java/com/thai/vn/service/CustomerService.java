package com.thai.vn.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thai.vn.model.Customer;
import com.thai.vn.repository.CustomerRepository;
import com.thai.vn.response.Response;


@Service
public class CustomerService {
	@Autowired
	CustomerRepository customerRepository;
	
	public Response findByEmailAndPassword(String email, String password) {
		
		Customer customer = null;
		
		try {
		 customer = customerRepository.findByEmailAndPassword(email,password);
		 
		 if (customer == null) {
				return new Response(false,"Sai email hoặc tài khoản đăng nhập", customer);
			}
			else {
				return new Response(true,"Đăng nhập thành công", customer);
			}
		 
		} catch (Exception e) {
			
			return new Response(false,"Có lỗi sảy ra khi truy xuất", customer);
		}

		

	}
	
	public Response insert(Customer customer_new) {

		try {
			Customer customer = customerRepository.save(customer_new);
			return new Response(true, "Thêm mới thành công", customer);
		} catch (Exception e) {
			return new Response(false, "Thêm thất bại", null);
		}
	}
	
	
	public Response update(Customer customer_new) {
		
		try {
			Customer customer = customerRepository.findById(customer_new.getId()).orElse(null);
			if (customer ==null) {
				return new Response(false, "Nhân viên không tồn tại", null);
			}else {
				return new Response(true, "Cập nhật thành công", customerRepository.save(customer_new));
			}
			 
		} catch (Exception e) {
			
			return new Response(false, "Có lỗi xảy ra khi cập nhật", null);
		}
		
	}

	
	public Response changePassword(Long id, String password, String new_password) {
		try {
			Customer customer = customerRepository.findById(id).orElse(null);
			if (customer == null) {
				return new Response(false, "Khách hàng không tồn tại", 	null);
			}
			else if(!customer.getPassword().equals(password)) {
				return new Response(false, "Sai mật khẩu", 	null);
			}
			else {
				customer.setPassword(new_password);
				return new Response(true, "Đổi mật khẩu thành công", customerRepository.save(customer));
			}
		} catch (Exception e) {
			return new Response(false, "Có lỗi xảy ra khi cập nhật mật khẩu", 	null);
		}		
	
	}
	
	
	
}

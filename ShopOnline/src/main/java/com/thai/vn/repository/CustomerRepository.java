package com.thai.vn.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.thai.vn.model.Customer;

public interface CustomerRepository extends JpaRepository<Customer, Long> {
	
	Customer  findByEmailAndPassword(String email,String password);
}

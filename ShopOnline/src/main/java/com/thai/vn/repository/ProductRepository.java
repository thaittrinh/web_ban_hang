package com.thai.vn.repository;


import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.thai.vn.model.Product;


public interface ProductRepository extends JpaRepository<Product, Integer> {
	
	Page<Product> findByProductTypeId(int type, Pageable pageable); // == Page<Product> findByProductType(ProductType type, Pageable pageable);
	
	
}

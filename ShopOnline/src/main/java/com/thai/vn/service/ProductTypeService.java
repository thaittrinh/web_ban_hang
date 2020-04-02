package com.thai.vn.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thai.vn.model.ProductType;
import com.thai.vn.repository.ProductTypeRepository;
import com.thai.vn.service.ProductTypeService;

@Service
public class ProductTypeService  {

	@Autowired
	ProductTypeRepository productTypeRepository;


	public List<ProductType> findAll() {
		
		return productTypeRepository.findAll();
	}

	public void delete() {
		// TODO Auto-generated method stub
		
	}

	



	
}

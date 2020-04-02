package com.thai.vn.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.thai.vn.model.OrderDetail;
import com.thai.vn.model.OrderDetail.PK;

public interface OrderDetailRepository extends JpaRepository<OrderDetail, PK>{

}

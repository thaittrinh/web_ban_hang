package com.thai.vn.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.thai.vn.model.Order;

public interface OrderRepository extends JpaRepository<Order, Long> {

}

package com.thai.vn.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.thai.vn.model.User;

public interface UserRepository extends JpaRepository<User, Integer> {

}

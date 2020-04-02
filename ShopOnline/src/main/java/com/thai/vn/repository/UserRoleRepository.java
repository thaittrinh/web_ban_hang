package com.thai.vn.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.thai.vn.model.UserRoles;

public interface UserRoleRepository extends JpaRepository<UserRoles, Integer> {

}

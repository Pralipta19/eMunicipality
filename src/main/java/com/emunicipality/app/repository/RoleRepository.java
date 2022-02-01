package com.emunicipality.app.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.emunicipality.app.model.Role;

public interface RoleRepository extends JpaRepository<Role, Long> {

	@Query("FROM Role WHERE roleId=:roleId")     
	Role findRoleByRoleId(@Param("roleId")Long roleId);

	@Query("FROM Role WHERE deleted IS null")     
	List<Role> findAllActiveRole(); 
	
} 

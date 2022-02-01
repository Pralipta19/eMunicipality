package com.emunicipality.app.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.emunicipality.app.model.UserRole;

public interface UserRoleRepository extends JpaRepository<UserRole, Long>{

	@Query("FROM UserRole WHERE userId.userId=:userId")  
	UserRole getUserRoleByUserId(@Param("userId")Long userId);  
	
}
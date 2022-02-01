package com.emunicipality.app.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.emunicipality.app.model.User;

public interface UserRepository extends JpaRepository<User, Long> { 

	@Query("FROM User WHERE userName=:userName AND password=:password AND deleted=null") 
	User getUserForLogin(@Param("userName")String userName, @Param("password")String password);

	@Query("FROM User WHERE userId=:userId")    
	User findByUserId(@Param("userId")Long userId);

	@Query("FROM User WHERE userName=:userName") 
	User getUserByUserName(@Param("userName")String userName);

	@Query("FROM User WHERE userName=:userName AND mobileNo=:mobileNumber")  
	User getUserByUserNameAndMobileNumber(@Param("userName")String userName, @Param("mobileNumber")String mobileNumber);

	@Query("FROM User WHERE otp=:otp") 
	User matchOtp(@Param("otp")String otp); 
	
} 

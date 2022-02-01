package com.emunicipality.app.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.emunicipality.app.model.BirthCertificate;
import com.emunicipality.app.model.Role;

public interface BirthCertificateRepository extends JpaRepository <BirthCertificate, Long>{
 
	@Query("FROM BirthCertificate WHERE birthCertificateApplicationId=:appId")     
	BirthCertificate findBirthCertificateByAppId(@Param("appId")Long appId);
	
	@Query("FROM BirthCertificate WHERE userId.userId=:userId") 
	BirthCertificate findByUserId(@Param("userId")Long userId);
	
}

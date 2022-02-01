package com.emunicipality.app.service;

import java.util.List;
import java.util.Optional;

import com.emunicipality.app.model.BirthCertificate;
import com.emunicipality.app.model.DeathCertificate;
import com.emunicipality.app.model.User;
import com.emunicipality.app.model.UserRole;

public interface UserService {

	User getUserForLogin(String userName, String password);

	UserRole getUserRoleByUserId(Long userId);

	User changePassword(Long userId, String oldPassword, String newPassword);

	User editProfile(Long userId, String name, String mobileNumber, String emailId, String address);

	User getUserByUserNameAndMobileNumber(String userName, String mobileNumber);

	User saveOtpForForgotPassword(User existingUser, String otp);

	User getUserRoleById(Long userId);

	User matchOtp(String otp);

	User changePasswordForForgotCasePost(User existingUser, String password);    
	
	List<BirthCertificate> findAllBirthCertificates();
	List<DeathCertificate> findAllDeathCertificates();
	/* User saveBirthCertificate(String name);*/
	void findOneBirthCertificate(long appId);

	User saveBirthCertificate(String cName, String gender, String dOB, String birthPlace,
			String birthProof, String fName, String idProofFather, String mName, String idProofMother,
			String marriageCertificate, String mobileNumber, String emailId, String address, String dist, String state,
			String country, String pinCode, String signFather, String signMother, User user);

	//User saveDeathCertificate(String name);
	
	User saveDeathCertificate(String name, String fName, String gender, String
	 dOB, String deathDate, String deathCause, String deathPlace, String
	  deathProofFile, String address, String policeStation, String dist, String
	  state, String country, String pinCode,String aName, String idProofApplicant,
	 String relation, String mobileNumber, String aAddress, String aPoliceStation,
	 String aDist, String aState, String aCountry, String aPinCode, String
	  signApplicant);

	BirthCertificate getApplicationStatusByCurrentUser(User user);

	 
	 
	
	
}

package com.emunicipality.app.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.emunicipality.app.model.BirthCertificate;
import com.emunicipality.app.model.DeathCertificate;
import com.emunicipality.app.model.User;
import com.emunicipality.app.model.UserRole;
import com.emunicipality.app.repository.BirthCertificateRepository;
import com.emunicipality.app.repository.DeathCertificateRepository;
import com.emunicipality.app.repository.UserRepository;
import com.emunicipality.app.repository.UserRoleRepository;

@Service 
public class UserServiceImpl implements UserService {

	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private UserRoleRepository userRoleRepository;
	
	@Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder; 
	
	@Autowired
	private BirthCertificateRepository birthCertificateRepository;
	
	@Autowired
	private DeathCertificateRepository deathCertificateRepository;
	
	@Override
	public User getUserForLogin(String userName, String password) {		
		return userRepository.getUserForLogin(userName, password);   
	}

	@Override
	public UserRole getUserRoleByUserId(Long userId) { 
		return userRoleRepository.getUserRoleByUserId(userId); 
	}

	@Override
	public User changePassword(Long userId, String oldPassword, String newPassword) {
		
		User user = userRepository.getOne(userId); 
		User finalUser = null;
		if(bCryptPasswordEncoder.matches(oldPassword, user.getPassword())) {
			user.setPassword(bCryptPasswordEncoder.encode(newPassword)); 
			user.setUpdatedBy(user); 
			user.setUpdatedOn(new Date());  
			finalUser = userRepository.save(user); 
		}
		
		return finalUser;
	}

	@Override
	public User editProfile(Long userId, String name, String mobileNumber, String emailId, String address) {
		
		User finalUser = null;
		User user = userRepository.getOne(userId); 
		user.setName(name);
		user.setMobileNo(mobileNumber);
		user.setEmail(emailId);
		user.setAddress(address); 
		user.setUpdatedBy(user); 
		user.setUpdatedOn(new Date());  
		finalUser = userRepository.save(user); 
		
		return finalUser;
	}

	@Override
	public User getUserByUserNameAndMobileNumber(String userName, String mobileNumber) {
		return userRepository.getUserByUserNameAndMobileNumber(userName, mobileNumber);   
	}

	@Override
	public User saveOtpForForgotPassword(User existingUser, String otp) {
		existingUser.setOtp(otp); 
		return userRepository.save(existingUser); 
	}

	@Override
	public User getUserRoleById(Long userId) {
		return userRepository.getOne(userId); 
	}

	@Override
	public User matchOtp(String otp) {
		return userRepository.matchOtp(otp); 
	}

	@Override
	public User changePasswordForForgotCasePost(User existingUser, String password) {
		
		existingUser.setPassword(bCryptPasswordEncoder.encode(password)); 
		existingUser.setOtp(null); 
		User finalUser = userRepository.save(existingUser);  
		
		return finalUser; 
	}

	@Override
	public User saveBirthCertificate(String cname,String gender,String dOB,String birthPlace,String birthProofFile, String fName, String idProofFather, String mName, String idProofMother,
			String marriageCertificate, String mobileNumber, String emailId, String address, String dist, String state,
			String country, String pinCode, String signFather, String signMother, User user) {
		
		BirthCertificate birthCertificate =new BirthCertificate();
		birthCertificate.setChildName(cname);
		birthCertificate.setGender(gender);
		  birthCertificate.setDob(dOB);
		 birthCertificate.setBirthPlace(birthPlace);
		birthCertificate.setBirthProof(birthProofFile);
		 birthCertificate.setfName(fName);
		 birthCertificate.setIdProofFather(idProofFather);
		 birthCertificate.setmName(mName);
		 birthCertificate.setIdProofMother(idProofMother);
		 birthCertificate.setMarriageCertificate(marriageCertificate);
		 birthCertificate.setMobileNumber(mobileNumber);
		 birthCertificate.setEmailId(emailId);
		 birthCertificate.setAddress(address);
		 birthCertificate.setDist(dist);
		 birthCertificate.setState(state);
		 birthCertificate.setCountry(country);
		 birthCertificate.setPinCode(pinCode);
		 birthCertificate.setSignFather(signFather);
		 birthCertificate.setSignMother(signMother);
		 birthCertificate.setUserId(user);
		 birthCertificate.setSt("APPLIED");
		
		  
		/*
		 * System.out.println("the value is "+cname); System.out.println(" "+gender);
		 * System.out.println(" "+dOB); System.out.println(" "+birthPlace);
		 * System.out.println(" "+birthProofFile); System.out.println(" "+fName);
		 * System.out.println(" "+idProofFather); System.out.println(" "+mName);
		 * 
		 * System.out.println(" "+idProofMother);
		 * System.out.println(" "+marriageCertificate);
		 * System.out.println(" "+mobileNumber); System.out.println(" "+emailId);
		 * System.out.println(" "+address); System.out.println(" "+dist);
		 * System.out.println(" "+state); System.out.println(" "+country);
		 * System.out.println(" "+pinCode); System.out.println(" "+signFather);
		 * System.out.println(" "+signMother);
		 */
		
		  
		birthCertificateRepository.save(birthCertificate);
		
		 
		
		
		return null;
	}
	
	  @Override 
	  public User saveDeathCertificate(String name, String fName, String dOB,String gender , String deathDate, String
	 deathCause, String deathPlace, String deathProofFile, String address, String
	 policeStation, String dist, String state, String country, String pinCode,
	 String aName, String idProofApplicant, String relation, String mobileNumber,
	  String aAddress, String aPoliceStation, String aDist, String aState, String
	  aCountry, String aPinCode, String signApplicant)
	  {
	  
	  DeathCertificate deathCertificate =new DeathCertificate();
	  deathCertificate.setDeceasedName(name); 
		deathCertificate.setfName(fName); 
		  deathCertificate.setDob(dOB); 
		 deathCertificate.setGender(gender);
		 deathCertificate.setDeathDate(deathDate);
		 deathCertificate.setDeathCause(deathCause);
		 deathCertificate.setDeathPlace(deathPlace);
		 deathCertificate.setDeathProofFile(deathProofFile);
		  deathCertificate.setAddress(address);
		  deathCertificate.setPoliceStation(policeStation);
		  deathCertificate.setDist(dist);
		  deathCertificate.setState(state);
		  deathCertificate.setCountry(country); 
		  deathCertificate.setPinCode(pinCode);
		  deathCertificate.setaName(aName);
		 deathCertificate.setIdProofApplicant(idProofApplicant);
		 deathCertificate.setRelation(relation);
		 deathCertificate.setMobileNumber(mobileNumber);
		 deathCertificate.setaAddress(aAddress);
		 deathCertificate.setaPoliceStation(aPoliceStation);
		 deathCertificate.setaDist(aDist); 
		 deathCertificate.setaState(aState);
	 	 deathCertificate.setaCountry(aCountry);
		 deathCertificate.setaPinCode(aPinCode);
		 deathCertificate.setSignApplicant(signApplicant);
		 deathCertificate.setStatus("APPLIED");
		 
	  
	  
		/*
		 * System.out.println("the value is "+name); System.out.println(" "+fName);
		 * System.out.println(" "+dOB); System.out.println(" "+gender);
		 * System.out.println(" "+deathDate); System.out.println(" "+deathCause);
		 * System.out.println(" "+deathPlace); System.out.println(" "+deathProofFile);
		 * System.out.println(" "+address); System.out.println(" "+policeStation);
		 * System.out.println(" "+dist); System.out.println(" "+state);
		 * System.out.println(" "+country); System.out.println(" "+pinCode);
		 * System.out.println(" "+aName); System.out.println(" "+idProofApplicant);
		 * System.out.println(" "+relation); System.out.println(" "+mobileNumber);
		 * System.out.println(" "+aAddress); System.out.println(" "+aPoliceStation);
		 * System.out.println(" "+aDist); System.out.println(" "+aState);
		 * System.out.println(" "+aCountry); System.out.println(" "+aPinCode);
		 * System.out.println(" "+signApplicant);
		 */
	  
	  deathCertificateRepository.save(deathCertificate);
	  

	  
	  
	  return null; 
	}

	@Override
	public List<BirthCertificate> findAllBirthCertificates() {
		
		List<BirthCertificate> b=new ArrayList<BirthCertificate>();
		
		b= birthCertificateRepository.findAll();
		return b;
	}

	@Override
	public void findOneBirthCertificate(long appId) {
		BirthCertificate b=birthCertificateRepository.findBirthCertificateByAppId(appId);
		b.setSt("APPROVED");
		birthCertificateRepository.save(b);
		
	}
	@Override
	public List<DeathCertificate> findAllDeathCertificates() {
		
		List<DeathCertificate> b=new ArrayList<DeathCertificate>();
		
		b= deathCertificateRepository.findAll();
		return b;
	}

	@Override
	public BirthCertificate getApplicationStatusByCurrentUser(User user) {
		Long userId=user.getUserId();
		 BirthCertificate b=birthCertificateRepository.findByUserId(userId);
		 System.out.println(b.getSt());
		 return b;
	}
	 	
	
}
	
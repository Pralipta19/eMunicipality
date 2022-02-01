package com.emunicipality.app.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="birth_certificate", schema = "public")
public class BirthCertificate implements Serializable {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="application_id")
	private long birthCertificateApplicationId;
	
	
	@ManyToOne
	@JoinColumn(name="user_id")
	private User userId;
	
	
	
	
	
	@Column(name="child_name")
	private String childName;
	
	@Column(name="gender")
	private String gender;
	
	@Column(name="dob")
	private String dob;
	
	@Column(name="birth_place")
	private String birthPlace;
	
	@Column(name="birth_proof")
	private String birthProof;
	
	@Column(name="father_name")
	private String fName;
	
	@Column(name="id_proof_father")
	private String idProofFather;
	
	@Column(name="mother_name")
	private String mName;
	
	@Column(name="id_proof_mother")
	private String idProofMother;

	@Column(name="marriage_certificate")
	private String marriageCertificate;
	
	@Column(name="mobile_no")
	private String mobileNumber;
	
	@Column(name="email")
	private String emailId;
	
	@Column(name="address")
	private String address;
	
	@Column(name="dist")
	private String dist;
	
	@Column(name="state")
	private String state;
	
	@Column(name="country")
	private String country;
	
	@Column(name="pin_code")
	private String pinCode;
	
	@Column(name="father_sign")
	private String signFather;
	
	@Column(name="mother_sign")
	private String signMother;
	
	
	  @Column(name="st") 
	  private String st;
	 

	public long getBirthCertificateApplicationId() {
		return birthCertificateApplicationId;
	}

	public void setBirthCertificateApplicationId(long birthCertificateApplicationId) {
		this.birthCertificateApplicationId = birthCertificateApplicationId;
	}

	public String getChildName() {
		return childName;
	}

	public void setChildName(String childName) {
		this.childName = childName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getBirthPlace() {
		return birthPlace;
	}

	public void setBirthPlace(String birthPlace) {
		this.birthPlace = birthPlace;
	}

	public String getBirthProof() {
		return birthProof;
	}

	public void setBirthProof(String birthProof) {
		this.birthProof = birthProof;
	}

	public String getfName() {
		return fName;
	}

	public void setfName(String fName) {
		this.fName = fName;
	}

	public String getIdProofFather() {
		return idProofFather;
	}

	public void setIdProofFather(String idProofFather) {
		this.idProofFather = idProofFather;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getIdProofMother() {
		return idProofMother;
	}

	public void setIdProofMother(String idProofMother) {
		this.idProofMother = idProofMother;
	}

	public String getMarriageCertificate() {
		return marriageCertificate;
	}

	public void setMarriageCertificate(String marriageCertificate) {
		this.marriageCertificate = marriageCertificate;
	}

	public String getMobileNumber() {
		return mobileNumber;
	}

	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDist() {
		return dist;
	}

	public void setDist(String dist) {
		this.dist = dist;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getPinCode() {
		return pinCode;
	}

	public void setPinCode(String pinCode) {
		this.pinCode = pinCode;
	}

	public String getSignFather() {
		return signFather;
	}

	public void setSignFather(String signFather) {
		this.signFather = signFather;
	}

	public String getSignMother() {
		return signMother;
	}

	public void setSignMother(String signMother) {
		this.signMother = signMother;
	}

	
	  public String getSt() 
	  { return st; }
	  
	  public void setSt(String st) 
	  { this.st = st; }

	public User getUserId() {
		return userId;
	}

	public void setUserId(User userId) {
		this.userId = userId;
	}
	 
	

}

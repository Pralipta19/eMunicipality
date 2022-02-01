package com.emunicipality.app.model;

/*
 * public class DeathCertificate {
 * 
 * }
 */
import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="death_certificate", schema = "public")
public class DeathCertificate implements Serializable {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="application_id")
	private long deathCertificateApplicationId;

	@Column(name="deceased_name")
	private String deceasedName;
	
	
	
	  @Column(name="father_husband_name")
	  private String fName;
	  
	  @Column(name="dob") 
	  private String dob;
	  
	  @Column(name="gender") 
	  private String gender;
	  
	  @Column(name="dod")
	  private String deathDate;
	  
	  @Column(name="cause")
	  private String deathCause;
	  
	  @Column(name="place_of_death")
	  private String deathPlace;
	  
	  @Column(name="death_proof")
	  private String deathProofFile;
	  
	  @Column(name="address")
	  private String address;
	  
	  @Column(name="police_station")
	  private String policeStation;
	  
	  @Column(name="dist")
	  private String dist;
	  
	  @Column(name="state")
	  private String state;
	  
	  @Column(name="country")
	  private String country;
	  
	  @Column(name="pin")
	  private String pinCode;
	  
	
	  @Column(name="applicant_name")
	  private String aName;
	  
	  @Column(name="id_proof")
	  private String idProofApplicant;
	  
	  @Column(name="relation")
	  private String relation;
	  
	  @Column(name="mobile")
	  private String mobileNumber;
	  
	  @Column(name="address_of_applicant")
	  private String aAddress;
	  
	  @Column(name="police_station_of_applicant")
	  private String aPoliceStation;
	  
	  @Column(name="dist_of_applicant")
	  private String aDist;
	  
	  @Column(name="state_of_applicant")
	  private String aState;
	  
	  @Column(name="country_of_applicant")
	  private String aCountry;
	  
	  @Column(name="pin_of_applicant")
	  private String aPinCode;
	  
	  @Column(name="applicant_sign")
	  private String signApplicant;
	  
	  @Column(name="status") 
	  private String status;
	  
	 
	  public long getDeathCertificateApplicationId() { return
	  deathCertificateApplicationId; }
	  
	  public void setDeathCertificateApplicationId(long
	  deathCertificateApplicationId) { this.deathCertificateApplicationId =
	  deathCertificateApplicationId; }
	  
	  public String getDeceasedName() { return deceasedName; }
	  
	  public void setDeceasedName(String deceasedName) { this.deceasedName =
	  deceasedName; }
	  
	  
	  public String getfName() { return fName; }
	  
	  public void setfName(String fName) { this.fName = fName; }
	  
	  public String getDob() { return dob; }
	  
	  public void setDob(String dob) { this.dob = dob; }
	  
	  public String getGender() { return gender; }
	  
	  public void setGender(String gender) { this.gender = gender; }
	  
	  public String getDeathDate() { return deathDate; }
	  
	  public void setDeathDate(String deathDate) { this.deathDate = deathDate; }
	  
	  public String getDeathCause() { return deathCause; }
	  
	  public void setDeathCause(String deathCause) { this.deathCause = deathCause;
	  }
	  
	  public String getDeathPlace() { return deathPlace; }
	  
	  public void setDeathPlace(String deathPlace) { this.deathPlace = deathPlace;
	  }
	  
	  public String getDeathProofFile() { return deathProofFile; }
	  
	  public void setDeathProofFile(String deathProofFile) { this.deathProofFile =
	  deathProofFile; }
	  
	  public String getAddress() { return address; }
	  
	  public void setAddress(String address) { this.address = address; }
	  
	  public String getPoliceStation() { return policeStation; }
	  
	  public void setPoliceStation(String policeStation) { this.policeStation =
	  policeStation; }
	  
	  public String getDist() { return dist; }
	  
	  public void setDist(String dist) { this.dist = dist; }
	  
	  public String getState() { return state; }
	  
	  public void setState(String state) { this.state = state; }
	  
	  public String getCountry() { return country; }
	  
	  public void setCountry(String country) { this.country = country; }
	  
	  public String getPinCode() { return pinCode; }
	  
	  public void setPinCode(String pinCode) { this.pinCode = pinCode; }
	 
	  
	
	  public String getaName() { return aName; }
	  
	  public void setaName(String aName) { this.aName = aName; }
	  
	  public String getIdProofApplicant() { return idProofApplicant; }
	  
	  public void setIdProofApplicant(String idProofApplicant) {
	  this.idProofApplicant = idProofApplicant; }
	  
	  public String getRelation() { return relation; }
	  
	  public void setRelation(String relation) { this.relation = relation; }
	  
	  public String getMobileNumber() { return mobileNumber; }
	  
	  public void setMobileNumber(String mobileNumber) { this.mobileNumber =
	  mobileNumber; }
	  
	  public String getaAddress() { return aAddress; }
	  
	  public void setaAddress(String aAddress) { this.aAddress = aAddress; }
	  
	  public String getaPoliceStation() { return aPoliceStation; }
	  
	  public void setaPoliceStation(String aPoliceStation) { this.aPoliceStation =
	  aPoliceStation; }
	  
	  public String getaDist() { return aDist; }
	  
	  public void setaDist(String aDist) { this.aDist = aDist; }
	  
	  public String getaState() { return aState; }
	  
	  public void setaState(String aState) { this.aState = aState; }
	  
	  public String getaCountry() { return aCountry; }
	  
	  public void setaCountry(String aCountry) { this.aCountry = aCountry; }
	  
	  public String getaPinCode() { return aPinCode; }
	  
	  public void setaPinCode(String aPinCode) { this.aPinCode = aPinCode; }
	  
	  public String getSignApplicant() { return signApplicant; }
	  
	  public void setSignApplicant(String signApplicant) { this.signApplicant =
	  signApplicant; }

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	 
	 
	
	
}

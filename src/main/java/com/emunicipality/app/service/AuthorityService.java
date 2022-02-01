package com.emunicipality.app.service;

import java.util.List;

import com.emunicipality.app.model.BirthCertificate;
import com.emunicipality.app.model.DeathCertificate;

public interface AuthorityService {
	
	
	List<BirthCertificate> findAllBirthCertificates();
	List<DeathCertificate> findAllDeathCertificates();

}

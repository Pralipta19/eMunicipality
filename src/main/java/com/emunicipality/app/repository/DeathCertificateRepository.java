package com.emunicipality.app.repository;

//public class deathCertificateRepository {
//
//}
import org.springframework.data.jpa.repository.JpaRepository;

import com.emunicipality.app.model.DeathCertificate;

public interface DeathCertificateRepository extends JpaRepository <DeathCertificate, Long>{
 
}

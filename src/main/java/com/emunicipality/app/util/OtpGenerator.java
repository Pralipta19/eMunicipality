package com.emunicipality.app.util;

import java.security.SecureRandom;

public class OtpGenerator {

	public static String otpGenertor()
	{
		 SecureRandom random= new SecureRandom();
		 int num=random.nextInt(100000);
		 String formatted=String.format("%06d", num);
		 return formatted; 
	 } 
	
}

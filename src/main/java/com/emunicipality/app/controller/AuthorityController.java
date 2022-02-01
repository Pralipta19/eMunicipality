package com.emunicipality.app.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.emunicipality.app.model.BirthCertificate;
import com.emunicipality.app.model.DeathCertificate;
import com.emunicipality.app.service.UserService;

@Controller
public class AuthorityController {
	@Autowired
	private UserService userService;
	private List<BirthCertificate> birthCertificateList;
	private List<DeathCertificate> deathCertificateList;
	
	
	@RequestMapping(value = "/approveBirthCertificate.htm", method = RequestMethod.GET)
	public String getAllBirthCertificate(ModelMap model, HttpServletRequest request, HttpServletResponse response, String error,
			String logout, RedirectAttributes message) {
		
		birthCertificateList = userService.findAllBirthCertificates();
		
		model.addAttribute("birthCertificateLIst", birthCertificateList);
		return "site.approveBrithCertificate";
	}
	@RequestMapping(value = "/approveUserBirthCertificate.htm", method = RequestMethod.GET)
	public String approveUserBirthCertificate(ModelMap model, HttpServletRequest request, HttpServletResponse response, String error,
			String logout, RedirectAttributes message,@RequestParam(value = "applicationid") Long appId) {
		
		userService.findOneBirthCertificate(appId);
		
		return "redirect:/approveBirthCertificate.htm";
	}
	
	  @RequestMapping(value = "/site.approveDeathCertificate", method =RequestMethod.GET)
	  public String getAllDeathCertificate(ModelMap model,
	  HttpServletRequest request, HttpServletResponse response, String error,
	  String logout, RedirectAttributes message) {
	  
	  deathCertificateList = userService.findAllDeathCertificates();
	  model.addAttribute("deathCertificateLIst", deathCertificateList);
	  return"site.approveDeathCertificate"; }
	 

}

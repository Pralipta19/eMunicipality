package com.emunicipality.app.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.emunicipality.app.model.Role;
import com.emunicipality.app.model.User;
import com.emunicipality.app.model.UserRole;
import com.emunicipality.app.service.AdminService;
import com.emunicipality.app.service.UserService;
import com.emunicipality.app.util.SecurityHelper;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/createRole.htm") 
	public String createRole(HttpServletRequest request, Model model) {	
		
		User user = SecurityHelper.getCurrentUser(); 
		UserRole userRole = userService.getUserRoleByUserId(user.getUserId());  
		model.addAttribute("userName", user.getName());  
		model.addAttribute("roleName", userRole.getRoleId().getRoleType()); 
		return "site.createRole";   
		
	} 
	
	@PostMapping("/addRole.htm") 
	public String addRole(HttpServletRequest request, RedirectAttributes message, 
			@RequestParam("roleName")String roleName, @RequestParam("remark")String remark,
			@RequestParam("roleId")Long roleId) {	
		
		User user = SecurityHelper.getCurrentUser(); 
		Long userId = user.getUserId(); 
		
		if(roleId != null) {
			Role role = adminService.editRole(roleName, remark, roleId, userId);  
			if(role != null) {
				message.addFlashAttribute("successMessage", "Role Updated Successfully."); 
			}
			else {
				message.addFlashAttribute("failureMessage", "Unable To Update Role."); 
			}
		}
		else {
			Role role = adminService.addRole(roleName, remark, userId);  
			if(role != null) {
				message.addFlashAttribute("successMessage", "Role Saved Successfully."); 
			}
			else {
				message.addFlashAttribute("failureMessage", "Unable To Save Role."); 
			} 
		} 
		
		return "redirect:/createRole.htm";    
		
	} 
	
	@GetMapping("/manageRole.htm") 
	public String manageRole(HttpServletRequest request, Model model) {	
		
		List<Role> roleList = adminService.findAllRole(); 
		model.addAttribute("roleList", roleList); 	
		User user = SecurityHelper.getCurrentUser(); 
		UserRole userRole = userService.getUserRoleByUserId(user.getUserId());  
		model.addAttribute("userName", user.getName());  
		model.addAttribute("roleName", userRole.getRoleId().getRoleType()); 	
		return "site.manageRole";   
		
	} 
	
	@GetMapping("/editRole.htm") 
	public String editRole(HttpServletRequest request, Model model, @RequestParam("roleIdForEdit")Long roleIdForEdit) {	
		
		User user = SecurityHelper.getCurrentUser(); 
		UserRole userRole = userService.getUserRoleByUserId(user.getUserId());  
		model.addAttribute("userName", user.getName());  
		model.addAttribute("roleName", userRole.getRoleId().getRoleType()); 
		Role role = adminService.getRoleById(roleIdForEdit); 
		model.addAttribute("role", role);  
		return "site.createRole";   
		
	}  
	
	@GetMapping("/deleteRole.htm") 
	public String deleteRole(HttpServletRequest request, Model model, @RequestParam("roleIdForDelete")Long roleIdForDelete) {	
		
		Role role = adminService.getRoleById(roleIdForDelete); 
		adminService.deleteRole(role);   
		
		return "redirect:/manageRole.htm";     
	}
	
	@GetMapping("/createUser.htm") 
	public String createUser(HttpServletRequest request, Model model) {	
		
		User user = SecurityHelper.getCurrentUser(); 
		UserRole userRole = userService.getUserRoleByUserId(user.getUserId());  
		model.addAttribute("userName", user.getName());  
		model.addAttribute("roleName", userRole.getRoleId().getRoleType()); 
		List<Role> roleList = adminService.findAllActiveRole(); 
		model.addAttribute("roleList", roleList); 
		return "site.createUser";   
		
	} 
	
	@RequestMapping(value = "/validate-user-name.htm", method = RequestMethod.GET)
	@ResponseBody 
	public String  validateUserName(@RequestParam("userName") String userName, ModelMap model) throws JSONException
	{	
		
		JSONArray jarr = new JSONArray();
		JSONObject jobj = new JSONObject();
		User user = adminService.getUserByUserName(userName);  
		if(user != null) {
			jobj.put("duplicateUserName", "User Having This Name Is Already Exist"); 
		}
		jarr.put(jobj);
		return jarr.toString();
		
	}   
	
	@PostMapping("/addUser.htm") 
	public String addUser(HttpServletRequest request, Model model,
			@RequestParam("name") String name, @RequestParam("userName") String userName,
			@RequestParam("password") String password, @RequestParam("mobileNumber") String mobileNumber,
			@RequestParam("emailId") String emailId, @RequestParam("roleId") Long roleId,
			@RequestParam("remark") String remark, @RequestParam("address") String address, RedirectAttributes message) {	
		
		User loggedinUser = SecurityHelper.getCurrentUser(); 
		Long userId = loggedinUser.getUserId();  
		User user = adminService.addUser(name, userName, password, mobileNumber, emailId, roleId, remark, userId, address);   
		if(user != null) {
			message.addFlashAttribute("successMessage", "User Saved Successfully."); 
		}
		else {
			message.addFlashAttribute("failureMessage", "Unable To Save User."); 
		}

		return "redirect:/createUser.htm";
	}
	
	@GetMapping("/manageUser.htm")  
	public String manageUser(HttpServletRequest request, Model model) {	
		 		
		List<User> userList = adminService.findAllUser();  
		model.addAttribute("userList", userList); 
		User user = SecurityHelper.getCurrentUser(); 
		UserRole userRole = userService.getUserRoleByUserId(user.getUserId());  
		model.addAttribute("userName", user.getName());  
		model.addAttribute("roleName", userRole.getRoleId().getRoleType()); 	
		return "site.manageUser";   
		
	}  
	
	@GetMapping("/enableUser.htm") 
	public String enableUser(HttpServletRequest request, Model model, @RequestParam("userIdForEnableUser")Long userIdForEnableUser) {	
		
		User user = adminService.getUserById(userIdForEnableUser);  
		adminService.enableUser(user);     
		
		return "redirect:/manageUser.htm";     
	} 
	
	@GetMapping("/disableUser.htm") 
	public String disableUser(HttpServletRequest request, Model model, @RequestParam("userIdForDisableUser")Long userIdForDisableUser) {	
		
		User user = adminService.getUserById(userIdForDisableUser);  
		adminService.disableUser(user);     
		
		return "redirect:/manageUser.htm";     
	} 
	
}

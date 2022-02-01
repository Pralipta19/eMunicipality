package com.emunicipality.app.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.emunicipality.app.model.Role;
import com.emunicipality.app.model.User;
import com.emunicipality.app.model.UserRole;
import com.emunicipality.app.repository.RoleRepository;
import com.emunicipality.app.repository.UserRepository;
import com.emunicipality.app.repository.UserRoleRepository;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private RoleRepository roleRepository;
	
	@Autowired
	private UserRoleRepository userRoleRepository;
	
	@Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder; 
	
	@Override
	public Role editRole(String roleName, String remark, Long roleId, Long userId) {
		Role role = roleRepository.findRoleByRoleId(roleId); 
		role.setRoleType(roleName);
		role.setRemark(remark);
		role.setCreatedOn(role.getCreatedOn());  
		role.setCreatedBy(role.getCreatedBy());  
		role.setUpdatedOn(new Date());  
		role.setUpdatedBy(userRepository.findByUserId(userId)); 
		return roleRepository.save(role); 
	}

	@Override
	public Role addRole(String roleName, String remark, Long userId) {
		Role role = new Role();
		role.setRoleType(roleName);
		role.setRemark(remark);
		role.setCreatedOn(new Date()); 
		role.setCreatedBy(userRepository.findByUserId(userId)); 
		return roleRepository.save(role); 
	}

	@Override
	public List<Role> findAllRole() {
		return roleRepository.findAll(); 
	}

	@Override
	public Role getRoleById(Long roleIdForEdit) {
		return roleRepository.findById(roleIdForEdit).get();  
	}

	@Override
	public void deleteRole(Role role) {
		role.setDeleted("DELETED");  
		roleRepository.save(role); 
	}

	@Override
	public User getUserByUserName(String userName) {
		return userRepository.getUserByUserName(userName);   
	}

	@Override
	public List<Role> findAllActiveRole() {
		return roleRepository.findAllActiveRole(); 
	}

	@Override
	public User addUser(String name, String userName, String password, String mobileNumber, String emailId, Long roleId, String remark, Long userId, String address) {
		
		User user = new User();
		user.setName(name);
		user.setUserName(userName);
		user.setPassword(bCryptPasswordEncoder.encode(password));  
		user.setMobileNo(mobileNumber);
		user.setEmail(emailId);
		user.setAddress(address); 
		user.setRemark(remark);   
		user.setCreatedOn(new Date()); 
		user.setCreatedBy(userRepository.findByUserId(userId)); 
		User finalUser = userRepository.save(user); 
		
		UserRole userRole = new UserRole(); 
		userRole.setUserId(finalUser); 
		userRole.setRoleId(roleRepository.findRoleByRoleId(roleId));   
		userRoleRepository.save(userRole); 
		
		return finalUser; 
	}

	@Override
	public List<User> findAllUser() {
		return userRepository.findAll();  
	}

	@Override
	public User getUserById(Long userIdForEnableUser) {
		return userRepository.getOne(userIdForEnableUser); 
	}

	@Override
	public void enableUser(User user) {
		user.setDeleted("(NULL)");  
		userRepository.save(user);  
	}

	@Override
	public void disableUser(User user) {
		user.setDeleted("DELETED");  
		userRepository.save(user);  
	} 
	
} 
	
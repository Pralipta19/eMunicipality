package com.emunicipality.app.service;

import java.util.List;

import com.emunicipality.app.model.Role;
import com.emunicipality.app.model.User;

public interface AdminService {

	Role editRole(String roleName, String remark, Long roleId, Long userId);

	Role addRole(String roleName, String remark, Long userId);

	List<Role> findAllRole();

	Role getRoleById(Long roleIdForEdit);

	void deleteRole(Role role);

	User getUserByUserName(String userName);

	List<Role> findAllActiveRole();

	User addUser(String name, String userName, String password, String mobileNumber, String emailId, Long roleId, String remark, Long userId, String address);

	List<User> findAllUser();

	User getUserById(Long userIdForEnableUser);

	void enableUser(User user);

	void disableUser(User user);            
   
} 

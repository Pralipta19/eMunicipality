package com.emunicipality.app.service;

import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.emunicipality.app.model.LoggedInUser;
import com.emunicipality.app.model.User;
import com.emunicipality.app.model.UserRole;
import com.emunicipality.app.repository.UserRepository;
import com.emunicipality.app.repository.UserRoleRepository;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {

	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private UserRoleRepository userRoleRepository;

	public UserDetails loadUserByUsername(String userId) throws UsernameNotFoundException {

		User user = userRepository.getUserByUserName(userId); 

		Set<GrantedAuthority> grantedAuthorities = new HashSet<>();
		UserRole userRole = userRoleRepository.getUserRoleByUserId(user.getUserId()); 
		String roleType = userRole.getRoleId().getRoleType(); 
		grantedAuthorities.add(new SimpleGrantedAuthority(roleType)); 
		boolean mybool = (user.getDeleted() == null); 

		LoggedInUser liu = new LoggedInUser(user.getUserName(), user.getPassword(), mybool, mybool, mybool, mybool,
				grantedAuthorities, user);

		return liu;

	}

}

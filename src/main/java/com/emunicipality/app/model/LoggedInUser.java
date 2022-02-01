package com.emunicipality.app.model;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;

public class LoggedInUser extends org.springframework.security.core.userdetails.User {

	private static final long serialVersionUID = 7767108758059803455L;
	
	private User dbUser;

	public LoggedInUser(String username, String password, boolean enabled, boolean accountNonExpired,
			boolean credentialsNonExpired, boolean accountNonLocked, Collection<? extends GrantedAuthority> authorities,
			User dbUser) {
		super(username, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);

		this.dbUser = dbUser;

	}

	public User getDbUser() {
		return dbUser;
	}

	public void setDbUser(User dbUser) {
		this.dbUser = dbUser;
	}

}

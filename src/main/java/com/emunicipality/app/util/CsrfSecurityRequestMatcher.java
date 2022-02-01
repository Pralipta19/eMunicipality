package com.emunicipality.app.util;

import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
/*import org.springframework.security.web.util.matcher.RegexRequestMatcher;*/
import org.springframework.security.web.util.matcher.RequestMatcher;

public class CsrfSecurityRequestMatcher implements RequestMatcher {

	private Pattern allowedMethods = Pattern.compile("^(GET|HEAD|TRACE|OPTIONS)$");

	// Disable CSFR protection on the following urls:
	private AntPathRequestMatcher[] requestMatchers = { new AntPathRequestMatcher("/rest/**") };

	@Override
	public boolean matches(HttpServletRequest request) {
		if (allowedMethods.matcher(request.getMethod()).matches()) {
			return false;
		}

		// return !unprotectedMatcher.matches(request);

		for (AntPathRequestMatcher rm : requestMatchers) {
			if (rm.matches(request)) {
				return false;
			}
		}

		return true;
	}

}
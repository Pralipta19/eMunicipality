package com.emunicipality.app;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.boot.autoconfigure.web.servlet.error.ErrorViewResolver;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
@Component
public class MyErrorViewResolver implements ErrorViewResolver {

	@Override
	public ModelAndView resolveErrorView(HttpServletRequest request, HttpStatus status, Map<String, Object> model) {

		ModelAndView modelAndView = null;

		/*if (HttpStatus.NOT_FOUND.value() == 404) {
			modelAndView = new ModelAndView("site.404");
		} else if (HttpStatus.BAD_REQUEST.value() == 400) {
			modelAndView = new ModelAndView("site.400");
		} else if (HttpStatus.METHOD_NOT_ALLOWED.value() == 405) {
			modelAndView = new ModelAndView("site.405");
		} else if (HttpStatus.INTERNAL_SERVER_ERROR.value() == 500) {
			modelAndView = new ModelAndView("site.500");
		} else if (HttpStatus.SERVICE_UNAVAILABLE.value() == 503) {
			modelAndView = new ModelAndView("site.503");
		}*/
		if (HttpStatus.NOT_FOUND.value() == 404) {
			modelAndView = new ModelAndView("errors/404");
		} else if (HttpStatus.BAD_REQUEST.value() == 400) {
			modelAndView = new ModelAndView("errors/400");
		} else if (HttpStatus.METHOD_NOT_ALLOWED.value() == 405) {
			modelAndView = new ModelAndView("errors/405");
		} else if (HttpStatus.INTERNAL_SERVER_ERROR.value() == 500) {
			modelAndView = new ModelAndView("errors/500");
		} else if (HttpStatus.SERVICE_UNAVAILABLE.value() == 503) {
			modelAndView = new ModelAndView("errors/503");
		} 

		return modelAndView;
	}

} 

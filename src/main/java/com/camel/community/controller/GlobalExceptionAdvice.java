package com.camel.community.controller;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.log4j.Log4j;

@Log4j
@ControllerAdvice
public class GlobalExceptionAdvice {

	
	@ExceptionHandler(Exception.class)
	public ModelAndView globalEx(Exception ex) {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/error_page");
		modelAndView.addObject("ex",ex);
		
		log.info(ex.toString());
		
		return modelAndView;
	}
}

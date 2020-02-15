package com.camel.community.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class CommonController {
	
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {
		
		log.info("access Denied : " + auth);
		
		model.addAttribute("msg", "권한이 없습니다.");
		
	}
	
	@GetMapping("loginform")
	public void loginpage(String error, String logout, Model model, HttpServletRequest req) {
		
		String uri = req.getHeader("referer");
		
		req.setAttribute("loginRedirect", uri);
		log.info("uri :" + uri);

		log.info("error: " + error);
		log.info("logout : " + logout);
		
		if(error != null) {
			model.addAttribute("error", "가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.");
		}
		
		if(logout != null) {
			model.addAttribute("logout", "로그아웃");
		}
	}
	
	@PostMapping("/loginform")
	public String loginPost() throws Exception {
		
		log.info("customLogin loginfail!!");
		
		return "/loginform";
	}
	
}

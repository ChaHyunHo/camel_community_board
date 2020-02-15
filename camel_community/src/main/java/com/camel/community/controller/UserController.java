package com.camel.community.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.camel.community.domain.UserVO;
import com.camel.community.service.UserService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/user/*")
@Log4j
public class UserController {
		
	@Autowired
	private UserService userService;
	
	@GetMapping("/register")
	public String registerGET(Principal pinfo) throws Exception {
		
		if(pinfo != null) {
			return "redirect:/";
		}
		
		log.info("register form");
		return "user/register";
	}
	
	// 회원 가입
	@PostMapping("/register")
	public String registerPOST(UserVO vo) throws Exception {
		
		log.info("register form");
		
		try {
			userService.create(vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/loginform";
	}
	
	// 이메일 인증
	@GetMapping("/emailcheck")
	public String emailCheck(UserVO userVO, Model model) throws Exception {
		
		try {
			userService.emailCheck(userVO);
			model.addAttribute("result","success");
			
		}catch (Exception e) {
			log.info("emailcheck error");
			model.addAttribute("result", "error");
			e.printStackTrace();
		}
		
		return "/emailcheck";
	}
	
	// 아이디 중복 체크
	@ResponseBody
	@PostMapping("/idCheck")
	public int userIdCheck(@RequestBody UserVO vo) throws Exception {
		int duplCount = 0;
		
		duplCount = userService.userIdDuplCheck(vo.getUserId());
		
		return duplCount;
	}
	
	// email 중복 체크
	@ResponseBody
	@PostMapping("/emailCheck")
	public int emailCheck(@RequestBody UserVO vo) throws Exception {
		int duplCount = 0;
		
		duplCount = userService.emailDuplCheck(vo.getEmail());
		
		return duplCount;
	}
	
	// nickname 중복 체크
		@ResponseBody
		@PostMapping("/nicknameCheck")
		public int nicknameCheck(@RequestBody UserVO vo) throws Exception {
			int duplCount = 0;
			
			duplCount = userService.nicknameDuplCheck(vo.getUserNickname());
			
			return duplCount;
		}
}

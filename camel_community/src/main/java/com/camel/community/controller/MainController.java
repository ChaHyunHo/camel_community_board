package com.camel.community.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.camel.community.domain.UserVO;
import com.camel.community.service.BoardService;
import com.camel.community.service.UserService;

@Controller
@RequestMapping("/")
public class MainController {
	
	@Autowired 
	private BoardService boardService;
	
	@Autowired
	private UserService userService;
	
	@GetMapping
	public String index(Model model, Principal pinfo) throws Exception {
		
		String userName = "";
		
		if(pinfo != null ) {
			userName = pinfo.getName();
		UserVO userInfo = userService.read(userName);
		
		model.addAttribute("userInfo",userInfo);
		} 
		
		/* 메인 화면에 게시글 리스트 화면 내려주기 */
		
		for(int i =1; i < 7; i++) {
			Integer boardCode = i;
			model.addAttribute("boardCode"+i,boardService.detailList(boardCode));
		}
		
		return "index";
	}
}

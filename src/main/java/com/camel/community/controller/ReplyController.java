package com.camel.community.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.camel.community.domain.PageDTO;
import com.camel.community.domain.ReplyLikeVO;
import com.camel.community.domain.ReplyVO;
import com.camel.community.domain.Standard;
import com.camel.community.service.ReplyService;

import lombok.extern.log4j.Log4j;

@Log4j
@RestController
@RequestMapping("/replies")
public class ReplyController {
	
	@Autowired
	private ReplyService replyService;
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping
	public ResponseEntity<String> create(@RequestBody ReplyVO vo) {
		ResponseEntity<String> http = null;
		try {
			replyService.create(vo);
			http = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			
		} catch(Exception e) {
			e.printStackTrace();
			http = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		
		return http;
	}
	
	@GetMapping("/list/{boardNumber}/{page}") 
	public ResponseEntity<Map<String, Object>> replyList( @PathVariable("boardNumber") Integer boardNumber,
			@PathVariable("page") Integer page, Principal pinfo) {
		
	    	ResponseEntity<Map<String, Object>> http = null;
	    	
	    	String loginUserName = "";
	    	
	    	if(pinfo != null) {
	    		loginUserName = pinfo.getName();
	    	}
		
	    	try {
			
			if(page == -1) {
				
				page = 1;
			}
			
			Map<String, Object> map = new HashMap<>();
			
			Standard std = new Standard(page, 30);
			
			int replyTotalCount = replyService.replyTotalCount(boardNumber);
			
			PageDTO pageDTO = new PageDTO(std, replyTotalCount);
			
			List<ReplyVO> replyList = replyService.readAll(boardNumber,std);
			
			map.put("pageDTO", pageDTO);
			map.put("replyList", replyList);
			map.put("username", loginUserName);
			
			http = new ResponseEntity<>(map,HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			http = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return http;
	}
	
	@GetMapping("{replyNumber}")
	public ResponseEntity<ReplyVO> read(@PathVariable("replyNumber") Integer replyNumber) throws Exception {
		
		ResponseEntity<ReplyVO> http = null;
		
		try {
			
			http = new ResponseEntity<ReplyVO>(replyService.read(replyNumber), HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			http = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return http;
	}
	
	@PreAuthorize("principal.username == #vo.replyWriter")
	@PutMapping("/{replyNumber}")
	public ResponseEntity<String> modify(@RequestBody ReplyVO vo, 
			@PathVariable("replyNumber") Integer replyNumber) throws Exception {
		
		return replyService.update(vo) == 1 ? 
				new ResponseEntity<>("SUCCESS",HttpStatus.OK): 
				new ResponseEntity<>("FAIL",HttpStatus.BAD_REQUEST);
	}
	
	@PreAuthorize("principal.username == #vo.replyWriter")
	@DeleteMapping("/{replyNumber}")
	public ResponseEntity<String> delete(@RequestBody ReplyVO vo,@PathVariable("replyNumber") Integer replyNumber,
			HttpServletResponse response) throws Exception {
		

		ResponseEntity<String> http = null;
		
		if(replyService.childrentCheck(replyNumber) >= 1) {
			
			http = new ResponseEntity<>(HttpStatus.BAD_REQUEST);

		} else {
			
			try {
				replyService.delete(replyNumber);
				http = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);	
			}catch (Exception e) {
				e.printStackTrace();
				http = new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
			}
		}
		
		return http;
					
	}
	
	@PostMapping("/like")
	@PreAuthorize("isAuthenticated()")
	public int like(@RequestBody ReplyLikeVO vo) throws Exception {
		String username = SecurityContextHolder.getContext().getAuthentication().getName().toString();
		
		vo.setUserId(username);
		
		int result =  replyService.replyLikeService(vo);
		
		log.info(result);
		
		return result;
	}
}

package com.camel.community.controller;

import java.util.Arrays;

import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.extern.log4j.Log4j;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
		"file:src/main/webapp/WEB-INF/spring/security-context.xml"
	})
@Log4j
public class UserControllerTest {

	@Autowired
	private WebApplicationContext ctx;

	private MockMvc mockMvc;

	@Before
	public void contextSet() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	
	@Before public void setUp() { 
		SecurityContextHolder.getContext() 
		.setAuthentication(
				new UsernamePasswordAuthenticationToken("user01", "alfls@@8103", 
						Arrays.asList(new SimpleGrantedAuthority("ROLE_MEMBER")))
				); 
		}
	
	@Test
	@Ignore
	public void read() throws Exception {
		
		mockMvc.perform(MockMvcRequestBuilders.post("/replies/like")
				.param("replyNumber", "43")
				).andReturn();
		
	}
	
	@Test
	public void create() throws Exception {
		mockMvc.perform(MockMvcRequestBuilders.post("/user/register")
				.param("userId", "user01")
				.param("userPw", "alfls@@8103")
				.param("userName", "차현호")
				.param("userNickname", "염따")
				.param("email", "chamym@naver.com")
				.param("userAbout", "자기소개")
				).andReturn();
	}
	
	@Test
	@Ignore
	public void emailCheckTest() throws Exception {
		
		mockMvc.perform(MockMvcRequestBuilders.get("/user/emailcheck")
				.param("userId", "user00")
				.param("email", "chamym@naver.com")
				.param("emailKey", "tOQMg9k99WMKgKpINDxmNfSBR44hKsuIzaszgf2b1gn2uecP6k")
				).andReturn().getModelAndView().getViewName();
		
	}

}

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
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.WebApplicationContext;

import lombok.extern.log4j.Log4j;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
	})
@Log4j
public class BoardControllerTest {

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
	public void list() throws Exception {
		mockMvc.perform(MockMvcRequestBuilders.get("/cbp/blp").param("code", "1")).andReturn().getModelAndView()
				.getModelMap();
	}

	@Test
	@Ignore
	public void create() throws Exception {

		String resultPage = mockMvc
				.perform(MockMvcRequestBuilders.post("/cbp/bcp").param("boardTitle", "Mock mvc를 이용한 생성 테스트 입니다.")
						.param("boardContent", "Mock mvc를 이용한 생성 테스트 입니다.")
						.param("userNickname", "user00")
						.param("boardWriter", "차차차")
						.param("boardCode", "2"))
				.andReturn().getModelAndView().getViewName();
		log.info(resultPage);
	}

	@Test
	@Ignore
	public void read() throws Exception {

		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/cbp/brp")
				.param("boardNumber", "1145")
				.param("code", "1")
				.param("page", "1")
				.param("perPageNum", "10"))
				.andReturn().getModelAndView().getModelMap());
	}

	@Test
	public void update() throws Exception {

		String result = mockMvc
				.perform(MockMvcRequestBuilders.post("/cbp/bmp")
						.param("boardNumber", "1146")
						.param("boardTitle", "mockMvc 게시글 수정테스트")
						.param("boardContent", "mockMvc 게시글 수정테스트")
						.param("userNickname", "gd")
						.param("boardWriter", "user01")
						.param("boardCode", "5"))
				.andReturn().getModelAndView().getViewName();

		log.info(result);
	}

	@Test
	@Transactional
	@Ignore
	public void delete() throws Exception {

		String result = mockMvc.perform(MockMvcRequestBuilders.post("/cbp/bdp")
				.param("boardNumber", "2274"))
				.andReturn().getModelAndView().getViewName();
		log.info(result);
	}
	
	@Test
	@Ignore
	public void like() throws Exception {
		
		mockMvc.perform(MockMvcRequestBuilders.post("/cbp/like")
				.param("boardNumber", "2274")
				.param("status", "G")
				).andReturn();
		
	}
	
	@Test
	@Ignore
	public void totalSearch() throws Exception {
		
		mockMvc.perform(MockMvcRequestBuilders.get("/cbp/search")
				.param("searchOption", "TCW")
				.param("searchContent", "alert")
				.param("searchOrAnd", "or")
				.param("sort", "search")
				).andReturn();
		
	}

}

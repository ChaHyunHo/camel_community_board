package com.camel.community.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.camel.community.domain.AuthVO;
import com.camel.community.domain.UserVO;

import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class UserMapperTest {
	
	@Autowired
	private UserDAO dao;
	
	@Test
	public void read() throws Exception {
		
		UserVO vo = dao.read("user00");
		
		log.info(vo);
		
		vo.getAuthList().forEach(authVO -> log.info(authVO));
		
		for(AuthVO authVO : vo.getAuthList()) {
			log.info(authVO);
		}
	}
}
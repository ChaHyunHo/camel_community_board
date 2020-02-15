package com.camel.community.dao;

import org.junit.Assert;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.camel.community.domain.AuthVO;
import com.camel.community.domain.UserVO;

import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	  "file:src/main/webapp/WEB-INF/spring/root-context.xml",
	  "file:src/main/webapp/WEB-INF/spring/security-context.xml"
	  })
public class UserDAOTest {
	
	@Autowired
	private UserDAO dao;
	
	@Autowired
	private PasswordEncoder pwencoder;
	
	@Test
	@Ignore
	public void read() throws Exception {
		
		UserVO vo = dao.read("user00");
		
		log.info(vo);
		
		vo.getAuthList().forEach(authVO -> log.info(authVO));
		
		for(AuthVO authVO : vo.getAuthList()) {
			log.info(authVO);
		}
	}
	
	@Test
	@Ignore
	@Transactional
	public void create() throws Exception {
		UserVO vo = new UserVO();
		AuthVO auth = new AuthVO();
		
		vo.setUserId("user03");
		vo.setUserPw(pwencoder.encode("user03"));
		vo.setUserName("차현호");
		vo.setUserNickname("TEST");
		vo.setEmail("chamym@naver.com");
		vo.setUserAbout("안녕하세요?");
		
		auth.setUserId("user03");
		auth.setAuth("ROLE_MEMBER");
		
		Assert.assertNotNull(vo);
		Assert.assertNotNull(auth);
		
		dao.create(vo);
		dao.authCreate(auth);
	}
	
	@Test
	@Ignore
	public void update() throws Exception {
		UserVO user = dao.read("user01");
		
		log.info(user);

		Assert.assertNotNull(user);
		user.setUserPw(pwencoder.encode("alfls@@8103"));
		user.setUserNickname("염따");
		user.setUserAbout("자기소개 변경");
		
		dao.update(user);
		
	}
	
	@Test
	@Transactional
	public void delete() throws Exception {
		String userId = "user03";
		
		dao.authDelete(userId);
		dao.delete(userId);
		
	}
}
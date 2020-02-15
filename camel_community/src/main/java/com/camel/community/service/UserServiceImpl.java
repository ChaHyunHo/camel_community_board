package com.camel.community.service;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.camel.community.Utils.MailUtils;
import com.camel.community.dao.UserDAO;
import com.camel.community.domain.AuthVO;
import com.camel.community.domain.UserVO;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO userDao;
	
	@Autowired
	private PasswordEncoder pwencoder;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Override
	public UserVO read(String userId) throws Exception {
		return userDao.read(userId);
	}
	
	/**
	 * 회원 가입과 동시에 MatilUtil을 이용하여 인증전 회원의 이메일로 
	 * 인증 링크를 보낸다. 
	 */
	@Override
	@Transactional
	public void create(UserVO vo) throws Exception {
		AuthVO auth = new AuthVO();
		auth.setUserId(vo.getUserId());
		auth.setAuth("ROLE_MEMBER");
		
		vo.setUserPw(pwencoder.encode(vo.getUserPw()));
		
		String emailKey = RandomStringUtils.randomAlphanumeric(50);
		vo.setEmailKey(emailKey);
		
		userDao.create(vo);
		userDao.authCreate(auth);
		
		MailUtils sendMail = new MailUtils(mailSender);
        sendMail.setSubject(vo.getUserId()+"님 [CamelCase Community board] 회원가입 이메일 인증 입니다.");
        sendMail.setText(new StringBuffer().append("<h1>[이메일 인증]</h1>")
                .append("<p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>")
                .append("<a href='http://chamym.cafe24.com//user/emailcheck?userId=")
                .append(vo.getUserId())
                .append("&email=")
                .append(vo.getEmail())
                .append("&emailKey=")
                .append(vo.getEmailKey())
                .append("' target='_blenk'>이메일 인증 확인 후 로그인 가능하십니다.</a>")
                .toString());
        sendMail.setTo(vo.getEmail());
        sendMail.send();
	
		
	}

	@Override
	public void update(UserVO vo) throws Exception {
		
	}

	@Override
	public void delete(String userId) throws Exception {
		
	}
	
	/**
	 * 인증 과정중 enabled(계정 잠금)를 1로 활성화 시켜주고
	 * 이메일 인증키를 다시 설정해준다. 다시 설정해 주는 이유는
	 * 이메일 인증 과정을 계속해서 반복 할 수있는 문제와 
	 * 다른 이유로 계정이 잠금되는 과정중 링크를 통해 무한으로
	 * 계정 잠금을 헤제할 수 있기 때문이다. 
	 */
	@Override
	@Transactional
	public void emailCheck(UserVO vo) throws Exception {
		UserVO readUser = userDao.emailKeyAndUserId(vo);
			
		if(vo.getEmailKey().equals(readUser.getEmailKey())) {
			vo.setEnabled(1);
			userDao.emailStatusUpdate(vo);
			
			vo.setEmailKey(RandomStringUtils.randomAlphabetic(50));
			userDao.emailKeyUpdate(vo.getUserId(), vo.getEmailKey());
		}
	}
	
	/**
	 * userCount = 1 이미 사용중인 아이디
	 */
	@Override
	public int userIdDuplCheck(String userId) throws Exception {
		
		int duplCount = 0;
		
		if(userDao.userIdDuplCheck(userId) >= 1) {
			duplCount = 1;
		}
		
		return duplCount;
	}

	@Override
	public int emailDuplCheck(String email) throws Exception {
		int duplCount = 0;
		
		if(userDao.emailDuplCheck(email) >= 1) {
			duplCount = 1;
		}
		
		return duplCount;
	}

	@Override
	public int nicknameDuplCheck(String userNickname) throws Exception {
		int duplCount = 0;
		
		if(userDao.nicknameDuplCheck(userNickname) >= 1) {
			duplCount = 1;
		}
		
		return duplCount;
	}
}

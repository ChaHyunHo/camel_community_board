package com.camel.community.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.camel.community.dao.UserDAO;
import com.camel.community.domain.CamelUserDetails;
import com.camel.community.domain.UserVO;

import lombok.extern.log4j.Log4j;

@Log4j
public class CamelUserDetailsService implements UserDetailsService {
	
	@Autowired
	private UserDAO userDao;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		log.info("loadUserByUsername :" + username);
		
		try {
			UserVO userVO = userDao.read(username);
			
			log.info("================== userVO : "+userVO);
			
			return new CamelUserDetails(userVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}

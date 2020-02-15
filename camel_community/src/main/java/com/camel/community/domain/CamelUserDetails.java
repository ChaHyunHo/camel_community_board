package com.camel.community.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import lombok.Getter;
import lombok.extern.log4j.Log4j;

@Getter
@Log4j
public class CamelUserDetails extends User {

	private static final long serialVersionUID = 1L;

	private UserVO user;

	public CamelUserDetails(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}

	public CamelUserDetails(UserVO userVO) {

		super(userVO.getUserId(), userVO.getUserPw(), userVO.getAuthList().stream()
				.map(auth -> new SimpleGrantedAuthority(auth.getAuth())).collect(Collectors.toList()));

		log.info("userDetails authorities Check:" + userVO.getAuthList().stream()
				.map(auth -> new SimpleGrantedAuthority(auth.getAuth())).collect(Collectors.toList()));

		this.user = userVO;
	}
	
	// Enabled 1 이면 true값을 반환
	@Override
	public boolean isEnabled()  {
		return user.getEnabled() == 1 ? true:false;
	}

}

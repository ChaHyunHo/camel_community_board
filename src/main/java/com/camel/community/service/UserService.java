package com.camel.community.service;

import com.camel.community.domain.UserVO;

public interface UserService {
	
	// 회원 등록
	public void create(UserVO vo) throws Exception;
	
	// 회원 상세 
	public UserVO read(String userId) throws Exception;
	
	// 회원 수정
	public void update(UserVO vo) throws Exception;
	
	// 회원 삭제
	public void delete(String userId) throws Exception;
	
	// 이메일 인증 
	public void emailCheck(UserVO vo) throws Exception;
	
	// 아이디 중복 체크
	public int userIdDuplCheck(String userId) throws Exception;
	
	// email 중복 체크
	public int emailDuplCheck(String email) throws Exception;
	
	// nickname 중복 체크
	public int nicknameDuplCheck(String userNickname) throws Exception;

}

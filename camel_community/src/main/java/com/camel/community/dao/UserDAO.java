package com.camel.community.dao;

import com.camel.community.domain.AuthVO;
import com.camel.community.domain.UserVO;

public interface UserDAO {
	
	// 회원 등록
	public void create(UserVO vo) throws Exception;
	
	// 회원 권한 등록
	public void authCreate(AuthVO vo) throws Exception;
	
	// 회원 상세 
	public UserVO read(String userId) throws Exception;
	
	// 회원 수정
	public void update(UserVO vo) throws Exception;
	
	// 회원 삭제
	public void delete(String userId) throws Exception;
	
	// 회원 권한 삭제
	public void authDelete(String userId) throws Exception;
	
	// 이메일 인증키 변경
	public void emailKeyUpdate(String userId, String emailKey) throws Exception;
	
	// enabled 변경( '1' or '0')
	public void emailStatusUpdate(UserVO vo) throws Exception;
	
	// 이메일 인증키와 회원아이디 두가지 조건의 회원 아이디 찾기
	public UserVO emailKeyAndUserId(UserVO vo) throws Exception;
	
	// 아이디 중복 체크
	public int userIdDuplCheck(String userId) throws Exception;
	
	// email 중복 체크
	public int emailDuplCheck(String email) throws Exception;
	
	// nickname 중복 체
	public int nicknameDuplCheck(String userNickname) throws Exception;
}

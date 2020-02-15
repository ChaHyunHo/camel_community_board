package com.camel.community.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.camel.community.domain.AuthVO;
import com.camel.community.domain.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {
	
	 @Autowired
	 private SqlSession sqlSession;

	 private static final String namespace = "userMapper.";

	@Override
	public UserVO read(String userId) throws Exception {
		
		return sqlSession.selectOne(namespace + "read", userId);
	}

	@Override
	public void create(UserVO vo) throws Exception {
		sqlSession.insert(namespace + "create", vo);
	}

	@Override
	public void update(UserVO vo) throws Exception {
		 sqlSession.update(namespace + "update", vo);
	}

	@Override
	public void delete(String userId) throws Exception {
		sqlSession.delete(namespace + "delete", userId);
	}

	@Override
	public void authCreate(AuthVO vo) throws Exception {
		sqlSession.insert(namespace + "authCreate", vo);
	}

	@Override
	public void authDelete(String userId) throws Exception {
		sqlSession.delete(namespace + "authDelete", userId);
	}

	@Override
	public void emailKeyUpdate(String userId, String emailKey) throws Exception {
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("userId", userId);
		map.put("emailKey", emailKey);
		
		sqlSession.update(namespace + "emailKeyUpdate", map);
	}

	@Override
	public void emailStatusUpdate(UserVO vo) throws Exception {
		sqlSession.update(namespace + "emailStatusUpdate", vo);
	}

	@Override
	public UserVO emailKeyAndUserId(UserVO vo) throws Exception {
		return sqlSession.selectOne(namespace + "emailKeyAndUserId", vo);
	}

	@Override
	public int userIdDuplCheck(String userId) throws Exception {
		return sqlSession.selectOne(namespace + "userIdDuplCheck", userId);
	}

	@Override
	public int emailDuplCheck(String email) throws Exception {
		return sqlSession.selectOne(namespace + "emailDuplCheck", email);
	}

	@Override
	public int nicknameDuplCheck(String userNickname) throws Exception {
		return sqlSession.selectOne(namespace + "nicknameDuplCheck", userNickname);
	}

}

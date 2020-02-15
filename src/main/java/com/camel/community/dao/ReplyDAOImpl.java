package com.camel.community.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.camel.community.domain.ReplyLikeVO;
import com.camel.community.domain.ReplyVO;
import com.camel.community.domain.Standard;

@Repository
public class ReplyDAOImpl implements ReplyDAO {
	
	 @Autowired
	 private SqlSession sqlSession;

	 private static final String namespace = "replyMapper.";

	@Override
	public void create(ReplyVO vo) throws Exception {
		sqlSession.insert(namespace + "create", vo);
	}

	@Override
	public int groupNumberSet() throws Exception {
		return sqlSession.update(namespace + "groupNumberSet");
	}

	@Override
	public int update(ReplyVO vo) throws Exception {
		return sqlSession.update(namespace + "update", vo);
	}

	@Override
	public List<ReplyVO> readAll(Integer boardNumber, Standard std) throws Exception {
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("boardNumber", boardNumber);
		map.put("std", std);
		
		return sqlSession.selectList(namespace + "readAll", map);
	}

	@Override
	public void delete(Integer replyNumber) throws Exception {
		 sqlSession.delete(namespace + "delete", replyNumber);
	}

	@Override
	public ReplyVO read(Integer replyNumber) throws Exception {
		return sqlSession.selectOne(namespace + "read", replyNumber);
	}

	@Override
	public void orderNumberUpdate(int orderCount) throws Exception {
		sqlSession.update(namespace + "orderNumberUpdate", orderCount);
		
	}

	@Override
	public int replyTotalCount(Integer boardNumber) throws Exception {
		return sqlSession.selectOne(namespace + "replyTotalCount", boardNumber);
	}

	@Override
	public List<ReplyVO> simpleList(Integer boardNumber) throws Exception {
		return sqlSession.selectList(namespace + "simpleList", boardNumber);
	}

	@Override
	public int childrentCheck(Integer replyNumber) throws Exception {
		return sqlSession.selectOne(namespace + "childrentCheck", replyNumber);
	}

	@Override
	public List<ReplyLikeVO> replyLikeList(Integer replyNumber) throws Exception {
		return sqlSession.selectList(namespace + "replyLikeList", replyNumber);
	}

	@Override
	public void replyLikeCreate(ReplyLikeVO vo) throws Exception {
		sqlSession.insert(namespace + "replyLikeCreate", vo);
		
	}

	@Override
	public void replyLikeDelete(ReplyLikeVO vo) throws Exception {
		sqlSession.delete(namespace + "replyLikeDelete", vo);
	}

	@Override
	public void replyLikeAllDelete(Integer replyNumber) throws Exception {
		sqlSession.delete(namespace + "replyLikeAllDelete", replyNumber);	
	}

	@Override
	public int replyLikeCountRead(Integer replyNumber) throws Exception {
		return sqlSession.selectOne(namespace + "replyLikeCountRead", replyNumber);
	}

	@Override
	public void replyLikeCountUpdate(Integer totalCount, Integer replyNumber) throws Exception {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("totalCount", totalCount);
		map.put("replyNumber", replyNumber);
		
		sqlSession.update(namespace + "replyLikeCountUpdate", map );
	}


}

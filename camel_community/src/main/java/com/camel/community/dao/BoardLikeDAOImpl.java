package com.camel.community.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.camel.community.domain.LikeVO;

@Repository
public class BoardLikeDAOImpl implements BoardLikeDAO{

	 @Autowired
	 private SqlSession sqlSession;

	 private static final String namespace = "boardLikeMapper.";

	@Override
	public int create(LikeVO vo) throws Exception {
		return sqlSession.insert(namespace + "create",vo);
	}

	@Override
	public LikeVO read(Integer likeNumber) throws Exception {
		return sqlSession.selectOne(namespace + "read", likeNumber);
	}

	@Override
	public void update(LikeVO vo) throws Exception {
		sqlSession.update(namespace + "update",vo);
	}

	@Override
	public int remove(LikeVO vo) throws Exception {
		return sqlSession.delete(namespace + "remove", vo);
	}

	@Override
	public List<LikeVO> likeList(Integer boardNumber) throws Exception {
		return sqlSession.selectList(namespace + "likeList", boardNumber);
	}

	@Override
	public int likeGoodTotalCount(Integer boardNumber) throws Exception {
		return sqlSession.selectOne(namespace + "likeGoodTotalCount", boardNumber);
	}

	@Override
	public int likeBadTotalCount(Integer boardNumber) throws Exception {
		return sqlSession.selectOne(namespace + "likeBadTotalCount", boardNumber);
	}

	@Override
	public void likeBoardTotalDelete(Integer boardNumber) throws Exception {
		sqlSession.delete(namespace + "likeBoardTotalDelete", boardNumber);
	}

}

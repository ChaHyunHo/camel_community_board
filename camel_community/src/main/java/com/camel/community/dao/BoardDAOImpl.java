package com.camel.community.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.camel.community.domain.BoardVO;
import com.camel.community.domain.CategoryVO;
import com.camel.community.domain.SearchBoard;
import com.camel.community.domain.Standard;

import lombok.extern.log4j.Log4j;

@Log4j
@Repository
public class BoardDAOImpl implements BoardDAO {
	
	 @Autowired
	 private SqlSession sqlSession;

	 private static final String namespace = "boardMapper.";

	@Override
	public void create(BoardVO vo) throws Exception {
		sqlSession.insert(namespace + "create", vo);
		
	}

	@Override
	public BoardVO read(Integer boardNumber) throws Exception {
		 return sqlSession.selectOne(namespace + "read", boardNumber);
	}

	@Override
	public int update(BoardVO vo) throws Exception {
		 return sqlSession.update(namespace + "update", vo);
	}

	@Override
	public int delete(Integer boardNumber) throws Exception {
		 return sqlSession.delete(namespace + "delete", boardNumber);
		
	}

	@Override
	public List<BoardVO> listAll() throws Exception {
		return sqlSession.selectList(namespace + "listAll");
	}

	@Override
	public List<BoardVO> detailList(int code) throws Exception {
		return  sqlSession.selectList(namespace + "detailList",code);
	}

	@Override
	public int redirectBoardCode(int boardNumber) throws Exception {
		return sqlSession.selectOne(namespace + "redirectBoardCode", boardNumber);
	}

	@Override
	public List<BoardVO> listpage(Standard std) throws Exception {
		
		return sqlSession.selectList(namespace + "listpage", std);
	}

	@Override
	public int totalBoardCount(Standard std) throws Exception {
		return sqlSession.selectOne(namespace + "totalBoardCount",std);
	}

	@Override
	public List<BoardVO> prevAndNextBoardRead(Standard std) throws Exception {
		return sqlSession.selectList(namespace +"prevAndNextBoardRead",std);
	}

	@Override
	public List<BoardVO> listSearchPage(SearchBoard std) throws Exception {
		
		return sqlSession.selectList(namespace + "listSearchPage", std);
	}

	@Override
	public int totalSearchBoardCount(SearchBoard std) throws Exception {
		return sqlSession.selectOne(namespace + "totalSearchBoardCount", std);
	}

	@Override
	public CategoryVO categoryInfo(Integer boardCode) throws Exception {
		return sqlSession.selectOne(namespace + "categoryInfo", boardCode);
	}

	@Override
	public void updateReplyCount(Integer boardNumber, int msg) throws Exception {
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("boardNumber", boardNumber);
		map.put("msg", msg);
		
		sqlSession.update(namespace + "updateReplyCount", map);
	}

	@Override
	public int replyGetBoardNumber(Integer replyNumber) throws Exception {
		return sqlSession.selectOne(namespace + "replyGetBoardNumber", replyNumber);
	}

	@Override
	public void boardViewCountUpdate(Integer boardNumber) throws Exception {
		sqlSession.update(namespace + "boardViewCountUpdate",boardNumber);
	}

	@Override
	public void boardGoodUpdate(Integer totalCount, Integer boardNumber) throws Exception {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("goodTotalCount", totalCount);
		map.put("boardNumber", boardNumber);
		
		sqlSession.update(namespace + "boardGoodUpdate", map);
	}

	@Override
	public void boardBadUpdate(Integer totalCount, Integer boardNumber) throws Exception {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("badTotalCount", totalCount);
		map.put("boardNumber", boardNumber);
		
		sqlSession.update(namespace + "boardBadUpdate", map);
	}

	@Override
	public List<BoardVO> totalSearchPage(SearchBoard std) throws Exception {
		return sqlSession.selectList(namespace + "totalSearchPage", std);
	}
}

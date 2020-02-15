package com.camel.community.service;

import java.util.HashMap;
import java.util.List;

import com.camel.community.domain.BoardVO;
import com.camel.community.domain.CategoryVO;
import com.camel.community.domain.LikeVO;
import com.camel.community.domain.SearchBoard;
import com.camel.community.domain.Standard;

public interface BoardService {
	
	// 게시글 작성 
	public void create(BoardVO vo) throws Exception;
	
	// 게시글 상세보기 
	public BoardVO read(Integer boardNumber) throws Exception;
	
	// 게시글 수정하기 
	public int update(BoardVO vo) throws Exception;
	
	// 게시글 삭제하기 
	public HashMap<String, Integer> delete(Integer boardNumber) throws Exception;

	// 게시판 리스트 보기 
	public List<BoardVO> listAll() throws Exception;
	
	// 베스트 게시판 리스트 
	public List<BoardVO> detailList(int code) throws Exception;
	
	// 게시글 페이징 처리 
	public List<BoardVO> listpage(SearchBoard std) throws Exception;
	
	// 게시글 페이징을 위한 게시글 총갯수 
	public int totalBoardCount(Standard std) throws Exception;
	
	// 이전글 다음글 객체를 쿼리에서 가져온다. 
	public HashMap<String,Object> prevAndNextBoardRead(Integer newCount ,Standard std) throws Exception;
	
	// 게시글 검색 처리 
	public HashMap<String, Object> listSearchPage(SearchBoard std, String username) throws Exception;
	
	// 게시글 전체 검색 처리 
	public HashMap<String, Object> totalSearchPage(SearchBoard std, String username) throws Exception;
	
	// 게시글 검색 게시글 수 
	public int totalSearchBoardCount(SearchBoard std) throws Exception;
	
	// 게시판 카테고리 정보를 가지고 온다. 
	public CategoryVO categoryInfo(Integer boardCode) throws Exception;
	
	// 게시글의 조회수를 업데이트 시킨다. 
	public void boardViewCountUpdate(Integer boardNumber) throws Exception;
	
	// 게시글의 추천 과 비추천 등록 
	public HashMap<String, Integer> boardGoodAndBad(LikeVO vo) throws Exception;
	
	
}

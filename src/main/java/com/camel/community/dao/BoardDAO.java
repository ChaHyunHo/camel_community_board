package com.camel.community.dao;

import java.util.List;

import com.camel.community.domain.BoardVO;
import com.camel.community.domain.CategoryVO;
import com.camel.community.domain.SearchBoard;
import com.camel.community.domain.Standard;

public interface BoardDAO {
	
	// 게시글 작성
	public void create(BoardVO vo) throws Exception;
	
	// 게시글 상세보기
	public BoardVO read(Integer boardNumber) throws Exception;
	
	// 게시글 수정하기 
	public int update(BoardVO vo) throws Exception;
	
	// 게시글 삭제하기
	public int delete(Integer boardNumber) throws Exception;

	// 게시판 리스트 보기
	public List<BoardVO> listAll() throws Exception;
	
	// 카테고리별 게시판 리스트
	public List<BoardVO> detailList(int code) throws Exception;
	
	// 게시글 삭제시 리다이렉트 용도로 쓴다. ex /cbp/blp?code= boardNumber 
	public int redirectBoardCode(int boardNumber) throws Exception;
	
	// 게시글 페이징 처리
	public List<BoardVO> listpage(Standard std) throws Exception;
	
	// 게시글 검색 처리
	public List<BoardVO> listSearchPage(SearchBoard std) throws Exception;
	
	// 게시글 전체 검색 처리 
	public List<BoardVO> totalSearchPage(SearchBoard std) throws Exception;
	
	// 게시글 검색 게시글 수 
	public int totalSearchBoardCount(SearchBoard std) throws Exception;
	
	// 게시글 페이징을 위한 게시글 총갯수 
	public int totalBoardCount(Standard std) throws Exception;
	
	// 이전글 다음글 객체를 쿼리에서 가져온다. 
	public List<BoardVO> prevAndNextBoardRead(Standard std) throws Exception;
	
	// 게시판 카테고리 정보를 가지고 온다. 
	public CategoryVO categoryInfo(Integer boardCode) throws Exception;
	
	// 게시판 댓글수 업데이트 
	public void updateReplyCount(Integer boardNumber, int msg ) throws Exception;
	
	// 댓글에 해당하는 게시글 번호를 가져온다. 
	public int replyGetBoardNumber(Integer replyNumber) throws Exception;
	
	// 게시글의 조회수를 업데이트 시킨다. 
	public void boardViewCountUpdate(Integer boardNumber) throws Exception;
	
	// 게시글 추천 업데이트 
	public void boardGoodUpdate(Integer totalCount, Integer boardNumber) throws Exception;
	
	// 게시글 비추천 업데이트 
	public void boardBadUpdate(Integer totalCount, Integer boardNumber) throws Exception;
	
	

}

package com.camel.community.dao;

import java.util.List;

import com.camel.community.domain.ReplyLikeVO;
import com.camel.community.domain.ReplyVO;
import com.camel.community.domain.Standard;

public interface ReplyDAO {
	
	// 댓글 작성 
	public void create(ReplyVO vo) throws Exception;
	
	// create 후 groupNumber에 increment된 number를 대입시켜준다.(계층형 댓글의 구분용으로 사용한다.) 
	public int groupNumberSet() throws Exception;
	
	// 댓글 수정 
	public int update(ReplyVO vo) throws Exception;
	
	// 댓글 읽기 
	public ReplyVO read(Integer replyNumber) throws Exception;
	
	// 댓글 리스트 
	public List<ReplyVO> readAll(Integer boardNumber, Standard std) throws Exception;
	
	// 페이지 상관없이 단순 댓글 리스트를 가져온다 
	public List<ReplyVO> simpleList(Integer boardNumber) throws Exception;
	
	// 댓글 삭제 
	public void delete(Integer replyNumber) throws Exception;
	
	// 계층형 댓글 순서 (각 계층마다 순서를 정해준다) 
	public void orderNumberUpdate(int orderCount) throws Exception;
	
	// 해당 게시글당 총 댓글 갯수 
	public int replyTotalCount(Integer boardNumber) throws Exception;
	
	// 자식 댓글이 있는지 확인 
	public int childrentCheck(Integer replyNumber) throws Exception;

	// 댓글 추천 리스트 가져오기 
	public List<ReplyLikeVO> replyLikeList(Integer replyNumber) throws Exception;
	
	// 댓글 추천 등록 
	public void replyLikeCreate(ReplyLikeVO vo) throws Exception;
	
	// 댓글 추천 삭제 
	public void replyLikeDelete(ReplyLikeVO vo) throws Exception;
	
	// 댓글 추천 정보 삭제 
	public void replyLikeAllDelete(Integer replyNumber) throws Exception;

	// 댓글 추천수 가져오기  
	public int replyLikeCountRead(Integer replyNumber) throws Exception;
	
	// 댓글 수 업데이트  
	public void replyLikeCountUpdate(Integer totalCount, Integer replyNumber) throws Exception;

	
}

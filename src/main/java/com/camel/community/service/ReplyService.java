package com.camel.community.service;

import java.util.List;

import com.camel.community.domain.ReplyLikeVO;
import com.camel.community.domain.ReplyVO;
import com.camel.community.domain.Standard;

public interface ReplyService {
	
	// 댓글 작성 
	public void create(ReplyVO vo) throws Exception;
	
	// 댓글 수정 
	public int update(ReplyVO vo) throws Exception;
	
	// 댓글 리스트 읽기 
	public List<ReplyVO> readAll(Integer boardNumber, Standard std) throws Exception;
	
	// 댓글 읽기 
	public ReplyVO read(Integer replyNumber) throws Exception;
	
	// 댓글 삭제 
	public void delete(Integer replyNumber) throws Exception;
	
	// 해당 게시글당 총 댓글 갯수 
	public int replyTotalCount(Integer boardNumber) throws Exception;
	
	// 자식 댓글이 있는지 확인 
	public int childrentCheck(Integer replyNumber) throws Exception;
	
	// 댓글 추천  
	public int replyLikeService(ReplyLikeVO vo) throws Exception;
	
}

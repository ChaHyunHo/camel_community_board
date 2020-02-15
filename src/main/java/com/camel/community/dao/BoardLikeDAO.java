package com.camel.community.dao;

import java.util.List;

import com.camel.community.domain.LikeVO;

public interface BoardLikeDAO {
	
	// 추천 등록 
	public int create(LikeVO vo) throws Exception;
	
	// 추천 상세  
	public LikeVO read(Integer likeNumber) throws Exception;
	
	// 추천 수정 
	public void update(LikeVO vo) throws Exception;
	
	// 추천 삭제 
	public int remove(LikeVO vo) throws Exception;
	
	// 해당 게시물의 추천등록한 리스트를 가져온다. 
	public List<LikeVO> likeList(Integer boardNumber) throws Exception;
	
	// 추천 총 수를 가져온다. 
	public int likeGoodTotalCount(Integer boardNumber) throws Exception;
	
	// 비추천 총 수를 가져온다. 
	public int likeBadTotalCount(Integer boardNumber) throws Exception;
	
	// 게시글 삭제시 해당 추천 모두 삭제 
	public void likeBoardTotalDelete(Integer boardNumber) throws Exception;
	
	


}

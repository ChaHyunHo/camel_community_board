package com.camel.community.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.camel.community.Utils.XssFiter;
import com.camel.community.dao.BoardDAO;
import com.camel.community.dao.ReplyDAO;
import com.camel.community.domain.ReplyLikeVO;
import com.camel.community.domain.ReplyVO;
import com.camel.community.domain.Standard;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	private ReplyDAO replyDAO;
	
	@Autowired
	private BoardDAO boardDAO;
	
	/**
	 * 댓글 등록
	 */
	@Override
	@Transactional
	public void create(ReplyVO vo) throws Exception {
	
		if(vo.getGroupNumber() == null) {
			
			replyDAO.create(XssFiter.xssReplyFilter(vo));
			
			replyDAO.groupNumberSet();
			
			int parentCount = 0; 
			
			List<ReplyVO> list = replyDAO.simpleList(vo.getBoardNumber());
			
			for(ReplyVO reply : list) {
				
				if(reply.getParentReplyNumber() == 0) {
					parentCount++;
				}
			}
			vo.setOrderCount(parentCount);
			replyDAO.orderNumberUpdate(parentCount);
			boardDAO.updateReplyCount(vo.getBoardNumber(), 1);
			
		} else if(vo.getGroupNumber() != null) {
			
			vo.setParentReplyNumber(vo.getReplyNumber());
		
			if(vo.getDepth() == null) {
				vo.setDepth(0);
			} else {
				vo.setDepth(vo.getDepth());
			}
			
			replyDAO.create(XssFiter.xssReplyFilter(vo));
			
			int parentCount = 0; 
			
			List<ReplyVO> list = replyDAO.simpleList(vo.getBoardNumber());
			
			for(ReplyVO reply : list) {
				
				if(reply.getParentReplyNumber().equals(vo.getReplyNumber())) {
					parentCount++;
				}
			}
			vo.setOrderCount(parentCount);
			replyDAO.orderNumberUpdate(parentCount);
			boardDAO.updateReplyCount(vo.getBoardNumber(), 1);
		}
	}

	@Override
	public int update(ReplyVO vo) throws Exception {
		return replyDAO.update(XssFiter.xssReplyFilter(vo));
	}

	@Override
	public List<ReplyVO> readAll(Integer boardNumber, Standard std) throws Exception {
		return replyDAO.readAll(boardNumber, std);
	}

	@Override
	@Transactional
	public void delete(Integer replyNumber) throws Exception {
		int boardNumber = boardDAO.replyGetBoardNumber(replyNumber);
		boardDAO.updateReplyCount(boardNumber, -1);
		replyDAO.replyLikeAllDelete(replyNumber);
		replyDAO.delete(replyNumber);
	}

	@Override
	public ReplyVO read(Integer replyNumber) throws Exception {
		return replyDAO.read(replyNumber);
	}

	@Override
	public int replyTotalCount(Integer boardNumber) throws Exception {
		return replyDAO.replyTotalCount(boardNumber);
	}

	@Override
	public int childrentCheck(Integer replyNumber) throws Exception {
		return replyDAO.childrentCheck(replyNumber);
	}

	@Override
	public int replyLikeService(ReplyLikeVO vo) throws Exception {
		int result = 0;
		
		if(vo.getUserId() != null && vo.getReplyNumber() != null) {
			
			boolean flag = true;
			
			List<ReplyLikeVO> list = replyDAO.replyLikeList(vo.getReplyNumber());
			
			for(ReplyLikeVO likeVO : list) {
				
				if(likeVO.getUserId().equals(vo.getUserId())) {
					replyDAO.replyLikeDelete(vo);
					int likeTotalCount = replyDAO.replyLikeCountRead(vo.getReplyNumber());
					replyDAO.replyLikeCountUpdate(likeTotalCount, vo.getReplyNumber());
					
					result = likeTotalCount;
					flag = false;
					break;
				}
			}
			
			if(flag) {
				replyDAO.replyLikeCreate(vo);
				int likeTotalCount = replyDAO.replyLikeCountRead(vo.getReplyNumber());
				
				replyDAO.replyLikeCountUpdate(likeTotalCount, vo.getReplyNumber());
				result = likeTotalCount;
			}
		}
		
		return result;
	}
	
}

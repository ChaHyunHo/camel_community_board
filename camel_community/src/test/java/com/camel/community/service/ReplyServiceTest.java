package com.camel.community.service;

import java.util.List;

import org.junit.Assert;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.camel.community.domain.ReplyVO;
import com.camel.community.domain.Standard;

import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ReplyServiceTest {
	
	@Autowired
	private ReplyService replyService;

	
	@Test
	@Ignore
	public void createTest() throws Exception {
		
		// 첫번째 댓글의 대한 등록 테스트
		ReplyVO replyVO = new ReplyVO();
		// replyVO.setReplyNumber(5);
		replyVO.setBoardNumber(2214);
		replyVO.setReplyWriter("comment!!");
		replyVO.setReplyContent("댓글 테스트 입니다. ");
		//replyVO.setDepth(1);
		//replyVO.setGroupNumber(5);
		
		Assert.assertNotNull(replyVO);
		
		replyService.create(replyVO);
		
	}
	
	@Test
	@Ignore
	public void deleteTest() throws Exception {
		replyService.delete(9);
	}
	
	@Test
	@Ignore
	public void updateTest() throws Exception {
		ReplyVO vo  = replyService.read(1);
		
		Assert.assertNotNull(vo);
		
		vo.setReplyContent("수정된 댓글입니다.111111111111111");
		
		replyService.update(vo);
		
	}
	
	@Test
	@Ignore
	public void listAllTest() throws Exception {
		
		Standard std = new Standard(1, 30);
		
		Integer boardNumber = 2214;
		
		List<ReplyVO> list = replyService.readAll(boardNumber,std);
		
		Assert.assertNotNull(list);
		
		for(ReplyVO reply : list) {
			
			log.info(reply);
		}
	}
	
	@Test
	@Ignore
	public void relpyTotalCount() throws Exception {
		
		int boardNumber = 2214;
		
		replyService.replyTotalCount(boardNumber);
		
	}
	
	@Test 
	public void childrenCheck() throws Exception {
		
		int replyNumber = 175;
		int check = replyService.childrentCheck(replyNumber);
		log.info(check);
	}
			
			
	
}

package com.camel.community.service;

import static org.junit.Assert.assertNotNull;

import java.util.HashMap;
import java.util.List;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.camel.community.boardType.BoardType;
import com.camel.community.dao.BoardDAO;
import com.camel.community.domain.BoardVO;
import com.camel.community.domain.SearchBoard;

import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BoardServiceTest {
	
	@Autowired
	private BoardDAO boardDao;
	
	@Autowired
	private BoardService service;

	@Test
	@Ignore
	public void randomBoardTypeCreateTest() throws Exception {
		
		BoardVO board = new BoardVO();
		
		for(int i = 0; i < 1000; i++) {
			
			double randomValue = Math.random();
			int value = (int)(randomValue* 6) + 1;
			
			if(BoardType.MYSTERY.getValue() == value) {
				 board.setBoardTitle("단 한 명의 믿음이 잡은 연쇄살인범");
				 board.setBoardContent(" 1894년에 내 친구가 존 데이비스 선장의 Steamer Tacoma호에 갑판원으로 탔었어. "
				 		+ "그 배는 샌프란시스코에서 중국의 홍콩까지 항해했다. 그곳에 도착하자마자 내 친구와 다른 두 선원은 "
				 		+ "나가서 취하도록 술을 마셨는데, 돌아오니 배는 이미 출항해버린 후였어."); 
				 board.setBoardWriter("미국이야기");
				 board.setBoardCode(value);
				 assertNotNull(board);
				 boardDao.create(board);
			} else if(BoardType.BEST.getValue() == value) {
				 board.setBoardTitle("미필들은 꼭 봐야할 군생활 꿀팁 Top 10");
				 board.setBoardContent(". 저도 저런 마음으로 군대갔음다행히 가혹행위가 거의 사라질 때 들어가서 가혹행위는 없었는데, 문제는 시간이 지나고 후임이 들어와서 갑자기 가혹행위가 작은 장난으로 시작하다가 결국 일이 커짐\r\n" + 
				 		"그 이유는 왕고가 개 폐급으로 교체 되면서 왕고가 장난치니 그 밑에가 따라하고 또 따라하고 점점 정도는 심해지고... 나중에 진짜 이러다 큰일 난다고 하지말라 해도 이미 그 재미에 빠져서 계속하다 결국 영창갔음. 이 때 대빵의 중요성을 알게됬죠."); 
				 board.setBoardWriter("미필");
				 board.setBoardCode(value);
				 assertNotNull(board);
				 boardDao.create(board);
			} else if(BoardType.HUMOR.getValue() == value) {
				 board.setBoardTitle("한국 어디에서든 1000원 넘게 받으면 욕먹는 메뉴");
				 board.setBoardContent("심지어 그 계곡에서도 이 국룰은 지켰음 "); 
				 board.setBoardWriter("국룰");
				 board.setBoardCode(value);
				 assertNotNull(board);
				 boardDao.create(board);
			} else if(BoardType.ANONYMOUS.getValue() == value) {
				 board.setBoardTitle("다음달 입사 앞두고 있는데 입사 전에 뭘 해야 할까요");
				 board.setBoardContent("취미생활 구축?\r\n" + 
				 		"회사 규정집 보기?\r\n" + 
				 		"여행?\r\n" + 
				 		"\r\n" + 
				 		"최종합격 통보 받으면 방 계약 하고 이사하느라 바쁠것같은데\r\n" + 
				 		"작장인 형님들 열흘정도는 여유 있습니다 무얼 하면 좋을까요"); 
				 board.setBoardWriter("신입");
				 board.setBoardCode(value);
				 assertNotNull(board);
				 boardDao.create(board);
			} else if(BoardType.CELEBRITY.getValue() == value) {
				 board.setBoardTitle("SBS 연예대상 김구라, 자조섞인 일침 대상 후보 납득 안 돼");
				 board.setBoardContent("취미생활 구축?\r\n" + 
				 		"회사 규정집 보기?\r\n" + 
				 		"여행?\r\n" + 
				 		"\r\n" + 
				 		"최종합격 통보 받으면 방 계약 하고 이사하느라 바쁠것같은데\r\n" + 
				 		"작장인 형님들 열흘정도는 여유 있습니다 무얼 하면 좋을까요"); 
				 board.setBoardWriter("김구라");
				 board.setBoardCode(value);
				 assertNotNull(board);
				 boardDao.create(board);
			} else if(BoardType.CUSTOMER.getValue() == value) {
				 board.setBoardTitle("불만 접수합니다. !!! 이것좀 봐주세요.");
				 board.setBoardContent("취미생활 구축?\r\n" + 
				 		"회사 규정집 보기?\r\n" + 
				 		"여행?\r\n" + 
				 		"\r\n" + 
				 		"최종합격 통보 받으면 방 계약 하고 이사하느라 바쁠것같은데\r\n" + 
				 		"작장인 형님들 열흘정도는 여유 있습니다 무얼 하면 좋을까요"); 
				 board.setBoardWriter("신입");
				 board.setBoardCode(value);
				 assertNotNull(board);
				 boardDao.create(board);
			}
		}
		
	}
	
	@Test
	public void prevAndNextTest() throws Exception {
HashMap<String, Object> prevAndNext = new HashMap<>();
		
		SearchBoard sdt = new SearchBoard();

		Integer prevNumber = 150 - 1;
		
		Integer nextNumber = 150 + 1;
		
		List<BoardVO> list = boardDao.prevAndNextBoardRead(sdt);
		
		for(BoardVO boardVO : list) {
			
			if(prevNumber.equals(boardVO.getNewCount()) ) {
				prevAndNext.put("prev", boardVO);
			}
			
			if(nextNumber.equals(boardVO.getNewCount()) ) {
				prevAndNext.put("next", boardVO);
			}
		}
		
		log.info(prevAndNext.get("prev"));
		log.info(prevAndNext.get("next"));
	
	}

}

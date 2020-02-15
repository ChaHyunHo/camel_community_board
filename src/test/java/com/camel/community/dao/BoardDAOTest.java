package com.camel.community.dao;

import static org.hamcrest.CoreMatchers.equalTo;
import static org.junit.Assert.assertThat;

import java.util.Arrays;
import java.util.List;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.camel.community.domain.BoardVO;
import com.camel.community.domain.CategoryVO;
import com.camel.community.domain.SearchBoard;
import com.camel.community.domain.Standard;

import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BoardDAOTest {
	
	@Autowired
	private BoardDAO dao;
	
	
	@Test
	@Ignore
	public void create() throws Exception {
		
		BoardVO board = new BoardVO();
		
		board.setBoardTitle("TestboardTitle");
		board.setBoardContent("TestBoardContent");
		board.setBoardWriter("차현호");
		
		dao.create(board);
	}
	
	
	
	@Test
	@Ignore
	public void read() throws Exception {
		
		 BoardVO board = dao.read(3);
	}
	
	@Test
	@Ignore
	public void delete() throws Exception {
		
		for(int i = 6; i < 16; i++) {
			dao.delete(i);
		}
	}
	
	
	
	@Test
	@Ignore
	public void update() throws Exception {
		
		BoardVO board = dao.read(151);
		board.setBoardTitle("chage !! titile !! go go");
		board.setBoardContent("chage !! content !! go go");
		board.setBoardWriter("변경자");
		
		int checkNumber = dao.update(board);
		
		log.info("변경시 반환값을 : " + checkNumber);
		
		String updateBoard = board.getBoardWriter();
		
		assertThat(updateBoard, equalTo("변경자"));
	}
	
	
	
	@Test
	@Ignore
	public void newCountCheck() throws Exception {
		
		dao.detailList(1);
		
	}
	
	@Test
	@Ignore
	public void categoryBoardNumber() throws Exception {
		
		int num = dao.redirectBoardCode(1143);
		
		log.info("카테고리 코드 반환값 : " + num);
	}
	
	@Test
	@Ignore
	public void listPageTest() throws Exception {
		
		Standard std = new Standard();
		std.setPage(2);
		std.setPerPageNum(10);
		std.setCode(1);
		
		List<BoardVO> list = dao.listpage(std);
		
		for(BoardVO boardVO : list) {
			log.info(boardVO.getNewCount() + ":" + boardVO.getBoardTitle());
		}
		
	}
	
	@Test
	@Ignore
	public void totalCount() throws Exception {
		Standard std = new Standard();
		std.setPage(2);
		std.setPerPageNum(10);
		std.setCode(1);
		
		dao.totalBoardCount(std);
		
	}
	
	@Test
	@Ignore
	public void uriTest() throws Exception {
		
		UriComponents uriComponents =
				UriComponentsBuilder.newInstance()
				.path("/cbp/blp")
				.queryParam("boardNumber", 12)
				.queryParam("perPageNum", 20)
				.build();
		log.info("/cbp/blp?boardNumber=12&perPageNum=20");
		log.info(uriComponents.toString());
	}
	

	@Test
	@Ignore
	public void uriTest2() throws Exception {
		
		UriComponents uriComponents =
				UriComponentsBuilder.newInstance()
				.path("/{module}/{page}")
				.queryParam("boardNumber", 12)
				.queryParam("perPageNum", 20)
				.build()
				.expand("cbp","blp")
				.encode();
		log.info("/cbp/blp?boardNumber=12&perPageNum=20");
		log.info(uriComponents.toString());
	}
	
	@Test
	@Ignore
	public void preAndNextBoardTest() throws Exception {
		
	
		
	}
	
	@Test
	@Ignore
	public void listSearchBoardPageTest() throws Exception {
		
		SearchBoard std = new SearchBoard();
		std.setCode(1);
		std.setPage(1);
		std.setSearchOption("TC");
		std.setSearchContent("몸매 ㄷㄷ");
		std.setSearchOrAnd("or");
		
		List<BoardVO> list = dao.listSearchPage(std);
		
		for(BoardVO board : list ) {
			
			log.info("번호: " + board.getNewCount() + "&& 아이디: " + board.getBoardWriter() + " && " + "제목: " + board.getBoardTitle()+ "&& 내용 :" + board.getBoardContent() );
		}
		
		log.info("검색 게시글 총갯수 :" + dao.totalSearchBoardCount(std));
		
	}
	
	@Test
	@Ignore
	public void searchContentListTest() throws Exception {
		
		SearchBoard search = new SearchBoard();
		
		String searchContent = "검색 띄어 쓰기 단어 리스트";
		
		 search.setContentSplit(Arrays.asList(searchContent.split(" "))); 
		
		for(String test : search.getContentSplit()) {
			
			log.info(test);
		}
		
	}
	
	@Test
	@Ignore
	public void categoryInfoTest() throws Exception {
		
		CategoryVO categoryInfo = dao.categoryInfo(1);
		
		log.info(categoryInfo);
	}
	
	@Test
	public void updateReplyCnt() throws Exception {
		
		dao.updateReplyCount(2260, -1);
		
	}

}
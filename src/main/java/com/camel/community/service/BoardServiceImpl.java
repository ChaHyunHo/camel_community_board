package com.camel.community.service;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.camel.community.Utils.XssFiter;
import com.camel.community.dao.BoardDAO;
import com.camel.community.dao.BoardLikeDAO;
import com.camel.community.dao.ReplyDAO;
import com.camel.community.dao.UserDAO;
import com.camel.community.domain.BoardVO;
import com.camel.community.domain.CategoryVO;
import com.camel.community.domain.LikeVO;
import com.camel.community.domain.ReplyVO;
import com.camel.community.domain.SearchBoard;
import com.camel.community.domain.Standard;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired private BoardDAO boardDao;
	
	@Autowired private ReplyDAO replyDAO;
	
	@Autowired private UserDAO userDao;
	
	@Autowired private BoardLikeDAO boardLikeDao;

	@Override
	public void create(BoardVO vo) throws Exception {
		
		boardDao.create(XssFiter.xssBoardFilter(vo));
	}

	@Override
	public BoardVO read(Integer boardNumber) throws Exception {
		
		return boardDao.read(boardNumber);
	}

	@Override
	public int update(BoardVO vo) throws Exception {
	
		return boardDao.update(XssFiter.xssBoardFilter(vo));
	}

	@Override
	@Transactional
	public HashMap<String, Integer> delete(Integer boardNumber) throws Exception {
		
		HashMap<String, Integer> result = new HashMap<>(); 
		
		result.put("boardCode", boardDao.redirectBoardCode(boardNumber));
		
		// 게시글 추천 삭제
		boardLikeDao.likeBoardTotalDelete(boardNumber);
		
		// 게시판에 있던 댓글을 가져와  use_yn = "N" 삭제 작업
		List<ReplyVO> replyDeleteList =  replyDAO.simpleList(boardNumber);
		
		for(ReplyVO reply : replyDeleteList) {
			
			replyDAO.delete(reply.getReplyNumber());
			
		}
		
		result.put("success", boardDao.delete(boardNumber));
		
		return result;
	}

	@Override
	public List<BoardVO> listAll() throws Exception {
		
		return boardDao.listAll();
	}

	@Override
	public List<BoardVO> detailList(int code) throws Exception {
		return boardDao.detailList(code);
	}

	@Override
	public List<BoardVO> listpage(SearchBoard std) throws Exception {
		return boardDao.listpage(std);
	}

	@Override
	public int totalBoardCount(Standard std) throws Exception {
		return boardDao.totalBoardCount(std);
	}
	
	/**
	 * 화면단에서 가지고온 newCount번호를 이전글 번호와 다음글 번호로 만들어 변수에담는다 
	 * DB에서 해당 카테고리 및 검색해서 가지고온 리스트들 중에서 newCount와 동일한 번호의
	 * 객체를 HashMap으로 담아서 key로 구분하여 각각 prev, next로 만들었다.
	 * 맵으로 담은 객체를 컨트롤러에 넘겨준다.
	 */
	
	@Override
	public HashMap<String,Object> prevAndNextBoardRead(Integer newCount, Standard std) throws Exception {
		
		HashMap<String, Object> prevAndNext = new HashMap<>();
		
		Integer prevNumber = newCount + 1;
		
		Integer nextNumber = newCount - 1;
		
		List<BoardVO> list = boardDao.prevAndNextBoardRead(std);
		
		for(BoardVO boardVO : list) {
			
			if(prevNumber.equals(boardVO.getNewCount())) {
				prevAndNext.put("prev", boardVO);
			}
			
			if(nextNumber.equals(boardVO.getNewCount())) {
				prevAndNext.put("next", boardVO);
			}
		}
		return prevAndNext;
	}
	
	
	/**
	 * 검색어에 내용중 띄어진 부분을 하나의 단어 키워드로 생각하고 모두 검색한다.
	 */
	@Override
	@Transactional
	public HashMap<String, Object> listSearchPage(SearchBoard std, String username) throws Exception {
		
		HashMap<String, Object> map = new HashMap<>();
		
		if(username != "") {
			map.put("userInfo", userDao.read(username));
		}
		
		String searchContent = std.getSearchContent();
		
		std.setContentSplit(Arrays.asList(searchContent.split(" "))); 
		
		map.put("boardList", boardDao.listSearchPage(std));
		
		return map;
	}

	@Override
	public int totalSearchBoardCount(SearchBoard std) throws Exception {
		return boardDao.totalSearchBoardCount(std);
	}

	@Override
	public CategoryVO categoryInfo(Integer boardCode) throws Exception {
		return boardDao.categoryInfo(boardCode);
	}

	@Override
	public void boardViewCountUpdate(Integer boardNumber) throws Exception {
		boardDao.boardViewCountUpdate(boardNumber);
	}

	@Override
	@Transactional
	public HashMap<String, Integer> boardGoodAndBad(LikeVO vo) throws Exception {
		HashMap<String , Integer> likeInfo = new HashMap<>();
		
		if(vo.getStatus().equals("G")) {
			
			likeInfo = likeCommon(vo, vo.getStatus());
			
		} else if (vo.getStatus().equals("B")) {
			
			likeInfo = likeCommon(vo, vo.getStatus());
		}
		return likeInfo;
	}
	
	
	/**
	 * 컨트롤러에서 들어온 LikeVO의 status G, B 로 분기하여 LikeVO정보를 DB에서  List로
	 * 가지고온다. 가지고온 리스트 아이디 중에 만약 SecurityContextHolder에서 가지고온 아이디 정보와
	 * 같다면 이미 데이터가 있는 것이므로 해당 정보를 삭제해준다. 만약 없다면 vo의 정보를 데이터에 삽입해준다.
	 * 번외로 ex) 만약 추천을 누를경우 이미 비추천이 눌러저 있다면 !like.getStatus().equals(status) 이쪽으로
	 * 분기하여 status G로 업데이트 시켜준다. 모든 결과는 likeInfo  HashMap(totalInfo 메서드이용)에 담아 컨트롤러로 보내준다.
	 * @param vo
	 * @param status
	 * @return
	 * @throws Exception
	 */
	public HashMap<String , Integer> likeCommon(LikeVO vo, String status) throws Exception {
		HashMap<String , Integer> likeInfo = new HashMap<>();
		
		List<LikeVO> likeList = boardLikeDao.likeList(vo.getBoardNumber());
		
		boolean flag = true;
		
		for(LikeVO like : likeList) {
			if(like.getUserId().equals(vo.getUserId())) {
				if(!like.getStatus().equals(status)) {
					boardLikeDao.update(vo);
					
					likeInfo = totalInfo(vo);
					
					flag = false;
					break;
				} else {
					boardLikeDao.remove(vo);
					
					likeInfo = totalInfo(vo);
					
					flag = false;
					break;
				}
			}
		}
			
		if(flag) {
			boardLikeDao.create(vo);
			likeInfo = totalInfo(vo);
		}
		
		return likeInfo;
	}
	
	/**
	 * likeCommon이후 DB에서 최종적으로 추천과 비추천 정보를 가지고와서
	 * 게시판에 추천 비추천을 업데이트 시켜주고 게시물에서 정보를 가지고와  goodTotalCount,badTotalCount로
	 * 맵에 담아 컨트롤러에 보내준다.
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	private HashMap<String, Integer> totalInfo(LikeVO vo) throws Exception {
		HashMap<String , Integer> map = new HashMap<>();
		
		int totalGood = boardLikeDao.likeGoodTotalCount(vo.getBoardNumber());
		int totalBad  = boardLikeDao.likeBadTotalCount(vo.getBoardNumber());
		
		boardDao.boardGoodUpdate(totalGood, vo.getBoardNumber());
		boardDao.boardBadUpdate(totalBad, vo.getBoardNumber());
		BoardVO board = boardDao.read(vo.getBoardNumber());
		
		map.put("goodTotalCount", board.getBoardGoodCount());
		map.put("badTotalCount", board.getBoardBadCount());
		
		return map;
		
	}

	@Override
	public HashMap<String, Object> totalSearchPage(SearchBoard std, String username) throws Exception {
		HashMap<String, Object> map = new HashMap<>();
		
		std.setSort("search");
		std.setSearchOption("TCW");
		std.setSearchOrAnd("or");
		
		if(username != "") {
			map.put("userInfo", userDao.read(username));
		}
		
		String searchContent = std.getSearchContent();
		
		std.setContentSplit(Arrays.asList(searchContent.split(" "))); 
		
		List<BoardVO> boardList = boardDao.totalSearchPage(std);
		
		for(BoardVO board : boardList) {
			
			log.info(board.getBoardTitle());
		}
		
		map.put("boardList", boardDao.totalSearchPage(std));
		
		return map;
	}

}

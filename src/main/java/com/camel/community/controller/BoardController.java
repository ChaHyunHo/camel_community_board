package com.camel.community.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.camel.community.domain.BoardVO;
import com.camel.community.domain.LikeVO;
import com.camel.community.domain.PageDTO;
import com.camel.community.domain.SearchBoard;
import com.camel.community.domain.Standard;
import com.camel.community.domain.UserVO;
import com.camel.community.service.BoardService;
import com.camel.community.service.UserService;
import com.mysql.cj.util.StringUtils;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/cbp/*") // community board page
public class BoardController {

	@Autowired
	private BoardService boardService;

	@Autowired
	private UserService userService;

	/* 카테고리별 게시판 리스트 */
	@GetMapping("/blp")
	public String index(SearchBoard std, Model model, @RequestParam("code") int code, Principal pinfo)
			throws Exception {
		String userName = "";

		HashMap<String, Object> map;

		if (pinfo != null) {
			userName = pinfo.getName();
			map = boardService.listSearchPage(std, userName);
		} else {
			map = boardService.listSearchPage(std, userName);
		}

		std.setCode(code);

		if (map.get("boardList") != null) {
			model.addAttribute("boardList", map.get("boardList"));
		}

		if (map.get("userInfo") != null) {
			model.addAttribute("userInfo", map.get("userInfo"));
		}

		model.addAttribute("category", boardService.categoryInfo(code));

		PageDTO pageDTO = new PageDTO(std, boardService.totalSearchBoardCount(std));

		model.addAttribute("std", std);
		model.addAttribute("pageInfo", pageDTO);

		return "cbp/blp";
	}

	/* 게시글 등록 */
	@PostMapping("/bcp")
	@PreAuthorize("isAuthenticated()")
	public String boardRegister(BoardVO vo, RedirectAttributes rttr) throws Exception {

		boardService.create(vo);

		rttr.addFlashAttribute("bcpSuccess", "bcpSuccess");

		return "redirect:/cbp/blp?code=" + vo.getBoardCode();
	}

	@GetMapping("/bcp")
	@PreAuthorize("isAuthenticated()")
	public String boardRegisterGet(@RequestParam("code") Integer code, Model model, Principal pinfo) throws Exception {
		String userName = "";

		if (pinfo != null) {
			userName = pinfo.getName();
			UserVO userInfo = userService.read(userName);

			model.addAttribute("userInfo", userInfo);
		}

		model.addAttribute("code", code);

		return "cbp/bcp";
	}

	/* 게시글 조회 */
	@GetMapping("/brp")
	public String boardRead(SearchBoard std, @RequestParam("boardNumber") Integer boardNumber,
			@RequestParam("code") int code, Model model, HttpServletRequest req, HttpServletResponse res,
			Principal pinfo) throws Exception {
		Cookie[] cookies = req.getCookies();

		HashMap<String, String> viewMap = new HashMap<>();

		if (cookies != null && cookies.length > 0) {

			for (Cookie ck : cookies) {

				viewMap.put(ck.getName(), ck.getValue());
			}
		}

		String cookieCount = viewMap.get("vwce");
		String newCookieCount = "|" + boardNumber;

		if (StringUtils.indexOfIgnoreCase(cookieCount, newCookieCount) == -1) {
			Cookie cookie = new Cookie("vwce", cookieCount + newCookieCount);
			cookie.setMaxAge(60 * 60 * 24);
			cookie.setPath("/");
			res.addCookie(cookie);

			boardService.boardViewCountUpdate(boardNumber);
		}

		String userName = "";

		HashMap<String, Object> map;

		if (pinfo != null) {
			userName = pinfo.getName();
			map = boardService.listSearchPage(std, userName);
		} else {
			map = boardService.listSearchPage(std, userName);
		}

		if (map.get("userInfo") != null) {
			model.addAttribute("userInfo", map.get("userInfo"));
		}

		Integer newCount = Integer.parseInt(req.getParameter("newCount"));

		String sort = req.getParameter("sort");

		std.setCode(code);

		BoardVO boardRead = boardService.read(boardNumber);

		List<BoardVO> boardList = (List<BoardVO>) map.get("boardList");

		HashMap<String, Object> prevAndNextObject = boardService.prevAndNextBoardRead(newCount, std);

		model.addAttribute("category", boardService.categoryInfo(code));
		model.addAttribute("prev", prevAndNextObject.get("prev"));
		model.addAttribute("next", prevAndNextObject.get("next"));
		model.addAttribute("code", code);
		model.addAttribute("boardList", boardList);
		model.addAttribute("boardRead", boardRead);

		PageDTO pageDTO = new PageDTO(std, boardService.totalSearchBoardCount(std));

		model.addAttribute("pageInfo", pageDTO);

		return "cbp/brp";
	}

	/* 게시글 수정 */
	@GetMapping("/bmp")
	@PreAuthorize("principal.username == #boardWriter")
	public void boardModifyGet(@RequestParam("boardNumber") Integer boardNumber, Model model,
			@ModelAttribute("std") SearchBoard std, String boardWriter, Principal pinfo) throws Exception {
		String userName = "";

		if (pinfo != null) {
			userName = pinfo.getName();
			UserVO userInfo = userService.read(userName);

			model.addAttribute("userInfo", userInfo);
			model.addAttribute("std", std);
		}

		model.addAttribute("boardRead", boardService.read(boardNumber));
	}

	/**
	 * 게시글 변경 POST
	 * 
	 * @param vo
	 * @param rttr
	 * @param std
	 * @return
	 * @throws Exception
	 */
	@PreAuthorize("principal.username == #vo.boardWriter")
	@PostMapping("/bmp")
	public String boardModify(BoardVO vo, RedirectAttributes rttr, Standard std) throws Exception {

		int update = boardService.update(vo);

		if (update == 1) {

			rttr.addFlashAttribute("updateSuccess", "updateSuccess");
		}

		return "redirect:/cbp/blp?code=" + std.getCode() + "&page=" + std.getPage() + "&perPageNum="
				+ std.getPerPageNum();
	}

	/* 게시글 삭제 */
	@PreAuthorize("principal.username == #boardWriter")
	@PostMapping("/bdp")
	public String boardDelete(@RequestParam("boardNumber") int boardNumber, RedirectAttributes rttr, Standard std,
			String boardWriter) throws Exception {

		HashMap<String, Integer> deleteResult = boardService.delete(boardNumber);

		if (deleteResult.get("success") == 1) {
			rttr.addFlashAttribute("deleteSuccess", "deleteSuccess.");
		}

		return "redirect:/cbp/blp?code=" + std.getCode() + "&page=" + std.getPage() + "&perPageNum="
				+ std.getPerPageNum();
	}

	@ResponseBody
	@PostMapping("/like")
	@PreAuthorize("isAuthenticated()")
	public HashMap<String, Integer> like(@RequestBody LikeVO vo, Principal pinfo) throws Exception {
		HashMap<String, Integer> likeInfo = null;
		String username = SecurityContextHolder.getContext().getAuthentication().getName().toString();
		
		vo.setUserId(username);
		
		likeInfo = boardService.boardGoodAndBad(vo);
		
		return likeInfo;
	}
	
	@GetMapping("/search")
	public String allSearch(SearchBoard std, Model model, Principal pinfo) throws Exception {
		String userName = "";

		HashMap<String, Object> map;
		
		if (pinfo != null) {
			userName = pinfo.getName();
			map = boardService.totalSearchPage(std, userName);
		} else {
			map = boardService.totalSearchPage(std, userName);
		}

		if (map.get("boardList") != null) {
			model.addAttribute("boardList", map.get("boardList"));
		}

		if (map.get("userInfo") != null) {
			model.addAttribute("userInfo", map.get("userInfo"));
		}
		
		PageDTO pageDTO = new PageDTO(std, boardService.totalSearchBoardCount(std));
		
		model.addAttribute("std", std);
		model.addAttribute("pageInfo", pageDTO);

		return "cbp/search";
	}

}

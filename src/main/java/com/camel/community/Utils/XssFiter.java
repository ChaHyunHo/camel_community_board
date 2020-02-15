package com.camel.community.Utils;

import com.camel.community.domain.BoardVO;
import com.camel.community.domain.ReplyVO;

public class XssFiter {
	
	public static BoardVO xssBoardFilter(BoardVO vo) throws Exception {
		
		String boardTitle = vo.getBoardTitle().replaceAll("<","&lt;");
		boardTitle.replaceAll(">","&gt;"); 
		boardTitle.replaceAll("\\n","<br/>");
		vo.setBoardTitle(boardTitle);
		
		String boardWriter = vo.getBoardWriter().replaceAll("<","&lt;");
		boardWriter.replaceAll(">","&gt;"); 
		boardWriter.replaceAll("\\n","<br/>");
		vo.setBoardWriter(boardWriter);
		
		/* 스마트 에디터 이미 적용
		 * String boardContent = vo.getBoardContent().replaceAll("<","&lt;");
		 * boardContent.replaceAll(">","&gt;"); boardContent.replaceAll("\\n","<br/>");
		 * vo.setBoardContent(boardContent);
		 */
		
		return vo;
	}
	
	public static ReplyVO xssReplyFilter(ReplyVO vo) {
			
			String replyContent = vo.getReplyContent().replaceAll("<","&lt;");
			replyContent.replaceAll(">","&gt;"); 
			replyContent.replaceAll("\\n","<br/>");
			vo.setReplyContent(replyContent);
			
			return vo;
		}

}

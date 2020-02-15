$(document).ready(function() {
	/* 게시글 등록시 모델로 내려온 boardNum  */
	var boardCreatSuccess = '${bcpSuccess}';


	/* 모달 검색창에 폼값이 전달이x 제이쿼리로 페이지정보와 code값을 보내준다  */
	
	var searBoardForm = $("#searchBoardForm");
	
	$("#searchBoardBtn").on("click", function(e) {

		//  카테고리 정보
		searBoardForm.append("<input type='hidden' name='code' value='${code}'>");

		// 페이지 정보
		searBoardForm.append("<input type='hidden' name='page' value='${pageInfo.std.page}'>");
		searBoardForm.append("<input type='hidden' name='perPageNum' value='${pageInfo.std.perPageNum}'>");
		
		searBoardForm.submit();

		
	});
	
	if(boardCreatSuccess == "bcpSuccess") {
		alert( "등록이 완료 되었습니다.");
		
	}
	
	
});
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp" %>

<!-- 메인 영역 -->
<div class="container" style="margin-top: 15px;">
	<div class="row" style="height: auto !important;">
		<div class="col-md-9" >

			<!-- best board list -->
			<div class="board-list-head">
				<span class="list-title"><i class="fas fa-search"></i>전체 검색</span>
				<span class="pull-right nav-name">
						<b><i class="fas fa-home"></i> home <i class="fas fa-angle-right"></i> search </b>
				</span>
			</div>
			
			<!-- 게시판 리스트 -->
			<section class="board-list-body">
				<div class="board-list-wrap">
					<form class="boardform" id="boardform" action="/"
						method="post" name="boardform">
						
						<div class="board-list-margin">
							
							<!-- 게시판 리스트 상단 타이틀 -->
							<div class="board-list-title div-list-tile">
								<!-- <span class="board-num">번호</span> -->
								<span class="board-title">제목</span>
								<span class="board-name">이름</span>
								<span class="board-date">날짜</span>
								<span class="board-view">조회</span>
								<span class="board-good">추천</span>
								<span class="board-bad">비추</span>
							</div>	
							
							<c:if test="${pageInfo.total eq 0}">
								<div style="font-size: 12px; text-align: center; margin-top: 60px; color: rgba(0, 0, 0, 0.632); ">
									검색 결과 없습니다.
								</div>		
							</c:if>

							<!-- 게시판 리스트 body -->
							<ul class="board-list-ul-body">
								<c:forEach items="${boardList}"  var="board">
									<li class="board-list-li">
										<input class="boardNum" type="hidden" name="boardNumber" value="${board.boardNumber }" />
										<%-- <div class="board-num"><c:out value="${board.newCount}" /> </div> --%>
										<div class="board-title">
											<a href="/cbp/brp?code=${board.boardCode}&page=${std.page}&perPageNum=${std.perPageNum}
											&boardNumber=${board.boardNumber}&newCount=${board.newCount}&sort=reset">
											<span class="pull-right" style="color:rgb(255, 130, 71); margin-right:13px" >
												<i class="far fa-comments"></i>
												<span id="commentcnt">
													<c:out value="${board.boardReplyCount}" />
												</span>
											</span>
											<span id="boardTitle"><c:out value="${board.boardTitle}" escapeXml="false" />
											<span style="color:coral;"><b>[<c:out value="${board.boardTypeName}" escapeXml="false" />]</b></span>  </span>
											</a>
											<!-- 모바일 버전 리스트 -->
											<div class="mobile-board-title">
												<span> <c:out value="${board.userNickname}"  escapeXml="false"/></span>
												<span><i class="far fa-eye"></i> <c:out value="${board.boardViewCount}" /></span>
												<span><i class="far fa-thumbs-up"></i> <c:out value="${board.boardGoodCount}" /></span>
												<span><i class="far fa-thumbs-down"></i> <c:out value="${board.boardBadCount}" /></span>
												<span><i class="far fa-clock"></i> <fmt:formatDate pattern="yyyy.MM.dd" value="${board.boardRegisterDate}"/> </span>
											</div>
										</div>
										<div class="board-name"> <c:out value="${board.userNickname}"  escapeXml="false"/></div>
										<div class="board-date"><fmt:formatDate pattern="yyyy.MM.dd" value="${board.boardRegisterDate}"/></div>
										<div class="board-view"> <c:out value="${board.boardViewCount}" /></div>
										<div class="board-good"> <c:out value="${board.boardGoodCount}" /></div>
										<div class="board-bad"> <c:out value="${board.boardBadCount}" /></div>
									</li>
								</c:forEach>	
									
							</ul>
						</div>
						
						<div class="board-list-last" style="width: auto; height: 45px;"">
							
						</div>
						<!-- pagination -->
						
						<nav aria-label="Page navigation example">
							<ul class="pagination justify-content-center pagination-sm custompagination">

							  <c:if test="${pageInfo.prev}">
							  	<li class="page-item">
								<a class="page-link" href="/cbp/search${pageInfo.listQuery(pageInfo.startPage - 1)}" aria-label="Previous">
								  <span aria-hidden="true">&laquo;</span>
								</a>
							  	</li>
							  </c:if>
							  
							  <c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage}" var="index">
							  	<li class="page-item <c:out value="${pageInfo.std.page == index?'active' : '' }"/>">
							  		<a class="page-link"  
							  		href="/cbp/search?searchContent=${std.searchContent}&page=${index}&perPageNum=${std.perPageNum}">${index}</a>
							  	</li>
							  </c:forEach>
							  
							  
							  
							  <c:if test="${pageInfo.next && pageInfo.endPage > 0}">
							  	<li class="page-item">
								<a class="page-link" href="/cbp/search${pageInfo.listQuery(pageInfo.endPage + 1)}" aria-label="Previous">
								  <span aria-hidden="true">&raquo;</span>
								</a>
							  	</li>
							  </c:if>
							  
							</ul>
						  </nav>
					
						<!-- end pagination -->
					</form>
					
				
					</div>
			</section>
		</div>
		<!-- end col-md-9  -->
		
		<div class="col-md-3 main-login" style="height: auto !important; min-height: 0px !important;">
			<!-- login form -->
			<jsp:include page="/WEB-INF/views/include/mainloginform.jsp"></jsp:include>
			<!-- end login form -->

			<!-- 이미지 광고 배너 -->
			<div class="adver" 
			style="background-color: rgba(253, 184, 253, 0.769); 
			border: rgb(50, 255, 132) 1px solid; height: 500px; width: 100%; margin-bottom: 20px; margin-top: 10px">
				<div style="margin-left: 5px; margin-top: 5px; font-size: 10px;">
					광고 배너
				</div> 
			</div>
			<!-- end 이미지 광고 배너 -->
		</div>
		<!-- end col-md-3 -->
	</div>
</div>
<!-- end 메인 영역 -->
	
<%@ include file="../include/footer.jsp" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

 
<script>

	$(document).ready(function() {

		var searchContent = "<c:out value='${std.searchContent}'/>";
		console.log(searchContent);

		// 게시글 등록시 모델로 내려온 success 정보  
		var boardCreatSuccess = '<c:out value="${bcpSuccess}"/>';
		var boardUpdateSuccess = '<c:out value="${updateSuccess}"/>';
		var boardDeleteSuccess = '<c:out value="${deleteSuccess}"/>';
		
		successAlter(boardCreatSuccess);
		successAlter(boardUpdateSuccess);
		successAlter(boardDeleteSuccess);
		
		history.replaceState({},null,null);

		function successAlter(success) {
			if(success === '' || history.state) {
				return;
			}

			if(success == "bcpSuccess") {
				alert( "등록이 완료 되었습니다.");
			} else if (success == "updateSuccess" ) {
				alert( "변경이 완료 되었습니다.");
			} else if (success == "deleteSuccess") {
				alert( "삭제 되었습니다.");
			}
		}
	
	});
</script>


<!-- 최상단 lnb mainlnb.js  -->
<script src="/resources/assets/js/mainlnb.js"></script>
<!--  bootstrap.bundle.js  -->
<script src="/resources/assets/js/bootstrap.bundle.js"></script>
<!--  bootstrap.bundle.min.js  -->
<script src="/resources/assets/js/bootstrap.bundle.min.js"></script>
<!--  Bootstrap Js  -->
<script src="/resources/assets/js/bootstrap.js"></script>
<!--  bootstrap.min.js  -->
<script src="/resources/assets/js/bootstrap.min.js"></script>
</body>
</html>
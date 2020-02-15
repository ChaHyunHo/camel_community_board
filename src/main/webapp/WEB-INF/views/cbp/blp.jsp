<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- <%@ include file="../include/header.jsp" %> --%>

<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

<!-- 메인 영역 -->
<div class="container" style="margin-top: 15px;">
	<div class="row" style="height: auto !important;">
		<div class="col-md-9" >
			
			<!-- 이미지 광고 배너 -->
			<div class="adver" 
			style="background-color: rgba(253, 184, 253, 0.769); 
			border: rgb(50, 255, 132) 1px solid; height: 220px; width: 100%; margin-bottom: 20px;">
				<div style="margin-left: 5px; margin-top: 5px; font-size: 10px;">
					광고 배너
				</div> 
			</div>
			<!-- end 이미지 광고 배너 -->

			<!-- best board list -->
			<div class="board-list-head">
				<span class="list-title"><c:out value="${category.boardTypeName}" /></span>
				<span class="pull-right nav-name">
						<b><i class="fas fa-home"></i> home <i class="fas fa-angle-right"></i> <c:out value="${category.typeSimple}" /> </b>
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
								<span class="board-num">번호</span>
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
										<div class="board-num"><c:out value="${board.newCount}" /> </div>
										<div class="board-title">
											<a 
											href="/cbp/brp${pageInfo.listQuery(pageInfo.std.page)}
											&boardNumber=${board.boardNumber}&newCount=${board.newCount}&sort=${pageInfo.std.sort}">
											<span class="pull-right" style="color:rgb(255, 130, 71); margin-right:13px" >
												<i class="far fa-comments"></i>
												<span id="commentcnt">
													<c:out value="${board.boardReplyCount}" />
												</span>
											</span>
											<c:out value="${board.boardTitle}" escapeXml="false" />
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
							<div class="form-group pull-right">
								<div class="btn-group dropup" role="group">
									<ul class="dropdown-menu custom-drop-menu" role="menu" aria-labelledby="listsort">
										<li>
											<a href="#" onclick='return false'><i class="far fa-clock"></i> 날짜순</a> 
										</li>
										<li>
											<a href="#" onclick='return false'><i class="far fa-eye"></i> 조회순</a> 
										</li>
										<li>
											<a href="#"onclick='return false'><i class="far fa-thumbs-up"></i> 추천순</a> 
										</li>
										<li>
											<a href="#" onclick='return false'><i class="far fa-thumbs-down"></i> 비추순</a> 
										</li>
										<li>
											<a href="#" onclick='return false'><i class="far fa-comments"></i> 댓글순</a> 
										</li>
									</ul>

									<a href="#" id="listsort"  role="button" class="btn btn-sm rounded-0" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
									style="background-color: rgb(103, 103, 238); color: white; font-size: 12px;">
									<i class="fa fa-sort"></i> 정렬
									</a>
								</div>
							</div>
							<div class="pull-left">
									<a href="#" id="listsort"  role="button" class="btn btn-sm rounded-0" data-toggle="modal" data-target="#searchModal"
									style="background-color: rgb(103, 103, 238); color: white; font-size: 11px;">
									<i class="fas fa-search"></i> 검색
									</a> 
									<sec:authorize access="isAuthenticated()">
										<a href="/cbp/bcp?code=${pageInfo.std.code}" id="listsort" role="button"
										class="btn btn-sm rounded-0"
										style="background-color: rgb(103, 103, 238); color: white; font-size: 11px;">
										<i class="fas fa-pencil-alt"></i> 글쓰기
										</a>
									</sec:authorize>
									
							</div>
						</div>
						<!-- pagination -->
						
						<nav aria-label="Page navigation example">
							<ul class="pagination justify-content-center pagination-sm custompagination">

							  <c:if test="${pageInfo.prev}">
							  	<li class="page-item">
								<a class="page-link" href="/cbp/blp${pageInfo.listQuery(pageInfo.startPage - 1)}&sort=${pageInfo.std.sort}" aria-label="Previous">
								  <span aria-hidden="true">&laquo;</span>
								</a>
							  	</li>
							  </c:if>
							  
							  <c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage}" var="index">
							  	<li class="page-item <c:out value="${pageInfo.std.page == index?'active' : '' }"/>">
							  		<a class="page-link"  href="/cbp/blp${pageInfo.listQuery(index)}&sort=${pageInfo.std.sort}">${index}</a>
							  	</li>
							  </c:forEach>
							  
							  
							  
							  <c:if test="${pageInfo.next && pageInfo.endPage > 0}">
							  	<li class="page-item">
								<a class="page-link" href="/cbp/blp${pageInfo.listQuery(pageInfo.endPage + 1)}&sort=${pageInfo.std.sort}" aria-label="Previous">
								  <span aria-hidden="true">&raquo;</span>
								</a>
							  	</li>
							  </c:if>
							  
							</ul>
						  </nav>
					
						<!-- end pagination -->
					</form>
					
					<!-- 검색 모달창 -->
						<div class="modal fade" id="searchModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog modal-sm" role="document">
							<div class="modal-content">
								<div class="modal-body">
									 <div style="text-align:left; margin-bottom: 20px;">
											<h5><b><i class="fa fa-search"></i> 검색</b></h5>
									 </div>
									<form id="searchBoardForm" class="form" action="/cbp/blp" method="get" role="form">
									<div class="row searchrow">
										<div class="col-xs-6 search-padding">
											<select id="searchOptionValue" name="searchOption" class="form-control rounded-0 custom-input-sm" >
												<option value="T" >제목</option>
												<option value="C">내용</option>
												<option value="W">이름</option>
												<option value="TC">제목+내용</option>
												<option value="CW">내용+이름</option>
												<option value="TCWw">제목+내용+이름</option>
											</select>
										</div>
										<div class="col-xs-6 search-padding">
											<select id="searchOrAndValue" name="searchOrAnd" class="form-control rounded-0 custom-input-sm" >
												<option value="and" selected >AND</option>
												<option value="or">OR</option>
											</select>
										</div>
									</div>
									<div class="form-row align-items-center" 
									style="margin-top: 10px; margin-left: 2px; width: 255px; margin-bottom: 10px;">
										<div class="col-sm-3 my-1">
											<label class="sr-only" for="inlineFormInputName">Name</label>
											<input name="searchContent" type="text" class="form-control rounded-0" id="searchContentValue"
											placeholder="검색해주세요." style="font-size: 13px; width: 245px;" maxlength="15">
										  </div>
									</div>

									<div class="row searchrow">
										<div class="col-xs-6 search-padding">
											<button id="searchBoardBtn" type="submit" class="btn btn-color btn-sm rounded-0">
												<i class="fas fa-search"></i> 찾기
											</button>
										</div>
										<div class="col-xs-6 search-padding">
											<button  data-dismiss="modal" class="btn btn-color btn-sm rounded-0">
												<i class="fas fa-times"></i> 닫기
											</button>
										</div>
									</div>
								</form> 
								</div>

							</div>
							</div>
						</div>
					<!-- end 모달 -->
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

var search = {

	$searchBoardForm : null,
	$searchBoardBtn : null,
	$searchModal : null,
	searchOptionValue : null,
	searchContentValue : null,
	searchOrAndValue : null,

	init : function() {
		this.$searchBoardForm = $("#searchBoardForm");
		this.$searchBoardBtn = $("#searchBoardBtn");
		this.$searchModal = $('#searchModal');
		this.searchOptionValue = "<c:out value="${pageInfo.std.searchOption}" />";
		this.searchContentValue = "<c:out value="${pageInfo.std.searchContent}" />";
		this.searchOrAndValue = "<c:out value="${pageInfo.std.searchOrAnd}" />";
		
	},

	searchEvent : function() {
		var objThis = this;

		this.$searchBoardBtn.on("click", function() {
			objThis.$searchBoardForm.append("<input type='hidden' name='code' value='<c:out value="${pageInfo.std.code}"/>'>");
			objThis.$searchBoardForm.append("<input type='hidden' name='perPageNum' value='<c:out value="${pageInfo.std.perPageNum}"/>'>");
			objThis.$searchBoardForm.submit();

		})
	},

	searchDataInfoFn : function() {
		var objThis = this;

		objThis.$searchModal.on('show.bs.modal', function(event) {
			if(objThis.searchOptionValue == "") {
				$("#searchOrAndValue").val("and").prop("selected", true);
				$("#searchOptionValue").val("T").prop("selected", true);
			} else if(objThis.searchOptionValue != "") {
				$("#searchOrAndValue").val(objThis.searchOrAndValue);
				$("#searchOptionValue").val(objThis.searchOptionValue).prop("selected", true);
			}

			  	$("#searchContentValue").val(objThis.searchContentValue);
		})
	}
}

var sort = {

		$sort_menu : null,
		searchOptionValue : null,
		searchContentValue : null,
		searchOrAndValue : null,
		sort : null,
		code : null,

		init : function() {
		
			this.$sort_menu = $(".custom-drop-menu li a");
			this.searchOptionValue = "<c:out value="${pageInfo.std.searchOption}" />";
			this.searchContentValue = "<c:out value="${pageInfo.std.searchContent}" />";
			this.searchOrAndValue = "<c:out value="${pageInfo.std.searchOrAnd}" />"; 
		},

		sortEvent : function() {
			
			console.log(this.$sort_menu);

			var objThis = this;

			this.$sort_menu.each(function() {
				
				$(this).on("click", function() {

					var sort =  new Array (	"날짜순", "조회순", "추천순", "비추순", "댓글순");
					var name =  new Array (	"date", "view", "good", "bad", "reply");
					var value = $(this).text().trim();
					var brpQuery = "<c:out value= "${pageInfo.std.brpQuery()}" />";
					
					brpQuery = brpQuery.split("amp;").join(""); 

					for(var i = 0; i < 5; i++) {
						
						if( value == sort[i]) {

							self.location = "/cbp/blp"
								+  brpQuery
								+ "&searchOption="
								+  objThis.searchOptionValue
								+ "&searchOrAnd="
								+  objThis.searchOrAndValue
								+ "&searchContent="
								+ objThis.searchContentValue
								+ "&sort="
								+ name[i]
								; 
						}
					}
				})
			})	
		}
	}


	$(document).ready(function() {

		search.init();
		search.searchEvent();
		search.searchDataInfoFn();

		// 정렬
		sort.init();
		sort.sortEvent();

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
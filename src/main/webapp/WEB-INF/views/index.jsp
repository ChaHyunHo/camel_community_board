<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- <%@ include file="include/header.jsp" %> --%>
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
	<!-- 메인 영역 -->
	<div class="container" style="margin-top: 15px;">
		<div class="row" style="height: auto !important;">
			<div class="col-md-9" >
				<div class="row">
					<div class="col-sm-6">
						<div class="main-list-head">
							<span><b>베스트</b></span>
							<span class="pull-right">
								<a class="main-list-go" href="/cbp/blp?code=1">
									<i class="fas fa-list"></i>
								</a>
							</span>
							<hr class="shadow rounded">
						</div>
						<div class="mian-list-title text-wrap">
							<ul class="board-title">
								<c:forEach items="${boardCode1}" var="board"  begin="0" end="6">
										<li>
											<a href="/cbp/brp?code=${board.boardCode}&boardNumber=${board.boardNumber}&newCount=${board.newCount}">
												<span class="pull-right" style="color:sienna" >
													<i class="far fa-comments"></i>
													<span id="commentcnt">
														+<c:out value="${board.boardReplyCount}" />
													</span>
												</span>
											<c:out value="${board.boardTitle}" escapeXml="false"/>
											</a>	
										</li>
								</c:forEach>
							</ul>
						</div>
					</div>

					<div class="col-sm-6">
						<div class="main-list-head">
							<span><b>유머</b></span>
							<span class="pull-right">
								<a class="main-list-go" href="#">
									<i class="fas fa-list"></i>
								</a>
							</span>
							<hr class="shadow rounded">
						</div>
						<div class="mian-list-title">
							<ul class="board-title">
								<c:forEach items="${boardCode2}" var="board" begin="0" end="6">
										<li>
											<a href="/cbp/brp?code=${board.boardCode}&boardNumber=${board.boardNumber}&newCount=${board.newCount}">
												<span class="pull-right" style="color:sienna" >
													<i class="far fa-comments"></i>
													<span id="commentcnt">
														+<c:out value="${board.boardReplyCount}" />
													</span>
												</span>
											<c:out value="${board.boardTitle}" escapeXml="false"/>
											</a>	
										</li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>

				<div class="row" >
					<div class="col-sm-6">
						<div class="main-list-head">
							<span><b>미스테리</b></span>
							<span class="pull-right">
								<a class="main-list-go" href="#">
									<i class="fas fa-list"></i>
								</a>
							</span>
							<hr class="shadow rounded">
						</div>
						<div class="mian-list-title">
							<ul class="board-title">
								<c:forEach items="${boardCode3}" var="board" begin="0" end="6">
										<li>
											<a href="/cbp/brp?code=${board.boardCode}&boardNumber=${board.boardNumber}&newCount=${board.newCount}">
												<span class="pull-right" style="color:sienna" >
													<i class="far fa-comments"></i>
													<span id="commentcnt">
														+<c:out value="${board.boardReplyCount}" />
													</span>
												</span>
											<c:out value="${board.boardTitle}" escapeXml="false" />
											</a>	
										</li>
								</c:forEach>
							</ul>
						</div>
					</div>

					<div class="col-sm-6">
						<div class="main-list-head">
							<span><b>익명</b></span>
							<span class="pull-right">
								<a class="main-list-go" href="#">
									<i class="fas fa-list"></i>
								</a>
							</span>
							<hr class="shadow rounded">
						</div>
						<div class="mian-list-title">
							<ul class="board-title">
								<c:forEach items="${boardCode4}" var="board" begin="0" end="6">
										<li>
											<a href="/cbp/brp?code=${board.boardCode}&boardNumber=${board.boardNumber}&newCount=${board.newCount}">
												<span class="pull-right" style="color:sienna" >
													<i class="far fa-comments"></i>
													<span id="commentcnt">
														+<c:out value="${board.boardReplyCount}" />
													</span>
												</span>
											<c:out value="${board.boardTitle}" escapeXml="false" />
											</a>	
										</li>
								</c:forEach>
							</ul>
						</div>
					</div>
					<!-- end col-sm-6 -->
				</div>
				<!-- end row -->

				<!-- 이미지 광고 배너 -->
				<div class="adver" 
				style="background-color: rgba(253, 184, 253, 0.769); 
				border: rgb(50, 255, 132) 1px solid; height: 220px; width: 100%; margin-bottom: 20px;">
					<div style="margin-left: 5px; margin-top: 5px; font-size: 10px;">
						광고 배너
					</div> 
				</div>
				<!-- end 이미지 광고 배너 -->

				<div class="row" style="margin-top: 20px;">
					<div class="col-sm-6">
						<div class="main-list-head">
							<span><b>연예인</b></span>
							<span class="pull-right">
								<a class="main-list-go" href="#">
									<i class="fas fa-list"></i>
								</a>
							</span>
							<hr class="shadow rounded">
						</div>
						<div class="mian-list-title">
							<ul class="board-title">
								<c:forEach items="${boardCode5}" var="board" begin="0" end="6">
										<li>
											<a href="/cbp/brp?code=${board.boardCode}&boardNumber=${board.boardNumber}&newCount=${board.newCount}">
												<span class="pull-right" style="color:sienna" >
													<i class="far fa-comments"></i>
													<span id="commentcnt">
														+<c:out value="${board.boardReplyCount}" />
													</span>
												</span>
											<c:out value="${board.boardTitle}" escapeXml="false" />
											</a>	
										</li>
								</c:forEach>
							</ul>
						</div>
					</div>

					<div class="col-sm-6">
						<div class="main-list-head">
							<span><b>고객</b></span>
							<span class="pull-right">
								<a class="main-list-go" href="#">
									<i class="fas fa-list"></i>
								</a>
							</span>
							<hr class="shadow rounded">
						</div>
						<div class="mian-list-title">
							<ul class="board-title">
								<c:forEach items="${boardCode6}" var="board" begin="0" end="6">
										<li>
											<a href="/cbp/brp?code=${board.boardCode}&boardNumber=${board.boardNumber}&newCount=${board.newCount}">
												<span class="pull-right" style="color:sienna" >
													<i class="far fa-comments"></i>
													<span id="commentcnt">
														+<c:out value="${board.boardReplyCount}" />
													</span>
												</span>
											<c:out value="${board.boardTitle}" escapeXml="false" />
											</a>	
										</li>
								</c:forEach>
							</ul>
						</div>
					</div>
					<!-- end col-sm-6 -->
				</div>
				<!-- end row -->
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

<%@ include file="include/footer.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script>

	$(document).ready(function() {

		/* 최상단 즐겨찾기 설명 */
		$("#favor").on("click",function() {

			alert("즐겨찾기를 하시려면 ctrl + D를 눌러주세요.");

		});

		/* 최상단 lnb 날짜 */
		var d = new Date();
		var month = (d.getMonth()+1)>9 ? ''+(d.getMonth()+1) : '0'+(d.getMonth()+1);
		var day = d.getDate()>9 ? ''+d.getDate() : '0'+d.getDate();
		var customDate = month +"월" + " " +day+"일"; 

		$("#nowDay").text(customDate);

		/* 사이드 네비바 open || off */
		$(".open-menu").on("click",function() {

			mysidenav("300px");
		});
		
		$(".closebtn").click(function() {

			mysidenav("0px");
		})
		
		function mysidenav(px) {
			$("#mysidenav").width(px);
		}


		/* 메인화면 li 항목 갯수 5개 제한하기  */
		
		
	});
</script>


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
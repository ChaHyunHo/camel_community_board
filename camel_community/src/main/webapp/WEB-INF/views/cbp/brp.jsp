<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<!-- 메인 영역 -->
	<div class="container" style="margin-top: 15px; height: auto !important;">
		<div class="row" style="height: auto !important;">
			<div class="col-md-9" >
				
				<!-- 이미지 광고 배너 -->
				<div class="adver" 
				style="background-color: rgba(253, 184, 253, 0.769); 
				border: rgb(50, 255, 132) 1px solid; height: 180px; width: 100%; margin-bottom: 20px;">
					<div style="margin-left: 5px; margin-top: 5px; font-size: 10px;">
						광고 배너
					</div> 
				</div>
				<!-- end 이미지 광고 배너 -->

				<!-- best board list -->
				<div class="board-detail-head">
					<span class="list-title"><c:out value="${category.boardTypeName}" /></span>
					<span class="pull-right nav-name">
							<b><i class="fas fa-home"></i> home <i class="fas fa-angle-right"></i> best </b>
					</span>	
					<hr>
				</div>
				<!-- 게시판 상세 페이지 -->

				<div class="board-detail-wrap">
					<section class="board-detail">
						<article class="board-detail-article">
							<h3 style="text-overflow: ellipsis; 
								white-space: nowrap; word-wrap: normal; overflow: hidden;">
								<span class="board-detail-title" ><c:out value="${boardRead.boardTitle}"  escapeXml="false"/></span>
							</h3>
							<div class="card card-default board-detail-panel rounded-0 shadow-sm" style="height: 50px;">
								<div class="card-heading">
									<span class="panel-id" style="margin-left: 8px;"><i class="fas fa-user"></i> <c:out value="${boardRead.userNickname}" escapeXml="false" /></span>
									<span class="panel-tag"><i class="fas fa-tag"></i> <c:out value="${category.boardTypeName}" /></span>
									<span class=""> <i class="fas fa-comments"></i> <c:out value="${boardRead.boardReplyCount}"/></span>
									<span><i class="fas fa-eye"></i> <c:out value="${boardRead.boardViewCount}"/></span>
									<span class="board-good"><i class="fas fa-thumbs-up"></i> <c:out value="${boardRead.boardGoodCount}"/></span>
									<span class="board-bad"><i class="fas fa-thumbs-down"></i> <c:out value="${boardRead.boardBadCount}"/></span>
								</div>
							</div>
							<div class="board-detail-content" style="height: auto; width:auto; margin-top: 30px;">
								<div class="board-detail-content-wrap" style="max-width:100%; height: auto; word-break: break-word; font-size: 13px;">
									<c:out value="${boardRead.boardContent}" escapeXml="false"/>
								</div>
							</div>
							<div class="goodorbad" style=" height: 60px; margin-bottom: 100px;">
								<span id="boardGoodBtn" class="board-detail-good">
									<a href="#" onclick='return false'>
										<b><c:out value="${boardRead.boardGoodCount}" escapeXml="false"/></b>
										<br>
										<i class="fa fa-thumbs-up"></i>
									</a>
								</span>
								<span id="boardBadBtn" class="board-detail-good">
									<a href="#" onclick='return false'>
										<b><c:out value="${boardRead.boardBadCount}" escapeXml="false"/></b>
										<br>
										<i class="fa fa-thumbs-down"></i>
									</a>
								</span>
							</div>
							<!-- 이전글 다음글 패널 -->
							<div class="card card-default rounded-0 nextPrvs" style=" height: 80px; font-size: 10px;">
								<span class="board-detail-next" >
								
									<c:if test="${prev.newCount ne null}">
										<a href="/cbp/brp${pageInfo.listQuery(pageInfo.std.page)}
										&boardNumber=${prev.boardNumber}&newCount=${prev.newCount}&sort=${pageInfo.std.sort}" style="font-size: 13px;">
											<i class="far fa-arrow-alt-circle-up" style="color: blue; font-weight:700;"> 이전글 :</i>  
											<span id="nextPrvs-title" >
											 <c:out value="${prev.boardTitle}" escapeXml="false" /> 
										</span>
										</a>
									</c:if> 
								</span>
								<span class="board-detail-prvs">
									<c:if test="${next.newCount ne null}">
										<a href="/cbp/brp${pageInfo.listQuery(pageInfo.std.page)}
										&boardNumber=${next.boardNumber}&newCount=${next.newCount}&sort=${pageInfo.std.sort}" style="font-size: 13px;">
											<i class="far fa-arrow-alt-circle-down" style="color: blue; font-weight:700;"> 다음글 :</i>  
											<span id="nextPrvs-title"> <c:out value="${next.boardTitle}" escapeXml="false" /></span> 
										</a>
									</c:if>
								</span>
							</div>
						</article>
					</section>
					<hr>

					<!-- comment -->
					<div class="board-detail-comment-wrap" style=" height: auto !important; margin-top: 50px;">
						<div class="board-detail-comment">
							<section class="board-detail-comment-section">
								<!-- best board list -->
								<div class="board-detail-head">
									<span class="list-title"> <i class="fas fa-comments"></i> Comment...</span>
									<hr>
								</div>
								<!-- end board list -->
								
								<div id="dynamicComment" ></div>
									
									<!-- pagination -->
									<div class="replyPaging" >
										
									</div>
								
									<!-- end pagination -->	
								  
								 
								  <div class="comment-input-wrap">
										<aside class="c_i_b">
											 <!-- 댓글 입력박스 -->
												<div class="commnet-wrap">
												<sec:authorize access="isAuthenticated()">
													<!-- 댓글 박스 -->
														<div class="comment-input-box">
															<div class="comment-input-box-title pull-left">
																<i class="fas fa-pencil-alt"></i> 댓글을 입력하기 ~
															</div>
															<div class="form-group rounded-0 comment-input-content">
																<div class="comment-input-content-cell">
																	<textarea tabindex="13" id="comment-input-content-wrap" name="replyContent" 
																	maxlength="1000" rows="5" class="form-control comment-input-sm rounded-0"  placeholder="내용을 입력해주세요."></textarea>
																</div>
																<div id="replyRegisterBtn" tabindex="14" class="comment-input-content-cell comment-input-submit">
																	등록
																</div>
															</div>
														</div>
														<!-- end 댓글 박스 -->
													</sec:authorize> 
													<sec:authorize access="isAnonymous()">
													<div class="card card-default rounded-0 nextPrvs" style=" height: 60px; ">
														<div style="text-align: center; padding-top: 15px; " >
															<a href="/loginform" style="font-size: 12px; text-align: center; text-decoration: none; color: black;">
																로그인한 회원만 댓글을 등록하실 수 있습니다.
															</a>
														</div>
													</div>
													</sec:authorize>					
												</div>
											<!-- wrtier, list, prvs, next -->
											<div class="board-detail-button-wrap pull-right" style="height: auto; margin-top:10px; margin-bottom: 20px;">
												<div class="btn-group" role="group">
													<c:if test="${prev.newCount ne null }">
														<a href="/cbp/brp${pageInfo.listQuery(pageInfo.std.page)}
														&boardNumber=${prev.boardNumber}&newCount=${prev.newCount}&sort=${pageInfo.std.sort}" 
															id="listsort" role="button" class="btn btn-sm rounded-0" 
															style="background-color: rgb(103, 103, 238); color: white; font-size: 11px; margin-right: 1.5px;">
														<i class="fas fa-arrow-circle-left"></i> 이전
													</a>
													</c:if>
													<c:if test="${next.newCount ne null }">
													<a href="/cbp/brp${pageInfo.listQuery(pageInfo.std.page)}
													&boardNumber=${next.boardNumber}&newCount=${next.newCount}&sort=${pageInfo.std.sort}" 
													id="listsort" role="button" class="btn btn-sm rounded-0" 
														style="background-color: rgb(103, 103, 238); color: white; font-size: 11px; margin-right: 1.5px;">
														<i class="fas fa-arrow-circle-right"></i> 다음
													</a>
													</c:if>
													
													<c:if test="${pageInfo.std.searchOrAnd eq 'or' || pageInfo.std.searchOrAnd eq 'and'}">
														<a href="/cbp/blp?code=${pageInfo.std.code}" id="listsort" role="button" class="btn btn-sm rounded-0" 
															style="background-color: rgb(103, 103, 238); color: white; font-size: 11px; margin-right: 1.5px;">
															<i class="fas fa-list-ul"></i> 목록
														</a>
													</c:if>
													<c:if test="${empty pageInfo.std.searchOrAnd}">
														<a href="/cbp/blp?code=${pageInfo.std.code}&page=${pageInfo.std.page}&perPageNum=${pageInfo.std.perPageNum}" id="listsort" role="button" class="btn btn-sm rounded-0" 
															style="background-color: rgb(103, 103, 238); color: white; font-size: 11px; margin-right: 1.5px;">
															<i class="fas fa-list-ul"></i> 목록
														</a>
													</c:if>
													
													<sec:authentication property="principal" var="pinfo"/>
													<sec:authorize access="isAuthenticated()"> 
														<a href="/cbp/bcp?code=${code}" id="listsort" role="button" class="btn btn-sm rounded-0" 
														style="background-color: rgb(103, 103, 238); color: white; font-size: 11px; margin-right: 1.5px;">
														<i class="fas fa-pencil-alt"></i> 글쓰기
														</a>
														
														<c:if test="${pinfo.username eq boardRead.boardWriter}">
																<a href="/cbp/bmp${pageInfo.listQuery(pageInfo.std.page)}&boardNumber=${boardRead.boardNumber}&boardWriter=${boardRead.boardWriter}" id="listsort" role="button" class="btn btn-sm rounded-0" 
																style="background-color: rgb(103, 103, 238); color: white; font-size: 11px; margin-right: 1.5px;">
																<i class="fas fa-pencil-alt"></i> 글수정
																</a>
														</c:if>
													</sec:authorize>
													
												</div>
											</div>
											<!-- end wrtier, list, prvs, next -->
										</aside>
								  </div>
							</section>
							<!-- 상세페이지 댓글 맨밑 버튼까지 section -->
						</div>
					</div>
					<!-- end content -->
				</div>
				<!-- end board-detail-wrap  -->
				<!-- 게시판 리스트 -->
				<section class="board-list-body">
					<div class="board-list-wrap">
						<form class="boardform" id="boardform" action="/"
							method="post" name="boardform">
							<input type="hidden" name="bno" id="bno"/>
							<input type="hidden" name="title" id="title"/>
							<input type="hidden" name="writer" id="writer"/>
							<input type="hidden" name="good" id="good"/>
							<input type="hidden" name="bad" id="bad"/>
							<input type="hidden" name="registerdate" id="registerdate"/>
							<input type="hidden" name="replycnt" id="replycnt"/>
							<input type="hidden" name="viewcnt" id="viewcnt"/>
							
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

								<!-- 게시판 리스트 body -->
								<ul class="board-list-ul-body">
							
								<c:forEach items="${boardList}"  var="board">
									<li class="board-list-li">
										<input class="boardNum" type="hidden" name="boardNumber" value="${board.boardNumber}" />
										<div class="board-num"><c:out value="${board.newCount}" /> </div>
										<div class="board-title">
											<a href="/cbp/brp${pageInfo.listQuery(pageInfo.std.page)}
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
												<span> <c:out value="${board.userNickname}" escapeXml="false" /></span>
												<span><i class="far fa-eye"></i> <c:out value="${board.boardViewCount}" /></span>
												<span><i class="far fa-thumbs-up"></i> <c:out value="${board.boardGoodCount}" /></span>
												<span><i class="far fa-thumbs-down"></i> <c:out value="${board.boardBadCount}" /></span>
												<span><i class="far fa-clock"></i> <fmt:formatDate pattern="yyyy.MM.dd" value="${board.boardRegisterDate}"/> </span>
											</div>
										</div>
										<div class="board-name"> <c:out value="${board.userNickname}" escapeXml="false"/></div>
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
												<a href="#" ><i class="far fa-clock"></i> 날짜순</a> 
											</li>
											<li>
												<a href="#"><i class="far fa-eye"></i> 조회순</a> 
											</li>
											<li>
												<a href="#"><i class="far fa-thumbs-up"></i> 추천순</a> 
											</li>
											<li>
												<a href="#"><i class="far fa-thumbs-down"></i> 비추순</a> 
											</li>
											<li class="">
												<a href="#" ><i class="far fa-comments"></i> 댓글순</a>
											</li>
									</ul>

										<a href="#" id="listsort"  role="button" class="btn btn-sm rounded-0 shadow-sm" 
											data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
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
									<div class="row searchrow">
										<div class="col-xs-6 search-padding">
											<select id="searchOptionValue" name="searchOption" class="form-control rounded-0 custom-input-sm" >
												<option value="T">제목</option>
												<option value="C">내용</option>
												<option value="W">이름</option>
												<option value="TC">제목+내용</option>
												<option value="CW">내용+이름</option>
												<option value="TCW">제목+내용+이름</option>
											</select>
										</div>
										<div class="col-xs-6 search-padding">
											<select id="searchOrAndValue" name="searchOrAnd" class="form-control rounded-0 custom-input-sm" >
												<option value="and">AND</option>
												<option value="or">OR</option>
											</select>
										</div>
									</div>
									<div class="form-row align-items-center" 
									style="margin-top: 10px; margin-left: 2px; width: 255px; margin-bottom: 10px;">
										<div class="col-sm-3 my-1">
											<label class="sr-only" for="inlineFormInputName">Name</label>
											<input id="searchContent" name="searchContent" type="text" class="form-control rounded-0"  
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
								</div>

							</div>
							</div>
						</div>
						<!-- end 모달 -->
						
						<!-- 모달 -->
						<div class="modal fade deleteModal" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
						 style="font-size: 11px;">
						  <div class="modal-dialog" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h5 class="modal-title" id="exampleModalLabel">삭제</h5>
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						          <span aria-hidden="true">&times;</span>
						        </button>
						      </div>
						      <div class="modal-body">
						        삭제하시면 복원 할 수 없습니다.
						      </div>
						      <div class="modal-footer">
						        <button id="replyDeleteBtn" type="button" class="btn btn-danger">삭제</button>
						        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
						      </div>
						    </div>
						  </div>
						</div>
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

var reply = {

	$dynamicComment : $,
	$replyRegisterBtn :null,
	$replyPaging : null,
	boardNumber : null,
	realPageNum : null,
	csrfHeaderName : null,
	csrfTokenValue : null,
	username : null,
	userId   : null,
	
	init : function() {
		this.$dynamicComment = $("#dynamicComment");
		this.$replyRegisterBtn = $("#replyRegisterBtn");
		this.$replyPaging = $(".replyPaging");
		this.csrfHeaderName = "${_csrf.headerName}";
		this.csrfTokenValue = "${_csrf.token}";
		this.boardNumber = "<c:out value="${boardRead.boardNumber}"/>";
		this.realPageNum = 1;
		<sec:authorize access="isAuthenticated()"> 
		this.username = "<c:out value='${userInfo.userNickname}'/>";
		this.userId = "<c:out value='${userInfo.userId}'/>";
		</sec:authorize>
	},
	
	// 댓글 시간
	
	replyTimeSet : function(timeValue) {
	
		var today = new Date();
		var gap = today.getTime() - timeValue;
		var dateObj = new Date(timeValue);
		var str = "";
		
		if(gap < (1000 * 60 * 60 * 24)) {
			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();
			
			return [ (hh > 9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0') + mi].join('');
		} else {
			
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth() + 1;
			var dd = dateObj.getDate();
			
			return [ yy, '/', (mm > 9 ? '' : '0') + mm, '/',
				(dd > 9 ? '' : '0') + dd].join('');
			
		}
	},
	
	// 댓글 리스트 메서드
	
	replyListFn : function(pageInfo) {
	
		var objThis = this;
	
		$.getJSON("/replies/list/" + this.boardNumber+"/"+ pageInfo || 1, function(data) {
	
			var items = "";
	
			$(data.replyList).each(function() {
				  for(var i = 0; i < 5; i++) {
						if( this.depth == i + 1) {
							items += "<div data-replyno='"+this.replyNumber+"' data-group='"+this.groupNumber+"' data-depth='"+this.depth+"'" 
							      +  " data-writer='"+this.replyWriter+"' data-nickname='"+this.userNickname+"'  class='media comment-media' style='margin-top: 25px; margin-left:"+ (i * 20) +"px;'>"
							      +  "<div class='profilefont'>"
								  +  "<i class='fas fa-user' style='margin-right: 15px;'></i>"
								  +  "</div>"
								  +  "<div class='media-body'>"
								  +  "<div class='media-heading comment-title'>"
								  +	 "<span style='font-weight: bold; '>"+this.userNickname+"</span>"
								  +	 "<span><i class='fas fa-clock'></i> "+reply.replyTimeSet(this.replyRegisterDate)+"</span>"
								  +	 "<div class='pull-right comment-heding-right'>"
								  +	 "<ul>"
								  +  "<sec:authorize access='isAuthenticated()'>" 
	
								  if(this.depth < 5) {
									  items += "<li id='replyTo'><a href='#' onclick='return false'>답변</a></li>";
								  }
	
								  if(objThis.userId == this.replyWriter) {
									  items += "<li id='replyMo'><a href='#' onclick='return false'>수정</a></li>";
									  items += "<li id='replyDe'><a href='#' onclick='return false'>삭제</a></li>";
								  }
						    items +=  "</sec:authorize>"			
								  +	 "<li id='replybad'><a href='#' onclick='return false'>신고</a></li>"		
								  +	 "</ul>"
								  +	 "</div>"
								  +  "</div>"
								  +  "<div class='media-content' style='margin-top: 10px; '>"
								  +	 this.replyContent
								  +  "<p></p>"
								  +	 "<div class='media-footer pull-right' style='height: 20px; background-color: silver;'>"
								  +	 "<div id='replyLikeBtn' class='card card-default shadow-sm rounded-0'>"	
								  +	 "<a href='#'><i class='fa fa-thumbs-up'></i> <span> "+this.replyGoodCount+"</span></a>"	
								  +	 "</div>"
								  +	 "</div>"
								  +  "</div>"
								  +  "</div>"
								  +  "</div>"
								  +  "<div class='comment_"+this.replyNumber+"'></div>"	
						}
					 }
			});
	
			reply.replyPageFn(data.pageDTO);
			objThis.$dynamicComment.html(items);
			objThis.$dynamicComment.children().eq(0).css("border-top","0px solid");
			$('html').animate({scrollTop : $(".board-detail-head").top}, 900);
		})
	
		
	},
	
	replyLastPageFn :function(page) {
	
		$.getJSON("/replies/list/" + this.boardNumber+"/"+ page || 1, function(data) {
	
			if( page == -1) {
				var realEndPage = data.pageDTO.realEnd;
	
				if(realEndPage == null || realEndPage == "") {
					realEndPage = 1;
				}
				reply.replyListFn(realEndPage);
			}
		});
	},
	
	// 댓글 생성
	replyRegisterFn : function() {
	
		var objThis = this;
	
		//  답변 버튼 (동적 태그(인풋박스) 생성)
		
		$(document).on("click","#replyTo", function() {
	
			var	replyNumber = $(this).parent().parent().parent().parent().parent().data("replyno");
			var	groupNumber = $(this).parent().parent().parent().parent().parent().data("group");
			var	depth = $(this).parent().parent().parent().parent().parent().data("depth");
			var $pageInfo = $(this).parent().parent().parent().parent().parent().parent().next().children().children().children();
			var ownPage = 0;
	
			$pageInfo.each(function() {
	
				if($(this).hasClass("active")) {
					ownPage = $(this).children().attr("href");
	
				}if($(this) == null || $(this) == "") {
					ownPage = 1;
				}
	
			})
	
			if(depth >= 5) {
				alert("더 이상 답변 하실 수 없습니다.");
				return false;
			} else {
	
				var str = "";
	
				str += "<div class='comment-input-box'>"
					+  "<div class='comment-input-box-title pull-left'>"
				    +  "<i class='fas fa-pencil-alt'></i> 매너있는 답변 부탁드립니다.~"
			        +  "</div>"
			        +  "<div class='form-group rounded-0 comment-input-content'>" 
				    +  "<div class='comment-input-content-cell'>"
					+  "<textarea tabindex='13' id='comment-input-content-wrap' name='replyContent' maxlength='1000' rows='5' class='form-control comment-input-sm rounded-0'  placeholder='내용을 입력해주세요.'></textarea>"
				    +  "</div>"
				    +  "<div id='dynamicReplyRegisterBtn' tabindex='14' class='comment-input-content-cell comment-input-submit'>" 
					+  "등록" 
				    +  "</div>" 
			        +  "</div>" 
		            +  "</div>" 
		        
				$(".comment-media").each(function() {
	
					if($(this).next().hasClass("checkBox")) {
						$(this).next().removeClass("checkBox");
						$(".comment-input-box").hide();
					}
					
				})
				
				$(".comment_"+replyNumber).addClass("checkBox");
				$(".comment_"+replyNumber).html(str);
	
				if($(".commnet-wrap").hasClass("comment-hide")) {
					 return;
				} else {
					$(".commnet-wrap").hide();
		            $(".commnet-wrap").addClass("commnet-hide");
				}
			}
	         })
		
		// 동적으로 생성된 인풋박스 등록 버튼 이벤트(대댓글)
		$(document).on("click","#dynamicReplyRegisterBtn",function() {
			var $reply = $(this).parent().parent().parent().prev();
			var $pageInfo = $(this).parent().parent().parent().parent().next().children().children().children();
			var ownPage = 0;
	
			$pageInfo.each(function() {
	
				var $this = $(this);
	
				if($this.hasClass("active")) {
					ownPage = $this.children().attr("href");
	
				}if($this == null || $this == "") {
					ownPage = 1;
				}
	
			})
	
			var replyNumber = $reply.data("replyno");
			var groupNumber = $reply.data("group");
			var depth = $reply.data("depth");
			var replyWriter =$reply.data("writer");
			var replyContent = $(this).prev().children().val();
			var userNickname = $reply.data("nickname");
	
			if(replyContent == null || replyContent == "" ) {
				alert("댓글을 입력해 주세요.");
				return false;
			}
	
			 var replyToInfo = {
						replyNumber : replyNumber,
						boardNumber : objThis.boardNumber,
						replyWriter : replyWriter,
						userNickname: objThis.username,
						replyContent: "[@"+userNickname+"] To."+" " + replyContent,
						depth		: depth,
						groupNumber : groupNumber
						
					}
	
	
				// 일반 댓글 등록일경우 중복 방지
				if(depth != null && groupNumber != null && replyNumber !=null) {
	
					$.ajax({
						type : "post",
						url  : "/replies",
						beforeSend: function(xhr) {
							xhr.setRequestHeader(objThis.csrfHeaderName, objThis.csrfTokenValue);
						},
						data : JSON.stringify(replyToInfo),
						contentType : "application/json; charset=utf-8",
						success : function() {
							alert("등록 완료");
							$("#comment-input-content-wrap").val("");
							reply.replyListFn(ownPage);
							$(".commnet-wrap").show();
							$(".comment-input-box").show();
							
						},
						error : function() {
							alert("실패");
						}
					})
				} 
			 		
		});
		
		// 일반 게시글 댓글 생성
		this.$replyRegisterBtn.on("click",function() {
			var replyContent = $("#comment-input-content-wrap").val();
	
			if( replyContent == null || replyContent == "" ) {
				alert("댓글을 입력해주세요.");
	
				$("#comment-input-content-wrap").focus();
	
				return false;
			}
	
			var replyInfo = {
					boardNumber : objThis.boardNumber,
					replyWriter : objThis.userId,
					userNickname : objThis.username,
					replyContent : replyContent
				};
			
			$.ajax({
				type : "post",
				url  : "/replies",
				data : JSON.stringify(replyInfo),
				beforeSend: function(xhr) {
					xhr.setRequestHeader(objThis.csrfHeaderName, objThis.csrfTokenValue);
				},
				contentType : "application/json; charset=utf-8",
				success : function() {
					alert("등록 완료");
					reply.replyLastPageFn(-1);
					$("#comment-input-content-wrap").val("");
					$(".commnet-wrap").show();
					$(".comment-input-box").show();
				},
				error : function() {
					alert("실패");
				}
			})
		})
	},
	
	// 댓글 수정
	replyModifyFn : function() {
	
		var objThis = this;
	
		//  답변 버튼 (동적 태그(인풋박스) 생성)
		$(document).on("click","#replyMo", function() {
	
			var	replyNumber = $(this).parent().parent().parent().parent().parent().data("replyno");
			var	groupNumber = $(this).parent().parent().parent().parent().parent().data("group");
			var	depth = $(this).parent().parent().parent().parent().parent().data("depth");
			var replyContentValue = $(this).parent().parent().parent().next().text();
	
			replyContentValue = replyContentValue.slice(0,-2); // 마지막 문자 제거
	
			var str = "";
	
			str += "<div class='comment-input-box'>"
				+  "<div class='comment-input-box-title pull-left'>"
			    +  "<i class='fas fa-pencil-alt'></i> 게시글 수정"
		        +  "</div>"
		        +  "<div class='form-group rounded-0 comment-input-content'>" 
			    +  "<div class='comment-input-content-cell'>"
				+  "<textarea tabindex='13' id='comment-input-content-wrap' name='replyContent' maxlength='1000' rows='5' class='form-control comment-input-sm rounded-0'  placeholder='내용을 입력해주세요.'>"+replyContentValue+"</textarea>"
			    +  "</div>"
			    +  "<div id='dynamicReplyModifyBtn' tabindex='14' class='comment-input-content-cell comment-input-submit'>" 
				+  "등록" 
			    +  "</div>" 
		        +  "</div>" 
	            +  "</div>" 
	
	        
			$(".comment-media").each(function() {
	
				if($(this).next().hasClass("checkBox")) {
					$(this).next().removeClass("checkBox");
					$(".comment-input-box").hide();
				}
				
			})
			
			$(".comment_"+replyNumber).addClass("checkBox");
			$(".comment_"+replyNumber).html(str);
	
			if($(".commnet-wrap").hasClass("comment-hide")) {
				 return;
			} else {
				$(".commnet-wrap").hide();
	            $(".commnet-wrap").addClass("commnet-hide");
			}
			
	         })
	
		// 동적으로 생성된 인풋박스 수정 버튼 이벤트
		$(document).on("click", "#dynamicReplyModifyBtn",function() {
			var $reply = $(this).parent().parent().parent().prev();
			var $pageInfo = $(this).parent().parent().parent().parent().next().children().children().children();
			var ownPage = 0;
	
			$pageInfo.each(function() {
				var $this = $(this);
	
				if($this.hasClass("active")) {
					ownPage = $this.children().attr("href");
	
				}if($this == null || $this == "") {
					ownPage = 1;
				}
	
			})
			var replyNumber = $reply.data("replyno");
			var replyContent = $(this).prev().children().val();
			var replyWriter = $(this).parent().parent().parent().prev().data("writer");
	
			if(replyContent == null || replyContent == "") {
				alert("댓글을 입력해주세요.");
				return false;
			}
	
			var replyModifyInfo = {
					replyNumber : replyNumber,
					replyContent : replyContent,
					replyWriter : replyWriter
	
				}
			
			$.ajax({
				type : "put",
				url  : "/replies/"+replyNumber,
				beforeSend: function(xhr) {
					xhr.setRequestHeader(objThis.csrfHeaderName, objThis.csrfTokenValue);
				},
				data : JSON.stringify(replyModifyInfo),
				contentType : "application/json; charset=utf-8",
				success : function() {
					alert("수정 완료");
					$("#comment-input-content-wrap").val("");
					reply.replyListFn(ownPage);
					$(".commnet-wrap").show();
					$(".comment-input-box").show();
					
				},
				error : function() {
					alert("실패");
				}
			})
		})
	
	         
	},
	
	replyDeleteFn : function() {
		var objThis = this;
	
		$(document).on("click","#replyDe", function() {
	
			var	replyNumber = $(this).parent().parent().parent().parent().parent().data("replyno");
			var $pageInfo = $(this).parent().parent().parent().parent().parent().parent().next().children().children().children();
			var replyWriter = $(this).parent().parent().parent().parent().parent().data("writer");
			var ownPage = 0;
	
			$pageInfo.each(function() {
	
				if($(this).hasClass("active")) {
					ownPage = $(this).children().attr("href");
				}
	
			})
	
			var result = confirm("삭제하면 복원 할 수 없습니다. 삭제하시겠습니까?");	
	
			if(result) {
	
				var replyInfo = {
						replyWriter : replyWriter
					}
	
				$.ajax({
					type : "delete",
					url  : "/replies/"+replyNumber,
					beforeSend: function(xhr) {
						xhr.setRequestHeader(objThis.csrfHeaderName, objThis.csrfTokenValue);
					},
					data : JSON.stringify(replyInfo),
					contentType : "application/json; charset=utf-8",
					success : function() {
						$("#comment-input-content-wrap").val("");
						reply.replyLastPageFn(-1);
						$(".commnet-wrap").show();
						$(".comment-input-box").show();
						
					},
					error : function(error) {
	
						if(error.status == 405) {
							alert("Access is denied" +"\n"+"권한이 없습니다.");
						} else {
							alert("자식 댓글이 작성된 글은 삭제 할 수 없습니다.");
						}
					}
				}) 
	
			} else {
				return;
			}
		})
	},
	
	replyPageFn : function(pageDTO) {
		var objThis = this;
		var str = "";
	
		str += "<nav aria-label='Page navigation example' >"
			+  "<ul class='pagination justify-content-center pagination-sm custompagination'>"
	
		if(pageDTO.prev) {
			str += "<li class='page-item prevNextRe'>"
				+  "<a class='page-link' href='"+(pageDTO.startPage - 1)+"' aria-label='Previous'>"
			  	+  "<span aria-hidden='true'>&laquo;</span>"
				+  "</a>"	 
		  	    +  "</li>"
		}
	
			for(var i = pageDTO.startPage, len = pageDTO.endPage; i <= len; i++) {
				var active = pageDTO.std.page == i ? 'active' : '';
				str += "<li class='page-item "+ active +"' id='pageNumber' ><a class='page-link' href='"+i+"'>"+i+"</a></li>";
			}
	
	
	
		if(pageDTO.next) {
			str += "<li class='page-item prevNextRe'>"
				+  "<a class='page-link' href='"+(pageDTO.endPage + 1)+"' aria-label='Previous'>"
				+  "<span aria-hidden='true'>&raquo;</span>"
				+  "</a>"
			    +  "</li>"
		}
	
		str += 	"</ul>"
	   		+	"</nav>"
	
		objThis.$replyPaging.html(str);
		
	},
	
	
	replyLikeFn : function() {
		var objThis = this;
	
		$(document).on("click", "#replyLikeBtn", function(e) {
			e.preventDefault();
	
			if(objThis.userId == null || objThis == "") {
				alert("로그인 후 이용해주세요.")
				return false;
			}
	
			var $numberLocation = $(this).children().children().next();
			var replyNumber = $(this).parent().parent().parent().parent().data("replyno")
			var replyLikeInfo = {
					replyNumber : replyNumber,
					userId      : objThis.userId
				}
	
		 	$.ajax({
				type : "POST",
				url  : "/replies/like",
				beforeSend: function(xhr) {
					xhr.setRequestHeader(objThis.csrfHeaderName, objThis.csrfTokenValue);
				},
				dataType : "json",
				data : JSON.stringify(replyLikeInfo),
				contentType : "application/json; charset=utf-8",
				success : function(data) {
					$numberLocation.html(data);
				},
				error : function() {
					alert("실패");
				}
			}) 
	
		})
	
	},
	
	replyPageMoveFn : function() {
	
		$(document).on("click", "#pageNumber a", function(e) {
	   		e.preventDefault();
	   		var page = $(this).attr("href");
	
			reply.replyListFn(page);
	
			var $fixMove = $(this).parent().parent().parent().parent().prev().prev().offset(); // 페이지 이동시 상단 고정
	       	$('html').animate({scrollTop : $fixMove.top}, 700);
	
		})
	
		$(document).on("click", ".prevNextRe a", function(e) {
			e.preventDefault();
			var page = $(this).attr("href");
	
			reply.replyListFn(page);
	
			var $fixMove = $(this).parent().parent().parent().parent().prev().prev().offset(); // 페이지 이동시 상단 고정
	
	       	$('html').animate({scrollTop : $fixMove.top}, 700);
		})
	
	}
		
}

var search = {
	
		$searchBoardBtn : null,
		$searchModal : null,
		$searchOptionValue : null,
		$searchOrAndValue : null,
		$searchContent : null,
		searchOptionValue : null,
		searchContentValue : null,
		searchOrAndValue : null,

		init : function() {
			this.$searchBoardBtn = $("#searchBoardBtn");
			this.$searchModal = $('#searchModal');
			this.$searchOptionValue = $("#searchOptionValue");
			this.$searchOrAndValue = $("#searchOrAndValue");
			this.$searchContent = $("#searchContent");
			this.searchOptionValue = "<c:out value="${pageInfo.std.searchOption}" />";
			this.searchContentValue = "<c:out value="${pageInfo.std.searchContent}" />";
			this.searchOrAndValue = "<c:out value="${pageInfo.std.searchOrAnd}" />";
			
		},

		searchEvent : function() {
			var objThis = this;

			this.$searchBoardBtn.on("click", function(e) {
				e.preventDefault();

				var brpQuery = "<c:out value= "${pageInfo.std.brpQuery()}" />";

				self.location = "/cbp/blp"
							+ brpQuery
							+ "&searchOption="
							+ objThis.$searchOptionValue.val()
							+ "&searchOrAnd="
							+ objThis.$searchOrAndValue.val()
							+ "&searchContent="
							+ encodeURIComponent(objThis.$searchContent.val())
							;
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

var boardLike = {

	$boardGoodBtn : null,
	$boardBadBtn : null,
	$goobCount : null,
	$badCount  : null,
	csrfHeaderName : null,
	csrfTokenValue : null,
	username : null,
	boardNumber : null,
	

	init : function() {

		this.$boardGoodBtn = $("#boardGoodBtn");
		this.$boardBadBtn = $("#boardBadBtn");
		this.$goobCount = $("#boardGoodBtn a b");
		this.$badCount = $("#boardBadBtn a b")
		this.csrfHeaderName = "${_csrf.headerName}";
		this.csrfTokenValue = "${_csrf.token}";
		<sec:authentication var="principal" property="principal" />
		<sec:authorize access="isAuthenticated()"> 
		this.username = "<c:out value='${principal.username}'/>";
		</sec:authorize>
		this.boardNumber = "<c:out value="${boardRead.boardNumber}"/>";

	},

	likeEvent : function() {

		var objThis = this;

		this.$boardGoodBtn.on("click",function() {

			boardLike.likeCommonFn("G");

		})

		this.$boardBadBtn.on("click",function() {
			boardLike.likeCommonFn("B");
		})
	},

	likeCommonFn : function(status) {

		var objThis = this;

		if(objThis.username == "" || objThis.username == null) {

			alert("로그인 후 이용 가능합니다.");
			return false;
		}

		var likeInfo = {
					boardNumber : objThis.boardNumber,
				    status      : status
				}
		
		$.ajax({
			type : "POST",
			url  : "/cbp/like",
			beforeSend: function(xhr) {
				xhr.setRequestHeader(objThis.csrfHeaderName, objThis.csrfTokenValue);
			},
			dataType: "json",
			data : JSON.stringify(likeInfo),
			contentType : "application/json; charset=utf-8",
			success : function(data) {
				objThis.$goobCount.text(data.goodTotalCount);
				objThis.$badCount.text(data.badTotalCount);
				
			},
			error : function(error) {
				alert("실패");
			}
		}) 
	}
}



$(document).ready(function() {
	search.init();
	search.searchEvent();
	search.searchDataInfoFn();

	reply.init();
	reply.replyLastPageFn(-1);
	reply.replyRegisterFn();
	reply.replyModifyFn();
	reply.replyDeleteFn();
	reply.replyLikeFn();
	reply.replyPageMoveFn();

	sort.init();
	sort.sortEvent();

	boardLike.init();
	boardLike.likeEvent();

	/* 게시글 등록시 모델로 내려온 boardNum  */
	var boardCreatSuccess = "<c:out value="${bcpSuccess}"/>";

	if(boardCreatSuccess == "bcpSuccess") {
		alert( "등록이 완료 되었습니다.");
		
	}
});
</script>


<script>


</script>

<!-- boardReadPage.js  -->
<script src="/resources/assets/js/boardReadPage.js"></script>
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
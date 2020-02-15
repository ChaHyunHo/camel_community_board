<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- <%@ include file="../include/header.jsp" %> --%>
<%@ include file="../include/header.jsp" %>

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
				<div class="board-detail-head">
					<span class="list-title">게시글 작성</span>
					<span class="pull-right nav-name">
							<b><i class="fas fa-home"></i> home <i class="fas fa-angle-right"></i> <i class="fas fa-pencil-alt"></i> 게시글 작성 </b>
					</span>	
					<hr>
				</div>

				<section class="board-create-wrap" style="width: 100%; height: auto; margin-top:20px;" >
						<form class="boardWriteForm" name="boardwrite" action="/cbp/bcp" method="post">
						
							<div class="form-group" style="margin-bottom: 5px !important;">
								<div class="row">
									<label class="col-md-2 login-label-left" 
									style="text-align: right; padding-top: 10px; font-weight:normal; font-size: 13px;">
										<b>게시판</b>
									</label>
									<div class="col-md-10" style="padding-top: 5px !important;">
										<select id="selectBoardCode" class="custom-select custom-select-sm rounded-0" required="required"
										name="boardCode" style="border: 0.5px solid rgba(0, 0, 0, 0.408);">
											<option value ="0" selected>--게시판 선택--</option>
											<option value="1">베스트게시판</option>
											<option value="2">유머게시판</option>
											<option value="3">미스테리게시판</option>
											<option value="4">익명게시판</option>
											<option value="5">연예인게시판</option>
											<option value="6">고객의소리</option>
										  </select>
									</div>
								</div>
							</div>

							<div class="form-group" style="margin-bottom: 5px !important; margin-top: 15px;">
								<div class="row">
									<label class="col-md-2 login-label-left" 
									style="text-align: right; padding-top: 6px; font-weight:normal; font-size: 13px;">
										<b>이름</b>
									</label>
									
									<div class="col-md-10">
										<input id="boardWriter" class="form-control custom-login-input rounded-0" 
										type="hidden" name="boardWriter" maxlength="10" required="required" readonly="readonly" value="${userInfo.userId}">
											<input id="userNickname" class="form-control custom-login-input rounded-0" 
										type="text" name="userNickname" maxlength="10" required="required" readonly="readonly" value="${userInfo.userNickname}">
									</div>
								</div>
							</div>

							<div class="form-group" style="margin-bottom: 5px !important; margin-top: 15px;">
								<div class="row">
									<label class="col-md-2 login-label-left" 
									style="text-align: right; padding-top: 6px; font-weight:normal; font-size: 13px;">
										<b>제목</b>
									</label>
									<div class="col-md-10">
										<input id="boardTitle" class="form-control custom-login-input rounded-0" 
										type="text" name="boardTitle"  maxlength="30" required="required" >
									</div>
								</div>
							</div>

							<div class="form-group" style="margin-bottom: 5px !important; margin-top: 20px;">
								<textarea id="smarteditor" name="boardContent" rows="20" style=" max-height:100%; width: 100%"  ></textarea>
							</div>

								<!-- 회원가입 버튼 -->
							<div style="text-align: center; margin-top: 20px;">
							
								<sec:authorize access="isAuthenticated()">
								
									<a href="#" onclick='return false' id="boardWrtieBtn" role="button" class="btn btn-lg rounded-0" 
									style="background-color: rgb(103, 103, 238); color: white; font-size: 15px;">
										작성완료
									</a>
									<a href="#" onclick='return false' id="boardWrtieCencle" role="button" class="btn btn-lg rounded-0" 
									style="background-color: rgb(103, 103, 238); color: white; font-size: 15px; margin-left: 5px;">
										취소
									</a>
								</sec:authorize>
									
							</div>
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
						</form>
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

	<!-- 스마트에디터 ver 2.8.2.3   -->
<script type="text/javascript" src="/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script> 

<script>

	$(document).ready(function() {

		var editor_object = [];

		nhn.husky.EZCreator.createInIFrame ({
			oAppRef: editor_object,
	        elPlaceHolder: "smarteditor",
	        sSkinURI: "/smarteditor/SmartEditor2Skin.html",
	        htParams : {
	            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseToolbar : true,            
	            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseVerticalResizer : true,    
	            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseModeChanger : true,
	        }
		});

		$("#boardWrtieBtn").on("click",function() {

			editor_object.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []);

			console.log(document.getElementById("smarteditor").value);
			var boardContent = document.getElementById("smarteditor").value;
			var boardTitle = $("#boardTitle").val();
			var boardWriter = $("#boardWriter").val();
			var boardCode = $("#selectBoardCode").val();
			var userNickname =  $("#userNickname").val();

			if($("#selectBoardCode").val() == "0") {
				alert("게시판을 선택해주세요.");
				$("#selectBoardCode").focus();
				$('html, body').animate({scrollTop : $(".board-detail-head").offset().top}, 700);
				return;
			}

			if(boardTitle == null || boardTitle == "") {
				alert("제목을 입력해주세요.");
				$("#boardTitle").focus();
				$('html, body').animate({scrollTop : $(".board-detail-head").offset().top}, 700);
				return;
			}

			if(boardContent == "<p>&nbsp;</p>" || boardContent == "" || 
					boardContent == null) {
				alert("내용을 입력해주세요.");
				$('html, body').animate({scrollTop : $("#boardTitle").offset().top}, 700);
				return;
			}

			$(".boardWriteForm").submit();
			
		});
		
		$("#boardWrtieCencle").click(function() {
			self.location = "/cbp/blp?code="+"<c:out value="${code}"/>";
		});

	
		
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, initial-scale=1">
	<title>사막의 오아시스</title>
	<!-- google font -->
	<link href="https://fonts.googleapis.com/css?family=Gothic+A1&display=swap&subset=korean" rel="stylesheet">
	<!--  Bootstrap CSS  -->
	<link rel="stylesheet" href="/resources/assets/css/bootstrap.css">
	<!--  bootstrap.min.css  -->
	<link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css">
	<!--  bootstrap-grid.css  -->
	<link rel="stylesheet" href="/resources/assets/css/bootstrap-grid.css">
	<!--  bootstrap-grid.min.css  -->
	<link rel="stylesheet" href="/resources/assets/css/bootstrap-grid.min.css">
	<!--  bootstrap-reboot.css  -->
	<link rel="stylesheet" href="/resources/assets/css/bootstrap-reboot.css">
	<!--  bootstrap-reboot.min.css  -->
	<link rel="stylesheet" href="/resources/assets/css/bootstrap-reboot.min.css">
	<!--  colorset.csss  -->
	<link rel="stylesheet" href="/resources/assets/css/customheader.css">
	<!--  colorset.csss  -->
	<link rel="stylesheet" href="/resources/assets/css/customindex.css?ver=6">
	<!--  colorset.csss  -->
	<link rel="stylesheet" href="/resources/assets/css/custommain.css?ver=1">
		<!--  colorset.csss  -->
		<link rel="stylesheet" href="/resources/assets/css/customfooter.css">
	<!--  font-awesome.min.css -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

</head>
<body>
	<!--  최상단 lnb -->
	<div class="row">
		<div class="c-lnb col-12">
				<div class="c-lnbwith">
					<div class="pull-left">
						<ul>
							<li><a href="#" id="favor">즐겨찾기</a></li>
							<li><span id="nowDay">현재시각</span></li>
						</ul>
					</div>
					<div class="pull-right">
						<ul>
							<li><a href="#">공지</a></li>
							
							
							<sec:authorize access="isAnonymous()">
								<li><a href="/user/register">회원가입</a></li>
								<li><a href="/loginform">로그인</a></li>
							</sec:authorize>
							
							<sec:authorize access="isAuthenticated()">
								<li>
									<a href="#" ><b><c:out value="${userInfo.userNickname}"></c:out> </b></a>
								</li>
								<li>
								<!-- onclick="document.getElementById('logout-form').submit();" -->
									<a href="#" id="lnbLogout" >로그아웃</a>
									<form id="logout-form" action="/logoutform" method='post'>
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
									</form>
								</li>
							</sec:authorize>
								
						</ul>
					</div>
			</div>
		</div>
	</div>
	

	<!-- 데스크탑 헤더 -->
	<div class="row d-header">
		<div class="desktop-header col-5">
			<div class="desktop-header-padding  pull-right ">
				<a href="/">
					<img src="/resources/assets/img/camel-logo.png" title="camel community" />
					<span class="logoname"><b></b></span> 
				</a>
			</div>
		</div>
		<div class="col-7">
			<div class="searchbar">
				<form id="allSearchForm" action="/cbp/search"  method="get">
					<div class="row">
						<div class="wrap">
							<div class="search" >
							   <input id="searchContent" type="text" name="searchContent" 
							   class="searchTerm rounded-0"  value="<c:out value='${std.searchContent}'/>" >
							   <button type="submit" id="allSearchBtn" class="searchButton rounded-0">
								 <i class="fa fa-search"></i>
							  </button>
							</div>
						 </div>
					</div>
				</form>
			</div>
		</div>	
	</div>
	
	<!-- 모바일 헤더 -->
	<div class="row">
		<div class="col-12 mobile-header">
			<div class="row">
				<div class="header-button col-4"style="text-align: left;">
					<a href="#" style="margin-left: 15px;" id="userInfo">
						<i class="fas fa-users-cog"></i>
					</a>
				</div>
				<div class="header-button col-4" style="text-align: center;">
					<a href="/" >
						<b>CAMEL</b>
					</a>
				</div>
				<div class="header-button col-4" style="text-align: right;">
					<a href="#" style="margin-right: 15px;">
						<i class="fas fa-search"></i>
					</a>
				</div>
			</div>		
		</div>
	</div>

	<!-- 데스트탑 nav bar -->

	<nav class="navbar navbar-expand-lg navbar-dark customnav">
		<div class="row navwrap">
			<a class="navbar-brand" href="/"><i class="fas fa-home"></i></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
				<c:forEach begin="1" end="6" varStatus="idx" >
					<li id="navMenu" class="nav-item">
						<a data-index="${idx.count}" class="nav-link custommenu" href="/cbp/blp?code=${idx.count}"></a>
					</li>
				</c:forEach>
				</ul>
			</div>
		</div>
	  </nav>

	   <!-- 모바일 nav bar -->
	   <div class="mobile-wrap">
		<div class="row">
			<div class="col-2">
				<div class="open-wrap">
					<span class="open-menu">
						<i class="fas fa-bars" style="font-size: 28px;" aria-hidden="true"></i>
					</span>
				</div>
			</div>
			<div class="col-10" style="text-align: right; margin-top: 1px;">
				<span class="open-menu">
					<i class="fas fa-bell" style="font-size: 20px; margin-right: 8px;"></i>
				</span>
			</div>
		</div>
	  </div>

	  <!-- 테블릿 nav bar -->
	  <div class="tablet-wrap">
		<div class="row">
			<div class="col-1">
				<div class="open-wrap">
					<span class="open-menu">
						<i class="fas fa-bars" style="font-size: 28px;" aria-hidden="true"></i>
					</span>
				</div>
			</div>
			<div class="col-10 tablet-nav-menu" style="margin-top:8px; margin-left: 5px;">
				<div class="row" style="text-align: center; font-size: 14px;">
					<c:forEach begin="1" end="6" varStatus="idx">
						<div id="tabletMenu" class="col-2">
							<a id="tabletMenu" href="/cbp/blp?code=1" href="/cbp/blp?code=${idx.count}">
							</a>
						</div>
					</c:forEach>
				</div>
					
			</div>
		</div>
	  </div>

	<!-- 모바일 side bar -->
	<div id="mysidenav" class="sidenav">
		<a href="#" class="closebtn">
			<i class="fas fa-times"></i>
		</a>
		<div class="row sidebutton">
			<sec:authorize access="isAuthenticated()">
				<button class="rounded-pill" id="sidebuttonInfo"><b>MYPAGE</b></button> 
				<button class="rounded-pill" id="sidebuttonlogout" style="margin-left: 40px;"><b>LOGOUT</b></button> 
			</sec:authorize>
			
			<sec:authorize access="isAnonymous()">
			<button class="rounded-pill" id="sideLoginButton"><b>LOGIN</b></button> 
			</sec:authorize>
		</div>

		<div class="row" style="margin-left: 30px; margin-top: 20px;">
			<span calss="sidebarmenutext"><b style="text-decoration: underline; 
			text-underline-position: under;">Menu</b></span>
		</div>

		<div class="row" style="margin-left:20px; margin-top: 20px;">
			<span>
				<a href="/">
					<i style="font-size:32px; margin-right: 20px;" class="fas fa-home">
						
					</i>
					<div><b>Home</b></div>
				</a>
			</span>

			<!-- <span>
				<a href="#">
					<i style="font-size:32px; margin-right: 20px;" class="fas fa-pen">
					</i>
					<div><b>글쓰기</b></div>
				</a>
			</span> -->
		</div>
		<div class="sidebarmenu">
			<hr>
			<c:forEach begin="1" end="6" varStatus="idx">
				<a href="/cbp/blp?code=${idx.count}"></a>
				<hr>
			</c:forEach>
		</div>
	</div>

<script type="text/javascript">

var category = 
	new Array (	"베스트게시판",
				"유머게시판",
				"미스테리게시판",
				"익명게시판",
				"연예인게시판",
				"고객의소리"
	 		 );
	 
var tabletCategory = 
	new Array (	"베스트","유머","미스테리","익명","연예인","고객");
	
	
var hearder = {

	categoryFn : function(tag) {

		if(tag.attr("id") == "tabletMenu") {
			for(var i = 0; i < 6; i++) {
				tag.eq(i).append("<b>"+tabletCategory[i]+"</b>");
			}
		} else {
			 for(var i = 0; i < 6; i++) {
					tag.eq(i).append("<b>"+category[i]+"</b>");
			 }
		}

	}
		
}

var allSearch = {

	$searchContent : null,
	$allSearchForm  : null,
	$allSearchBtn  : null,
	
	init : function() {
		this.$searchContent = $("#searchContent");
		this.$allSearchForm = $("#allSearchForm");
		this.$allSearchBtn = $("#allSearchBtn");
	},

	searchEvent : function() {
		var objThis = this;

		this.$allSearchBtn.on("click", function(e) {
			e.preventDefault();

			var searchContent = objThis.$searchContent.val();
			console.log(searchContent);

			if(searchContent.length < 2) {
				 alert("2글자 이상 입력해주세요.") 
				 return; 
			}

			var contentArr = new Array();
			var cnt = 0;

			contentArr = searchContent.split(" ");

			for(var i = 0; i < contentArr.length; i++) {
				cnt++;
			}

			console.log(cnt);
			if(cnt >= 3) {
				alert("공백은 한번만 허용됩니다.");
				return;
			} 

			objThis.$allSearchForm.submit();
			
		});
	}
}

$(document).ready(function() {
	hearder.categoryFn($("#navMenu a"));  // PC 화면 메뉴
	hearder.categoryFn($("#tabletMenu a")); // 태블릿 화면 메뉴
	hearder.categoryFn($(".sidebarmenu a")); // 사이드바 메뉴

	allSearch.init();
	allSearch.searchEvent();

	$("#lnbLogout").on("click",function(e){
		e.preventDefault();
		$("#logout-form").submit();

	});

	$("#sidebuttonlogout").on("click",function(e){
		e.preventDefault();
		$("#logout-form").submit();

	});

	$("#sideLoginButton").on("click", function(e) {
		e.preventDefault();
		self.location="/loginform";
	})

});


</script>


	
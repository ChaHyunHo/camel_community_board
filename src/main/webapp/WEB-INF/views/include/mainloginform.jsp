<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<sec:authorize access="isAnonymous()"> 
	<div class="main-list-head" style="font-size: 11px; color: rgba(0, 0, 0, 0.632);">
		<span>로그인 후 멋진 게시글을 작성해주세요~ <i class="fas fa-sign-in-alt"></i></span>
		<hr class="shadow rounded" style="margin-top: 10px;">
	</div>
		  
	<div class="form-group">
		<a href="/loginform"  class="btn login-btn btn-block rounded-0 lgin-form-submit">
		<span style="font-size:15px; font-weight: 800;" >CALMEL </span><span style="font-size: 14px;"> 로그인</span></a>
	</div>
	<div class="clearfix" style="font-size: 12px; color: rgba(0, 0, 0, 0.632);">
		
			<a href="#" class="pull-right">비밀번호 찾기</a>
			<a href="/user/register" class="pull-right">회원가입</a>
	</div>
	<!-- end clearfix -->

</sec:authorize>

<sec:authorize access="isAuthenticated()">
	<div class="simple-profile" style="margin-bottom: 30px;">
	<div class="main-list-head">
		<span><b>Profile</b></span>
		<span class="pull-right">
			<a class="main-list-go" href="#">
				<i class="fas fa-sign-out-alt"></i>
			</a>
		</span>
		<hr class="shadow rounded">
	</div>

	<div class="media profilefont">
		<a href="#" style="text-decoration: none; margin-right: 15px;">
			<i class="fas fa-user"></i>
		</a>
		<div class="media-body" style=" margin-top: 5px;">
		  <h6 class="mt-0" style="font-size: 14px;"><b><c:out value="${userInfo.userNickname}"/> </b> 님 환영합니다.</h6>
		</div>
	</div>
	<div class="media">
		<div class="media-body" style=" margin-top: 10px;">
		 <ul class="profileUl">
			<li><a href="#" id="favor">알림</a></li>
			<li><a href="#" id="favor">쪽지</a></li>
		 </ul>
		</div>
	</div>
	  <hr style="margin-top: 5px;">
	
	<div class="profile-wrap" style="width: auto; height: 30px;">
		<div class="profile-info" style="float: right;">
			<ul class="profileUl">
				<li><a href="#" id="favor">마이페이지</a></li>
				<li><a href="#" id="favor">정보수정</a></li>
			 </ul>
		</div>
		<div class="profile-point" style="float: left;">
			<i style="font-size: 13px;" class="fab fa-product-hunt"></i> 
			<span style="font-size: 10px; color: red;"><c:out value="${userInfo.userPoint}"/></span><span style="font-size: 12px;"> point</span>
		</div>
	</div>

	<div class="logout-button" style="margin-top: 10px;">
		<a id="mainLogout"  class="btn btn-primary btn-lg btn-block rounded-0" 
		style="background-color: rgb(103, 103, 238); height: 40px; font-size: 13px; color: white; border-color:rgb(103, 103, 238); ">
		<b><i class="fas fa-power-off"></i> 로그아웃</b></a>
		<form id="logout-form" action="/logoutform" method='post'>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</form>
	</div>
</div>
	
</sec:authorize> 

<script>
$(document).ready(function() {
	$("#mainLogout").on("click",function(e){
		e.preventDefault();
		$("#logout-form").submit();

	});
	
});

</script>


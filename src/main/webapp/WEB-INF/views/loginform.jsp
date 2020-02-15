<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	<link rel="stylesheet" href="/resources/assets/css/customloginform.css?ver=1">
	<!--  font-awesome.min.css -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
</head>
<body>

    <div class="login-wrap">
        <div class="header">
            <span>
                <a href="/">CAMEL</a>
            </span>
        </div>
        
        <div class="container">
            <form action="/login" method="post">
                
				<div class="form-group">
					<div class="input-group">
						<input type="text" class="form-control rounded-0" name="username" id="username" placeholder="아이디" required="required">				
					</div>
				</div>
				<div class="form-group">
					<div class="input-group">
						<input type="password" class="form-control rounded-0" name="password" id="password" placeholder="비밀번호" required="required">				
					</div>
					<div style="font-size: 11px; color: red; margin-top: 3px;">
						<c:if test="${not empty ERRORMSG}">
							 <c:out value="${ERRORMSG}"></c:out>
						</c:if> 
					</div>
				</div>        
				<div class="form-group">
					<button type="submit" class="btn login-btn btn-block rounded-0 lgin-form-submit">로그인</button>
				</div>
				 <div class="custom-control custom-checkbox mb-3 ">
				    <input type="checkbox" class="custom-control-input" id="customControlValidation1" name='remember-me' >
				    <label class="custom-control-label" for="customControlValidation1">
				    <span style="font-size: 12px;">로그인 상태 유지</span></label>
				    <div class="invalid-feedback">Example invalid feedback text</div>
				  </div>
                <hr>

                <div class="row info">
                    <ul>
                        <li><a href="/user/register " >회원가입</a></li>
                        <li><a href="#">정보 찾기</a></li>
                    </ul>
                </div>
                <!-- <div class="social">
                    <span>
                        <b>Login with your social media account</b>
                    </span>
                    <div style="margin-top: 10px;">
                        <a href="#" class="btn btn-danger rounded-0"><i class="fab fa-google"></i>&nbsp; Google</a>

                    </div>
                </div> -->
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                 <input type="hidden" name="loginRedirect" value="${loginRedirect}" />
            </form>
        </div>
        <div id="footer">
            <div class="footercopy">
                <div style="margin-top: 3px;">
                    TEL : 010 -2909-1275 | Email : chamym@naver.com
                </div>
                <div style="margin-top: 3px;">
                    <i class="far fa-smile"></i>
                      <b>사막의 오아시스 같은 존재 <span><i class="far fa-copyright"></i> 2019.차현호.All rights reserved.</span> </b>
                </div>
            </div>
        </div>
    </div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 
	
<script>
	var error = "<c:out value='${error}'/>";

	var url = "<c:url value='${loginRedirect}'/>";

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
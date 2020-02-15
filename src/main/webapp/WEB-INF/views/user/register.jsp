<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>


<!-- 메인 영역 -->
	<div class="custom-container">
		<div class="container" style="height: 80px;">
			<div class="pull-left" style="line-height: 90px; height: auto;  font-size: 20px;">
				<strong><i class="fas fa-sign-in-alt"></i> 회원가입 양식</strong>
			</div>
		</div>
	</div>

	<div class="container">
		<form class="registerForm" action="/user/register" method="POST">
			<div class="card card-default rounded-0" style="margin-bottom: 20px;" >
				<div class="card-header" style="font-size: 11px; background-color: rgba(103, 103, 238, 0.082);">
					<i class="fas fa-id-card"></i> 아이디 / 비밀번호
				</div>
				<div class="card-body">
					<div class="form-group" style="margin-bottom: 5px !important;">
						<div class="row">
							<label class="col-md-2 login-label-left" style="text-align: right; padding-top: 7px; font-size: 10px;">
								<b>아이디</b>
							</label>
							<div class="col-md-3">
								<input class="form-control custom-login-input rounded-0" type="text" name="userId" id="registerUserid" minlength="3" maxlength="15" required >
								<span class="fa fa-check form-control-feedback"></span>
								<span id="useridRegexpCheck" style="color: red; font-size:10px;"> <!-- 이미 사용중인 아이디 입니다. --></span>
							</div>
						</div>
					</div>

					<div class="form-group" >	
						<div class="row">
							<div class="col-md-2"></div>
						<div class="col-md-8" style="font-size: 11px;">
							<!-- 소문자와 숫자 4~12자리만 가능합니다. -->
						</div>
						</div>
					</div>
					<div class="form-group">
						<div class="row">
							<label class="col-md-2 login-label-left" style="text-align: right; padding-top: 7px; font-size: 10px;">
								<b>비밀번호</b>
							</label>
							<div class="col-md-3">
								<input class="form-control custom-login-input rounded-0" type="password" name="userPw" id="registerUserPw" minlength="3" maxlength="15" required >
								<span class="fa fa-key form-control-feedback"></span>
								<span id="userPwCheck" style="color: red; font-size:10px;"></span>
							</div>

							<label class="col-md-2 login-label-left" style="text-align: right; padding-top: 7px; font-size: 10px;">
								<b>비밀번호 확인</b>
							</label>
							<div class="col-md-3">
								<input class="form-control custom-login-input rounded-0" type="password" id="passwordCheck"  minlength="3" maxlength="15" required >
								<span class="fa fa-key form-control-feedback"></span>
								<span id="pwCheck" style="color: red; font-size:10px;"></span>
							</div>
						</div>
					</div>
					
				</div>
			</div>

			<!-- 개인정보 입력 양식 -->
			<div class="card card-default rounded-0" style="margin-bottom: 20px;" >
				<div class="card-header" style="font-size: 11px; background-color: rgba(103, 103, 238, 0.082);">
					<i class="fas fa-id-card"></i> 개인정보 입력
				</div>
				<div class="card-body">
					<div class="form-group" style="margin-bottom: 5px !important;">
						<div class="row" style="margin-bottom: 20px;">
							<label class="col-md-2 login-label-left" style="text-align: right; padding-top: 7px; font-size: 10px;">
								<b>이름</b>
							</label>
							<div class="col-md-3">
								<input class="form-control custom-login-input rounded-0" type="text" name="userName" id="registerUserName" minlength="3" maxlength="15" required >
								<span class="fa fa-check form-control-feedback"></span>
								<span id="nameRegexpCheck" style="color: red; font-size:10px;"></span>
							</div>
						</div>
					</div>

					<div class="form-group" style="margin-bottom: 5px !important;">
						<div class="row" >
							<label class="col-md-2 login-label-left" style="text-align: right; padding-top: 7px; font-size: 10px;">
								<b>닉네임</b>
							</label>
							<div class="col-md-3">
								<input class="form-control custom-login-input rounded-0" type="text" 
								id="registerUserNickname" name="userNickname"  maxlength="10" required >
								<span class="fa fa-user form-control-feedback"></span> 
								<span id="nicknameRegexpCheck" style="color: red; font-size:10px;"></span>
							</div>
						</div>
					</div>

					<div class="form-group" >	
						<div class="row">
							<div class="col-md-2"></div>
						<div class="col-md-8" style="font-size: 13px;">
							
						</div>
						</div>
					</div>

					<div class="form-group" style="margin-bottom: 5px !important;">
						<div class="row" >
							<label class="col-md-2 login-label-left" style="text-align: right; padding-top: 7px; font-size: 10px;">
								<b>이메일</b>
							</label>
							<div class="col-md-5">
								<input class="form-control custom-login-input rounded-0" type="email" name="email" id="registerEmail" minlength="3" maxlength="30" required >
								<span class="fa fa-envelope form-control-feedback"></span>
								<span id="emailRegexpCheck" style="color: red; font-size:10px;"></span>
							</div>
						</div>
					</div>

					<div class="form-group" >	
						<div class="row">
							<div class="col-md-2"></div>
						<div class="col-md-8" style="font-size: 12px; color: blue;">
							회원가입 후 이메일 인증을 통해 로그인이 가능합니다.
						</div>
						</div>
					</div>
				</div>
			</div>

			<!-- 개인 설정 -->
			<div class="card card-default rounded-0" >
				<div class="card-header" style="font-size: 11px; background-color: rgba(103, 103, 238, 0.082);">
					<i class="fas fa-id-card"></i> 개인정보 입력
				</div>
				<div class="card-body">
					<div class="form-group" style="margin-bottom: 5px !important;">
						<div class="row" style="margin-bottom: 20px;">
							<label class="col-md-2 login-label-left" style="text-align: right; padding-top: 7px; font-size: 10px;">
								<b>자기소개</b>
							</label>
							<div class="col-md-8">
								<textarea name="user-introduce" rows="5" id="user-introduce" class="form-control input-sm rounded-0"></textarea>
							</div>
						</div>
					</div>

				</div>
			</div>

			<!-- 회원가입 버튼 -->
		<div style="text-align: center; margin-top: 20px;">
			<button  id="registerBtn" role="button" class="btn btn-lg rounded-0" 
			style="background-color: rgb(103, 103, 238); color: white; font-size: 15px;">
				 회원가입
			</button>
			<a href="/" id="listsort" role="button" class="btn btn-lg rounded-0" 
			style="background-color: rgb(103, 103, 238); color: white; font-size: 15px; margin-left: 5px;">
				 취소
			</a>
		</div>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</form>
		
	</div>

<%@ include file="../include/footer.jsp" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script>

$(function() {
	var $registerForm = $(".registerForm");
	var $registerUserid = $("#registerUserid");
	var $registerEmail = $("#registerEmail");
	var $registerUserName = $("#registerUserName");
	var $registerUserNickname = $("#registerUserNickname");
	var $registerUserPw = $("#registerUserPw");
	var $passwordCheck = $("#passwordCheck");
	var $registerBtn = $("#registerBtn");
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";

	var useridCheckResult = false;
	var emailCheckResult = false;
	var nicknameCheckResult = false;
	var passwordCheckResult = false;
	var confirmCheckResult = false;
	var nameCheckResult = false;
	var nameRegexp = /^[가-힣]{2,6}$/;
	var passwordRegexp = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;

	$registerUserid.on("keyup", function() {
		var userIdRegexp = /^[a-z0-9]{4,12}$/;
		var	dataVaule = { userId : $(this).val()};
		var $useridSpan = $("#useridRegexpCheck");
		$.ajax({
			type : "POST",
			url  : "/user/idCheck",
			beforeSend: function(xhr) {
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			dataType : "json",
			data : JSON.stringify(dataVaule),
			contentType : "application/json; charset=utf-8",
			success : function(data) {

				if(data == 1) {
					$useridSpan.text("이미 사용중인 아이디 입니다.");
					$useridSpan.css('color', 'red');
					$registerBtn.attr("disabled", true);
					useridCheckResult = false;
				} else if(data == 0) {
					if(userIdRegexp.test(dataVaule.userId)) {
						$useridSpan.text('사용 가능한 아이디 입니다.');
						$useridSpan.css('color', 'blue');
                        $registerBtn.attr("disabled", false);
                        useridCheckResult = true;
					} else if(dataVaule.userId == "" || dataVaule.userId == null) {
						$useridSpan.text('필수 정보입니다.');
						$useridSpan.css('color', 'red');
                         $registerBtn.attr("disabled", true);
                         useridCheckResult = false;
					} else {
						$useridSpan.text("4~12자의 영문 소문자, 숫자만 사용 가능합니다.");
						$useridSpan.css('color', 'red');
						$registerBtn.attr("disabled", true);
						useridCheckResult = false;
					}
				}
				
			},
			error : function() {
				alert("실패");
			}
		})
	})
	
	$registerEmail.on("keyup", function() {
			var emailRegexp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			var	dataVaule = { email : $(this).val()};
			var $emailRegexpCheck = $("#emailRegexpCheck");
			$.ajax({
				type : "POST",
				url  : "/user/emailCheck",
				beforeSend: function(xhr) {
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
				dataType : "json",
				data : JSON.stringify(dataVaule),
				contentType : "application/json; charset=utf-8",
				success : function(data) {

					if(data == 1) {
						$emailRegexpCheck.text("이미 사용중인 email 주소입니다.");
						$emailRegexpCheck.css('color', 'red');
						$registerBtn.attr("disabled", true);
						emailCheckResult = false;
					} else if(data == 0) {
						if(emailRegexp.test(dataVaule.email)) {
							 $emailRegexpCheck.text('');
	                         $registerBtn.attr("disabled", false);
	                         emailCheckResult = true;
						} else if(dataVaule.email == "" || dataVaule.email == null) {
							 $emailRegexpCheck.text('필수 정보입니다.');
	                         $emailRegexpCheck.css('color', 'red');
	                         $registerBtn.attr("disabled", true);
	                         emailCheckResult = false;
						} else {
							$emailRegexpCheck.text("이메일 주소를 다시 확인해주세요.");
							$emailRegexpCheck.css('color', 'red');
							$registerBtn.attr("disabled", true);
							emailCheckResult = false;
						}
					}
					
				},
				error : function() {
					alert("실패");
				}
			})
		})
		
	$registerUserName.on("keyup", function() {

			 if(nameRegexp.test($(this).val())) {
                $("#nameRegexpCheck").text("");
                $registerBtn.attr("disabled", false);
                nameCheckResult = true;
            }else {
                $("#nameRegexpCheck").text("이름을 확인해주세요.");
                $("#nameRegexpCheck").css('color','red');
                $registerBtn.attr("disabled", true);
            }
		})
		
	$registerUserPw.on("keyup", function() {
		if(passwordRegexp.test($(this).val())) {
			$("#userPwCheck").text("")
			$registerBtn.attr("disabled", false);
			passwordCheckResult = true;
		} else {
			$("#userPwCheck").text("8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.")
			$("#userPwCheck").css('color','red')
               $registerBtn.attr("disabled", true);
			
		}
	})

	$passwordCheck.on("keyup", function() {
		var password = $registerUserPw.val();

		 if(password == $(this).val()) {
			$("#pwCheck").text("")
			$registerBtn.attr("disabled", false);
			confirmCheckResult = true;
		 } else if( password != $(this).val()) {
			$("#pwCheck").text("비밀번호가 일치하지 않습니다")
			$("#pwCheck").css('color','red');
			$registerBtn.attr("disabled", true);
		 }
	}) 

	$registerUserNickname.on("keyup", function() {
		var nickNameRegexp = /^[가-힣a-zA-Z0-9]{2,10}$/; // 한글과 영어, 숫자만 사용가능
		var $nicknameRegexpCheck = $("#nicknameRegexpCheck"); 
		var	dataVaule = { userNickname : $(this).val()};
		var $emailRegexpCheck = $("#emailRegexpCheck");
		$.ajax({
			type : "POST",
			url  : "/user/nicknameCheck",
			beforeSend: function(xhr) {
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			dataType : "json",
			data : JSON.stringify(dataVaule),
			contentType : "application/json; charset=utf-8",
			success : function(data) {

				if(data == 1) {
					$nicknameRegexpCheck.text("이미 사용중인 닉네임입니다.");
					$nicknameRegexpCheck.css('color', 'red');
					$registerBtn.attr("disabled", true);
					nicknameCheckResult = false;
				} else if(data == 0) {
					if(nickNameRegexp.test(dataVaule.userNickname)) {
						$nicknameRegexpCheck.text('');
                        $registerBtn.attr("disabled", false);
                        nicknameCheckResult = true;
					} else if(dataVaule.userNickname == "" || dataVaule.userNickname == null) {
						$nicknameRegexpCheck.text('필수 정보입니다.');
						$nicknameRegexpCheck.css('color', 'red');
                        $registerBtn.attr("disabled", true);
                         nicknameCheckResult = false;
					} else {
						$nicknameRegexpCheck.text("한글과 영어, 숫자만 사용하세요.");
						$nicknameRegexpCheck.css('color', 'red');
						$registerBtn.attr("disabled", true);
						nicknameCheckResult = false;
					}
				}
				
			},
			error : function() {
				alert("실패");
			}
		})
	}) 

	$registerBtn.on("click", function(e) { 
		e.preventDefault();
		var totalCheckArr = new Array(5).fill(false);

		if(useridCheckResult) {
			totalCheckArr[0] = true;
		} else {
			$registerUserid.focus();
			alert("아이디를 확인 해주세요.");
			totalCheckArr[0] = false;
			return false;
		}

		if (passwordCheckResult && confirmCheckResult) {
            totalCheckArr[1] = true;
        } else {
            alert("비밀번호를 확인해 주세요");
            totalCheckArr[1] = false;
            $registerUserPw.focus();
			return false;
        }

		if(nameCheckResult) {
			totalCheckArr[2] = true;
		} else {
			$registerUserName.focus();
			alert("이름을 확인해 주세요");
			totalCheckArr[2] = false;
			return false;
		}

		if(nicknameCheckResult) {
			totalCheckArr[3] = true;
		} else {
			$registerUserNickname.focus();
			alert("닉네임을 확인해 주세요");
			totalCheckArr[3] = false;
			return false;
		}

		if(emailCheckResult) {
			totalCheckArr[4] = true;
		} else {
			$registerEmail.focus();
			alert("이메일을 확인해 주세요");
			totalCheckArr[4] = false;
			return false;
		}

		for(var i =0; i < totalCheckArr.length; i++) {
			var validCheckAll = true;
			console.log(totalCheckArr[i]);

			if (totalCheckArr[i] == false) {
                validCheckAll = false;
            }
		}

		
		if (validCheckAll) {
			$registerForm.submit();

			alert("가입완료");
        } else {
            alert("입력한 가입 정보가 완료 되지 않았습니다.");
            e.preventDefault();
        }
	})
})
</script>

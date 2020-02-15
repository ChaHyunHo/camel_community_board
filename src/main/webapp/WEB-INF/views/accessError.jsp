<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, initial-scale=1">
	<title>accessError</title>
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
	<!--  font-awesome.min.css -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
</head>
<body>

<h1>Access Denied Page</h1>
	
	<h2><c:out value="${SPRING_SECURITY_403_EXCEPTION.getMessage()}"></c:out> </h2>
	
	<h2><c:out value="${msg}"></c:out> </h2>
    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 	

<script>
	var msg2 = "<c:out value='${msg}'/>"
	
	alert("("+msg2+")");
	location.href = "/cbp/blp?code=1";
	
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
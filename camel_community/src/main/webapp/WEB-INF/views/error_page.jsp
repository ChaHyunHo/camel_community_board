<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>error_page</title>
</head>
<body>

	<%-- <h4>${ex.getMessage() }</h4>
	
	<ul>
		<c:forEach items="${ex.getStackTrace()}" var="stack">
			<li>${stack.toString() }</li>
		</c:forEach>
	
	</ul> --%>
<script>
	// console.log(errorInfo);

	alert("존재하지 않습니다.");
	location.href = "/";
</script>
	  

</body>
</html>
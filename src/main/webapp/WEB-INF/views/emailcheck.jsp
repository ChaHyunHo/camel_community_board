<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<script type="text/javascript">
	var staus = "<c:out value='${result}'/>";
	if (staus == 'success') {
		alert("인증이 완료 되었습니다. 로그인 가능하십니다.");
		window.close();
	} else if(staus == 'error') {
		alert("이미 인증 되었습니다.")
		window.close();
	}
</script>

</body>
</html>
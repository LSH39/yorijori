<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
</head>
<body>
	<c:if test="${sessionScope.m.memberNo != null}">	
		<div><a href="/milkitFrm1.do?memberNo=${sessionScope.m.memberNo }">밀키트 만들기</a></div>
	</c:if>
</body>
</html>
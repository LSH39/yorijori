<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠킹클래스 목록</title>
<style>

</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="container">
		<h1>쿠킹클래스 목록</h1>
		<c:forEach items="${list }" var="ccls" varStatus="i">
		<img src="./resources/img/cookingcls/classtest.jpg" width="300px" height="300px"><br>
		<h5>${i.count }</h5>
		<h5>${ccls.memberNo }</h5>
		<h5>${ccls.classTitle }</h5>
		<h5>${ccls.classPrice }</h5>
		<a href="/cookingClsView.do?classNo=${ccls.classNo}">너는 절대 못하는</a>
		</c:forEach>
	</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
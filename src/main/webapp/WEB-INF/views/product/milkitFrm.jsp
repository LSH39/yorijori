<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/milkitFrm2.do" method="post"> 
	<c:forEach items="${list}" var="rb">
		<div>
		<input type="radio" name="recipeNo" value="${rb.recipeNo }">
		<img src="/resources/upload/recipe/${rb.filepath }">
		<p>${rb.recipeTitle }</p>
		<p>${rb.foodName }</p>
		<p>${rb.subhead }</p>
		</div>
	</c:forEach>	
	<input type="submit" value="다음페이지">
	</form>
</body>
</html>
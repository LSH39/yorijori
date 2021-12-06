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
	<div class="main">
		<div id="recipe">
		<div class="mainImg">
		<img src="/resources/upload/recipe/${rb.filepath }">
		<div id="count"><span><img src="/resources/img/recipe/eye.png" width="20px"></span><span id="countText"> ${rb.readCount }</span></div> 
		</div>
		<div class="exWrap">
			<div id="rbList">
			<div class="rbContents">${rb.nickname }</div>
			<div class="rbContents">${rb.recipeTitle }</div>
			<div class="rbContents">${rb.subhead }</div>
			<div class="rbImg"><p><img src="/resources/img/recipe/watch.png" width="20px"></p>${rb.recipeTime } </div>
			<div class="rbImg"><p> <img src="/resources/img/recipe/star.png" width="20px"></p> ${rb.recipeLevel }</div>
			</div>
			<div id="mList">
			<ul >
			<c:forEach items="${rb.MList}" var="m">
				<li>${m.materialName } ${m.MAmount}</li>
			</c:forEach>
			</ul>
			</div>
		</div>
		<c:forEach items="${rb.RList }" var="rc" varStatus="i">
			${rc.recipeContent }
			<img src="/resources/upload/recipeContent/${rc.filepath }" width="100px">
		</c:forEach>
		</div>
	</div>
</body>
</html>
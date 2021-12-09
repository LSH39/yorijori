<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
     
     <style>
        .main{
            width: 1200px;
            margin : 0 auto;
        }
        .main h1{
            text-align: center;
            margin-top: 50px;
            font-size:60px;
        }

    </style>
</head>

<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="main">
    <h1>레시피</h1>

	<div id="recipeList">
		<c:forEach items="${list }" var="rb" varStatus="i">	
	    <p>
	    <c:if test="${sessionScope.m.memberNo == null }">
	    <a href="/recipeView.do?recipeNo=${rb.recipeNo }&memberNo=0"><img src="/resources/upload/recipe/${rb.filepath }"></a>
	    <a href="/recipeView.do?recipeNo=${rb.recipeNo }&memberNo=0">${rb.recipeTitle }</a>
	    </c:if>
	    <c:if test="${sessionScope.m.memberNo != null }">
	    <a href="/recipeView.do?recipeNo=${rb.recipeNo }&memberNo=${sessionScope.m.memberNo}"><img src="/resources/upload/recipe/${rb.filepath }"></a>
	    <a href="/recipeView.do?recipeNo=${rb.recipeNo }&memberNo=${sessionScope.m.memberNo}">${rb.recipeTitle }</a>
	    </c:if>
	    </p>
	    <p>${rb.nickname }</p>
		<p>
		<span>${rb.readCount }</span>
		<span>${rb.recipeTime }</span>
		<span>${rb.recipeLevel }</span>
		</p>
		</c:forEach>
		</div>
	</div>		
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
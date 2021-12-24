<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.row{
text-align: center;}

.col-md-5{
margin: 10px;
padding : 10px;
border: 1px solid black;
border-radius: 10px;
}
.container{
margin-top: 30px;
margin-bottom: 30px;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/admin/sidenavi.jsp" />
	<div class="container">
	
	<div class="row" >
	<div class="col-md-1"></div>
	<div class="col-md-5" style="border :none; text-align: left;">
	
	<h2>순위</h2></div>
	<div class="col-md-5"style="border :none; text-align: left;"></div>
	<div class="col-md-1"></div>
	</div>
	
	
	
	
	<div class="row">
	<div class="col-md-1"></div>
	<div class="col-md-5">
	
	게시물 조회수 순위<br>
	<table class="table table-hover">
	<tr>
	<th>순위</th>
	<th>제목</th>
	<th>조회수</th>
	</tr>
	<c:forEach items="${ranking.fbList }" var="item" varStatus="i" >
	<tr>
	<th>${i.count }</th>
<%-- 	<th> ${item.freeNo} --%>
	<th>${item.freeTitle }</th>
	<th>${item.freeReadcount }
	</th>
	</tr>
	
	</c:forEach>
	
	</table>
	
	
	</div>
	<div class="col-md-5">레시피 조회수 순위<br>
	<table class="table table-hover">
	
	<tr>
	<th>순위</th>
	<th>제목</th>
	<th>조회수</th>
	</tr>
	
	<c:forEach items="${ranking.rbList }" var="item" varStatus="i">
	<tr>
	<th>
	${i.count }
	</th>
	
	<th>
	${item.recipeTitle }
	</th>
	<th>
	${item.readCount }
	</th>
	</tr>
	
	</c:forEach>
	
	</table>
	</div>
	<div class="col-md-1"></div>
	</div>
	
	<div class="row">
	<div class="col-md-1"></div>
	<div class="col-md-5">밀키트 판매 순위<br>
	
	<table class="table table-hover">
	<tr>
	<th>순위</th>
	<th>제목</th>
	<th>판매량</th>
	</tr>
	<c:forEach items="${ranking.milList }" var="item" varStatus="i" >
	<tr>
	<th>
	${i.count }
	</th>
	<th>
	${item.milkitName }
	</th>
	<th>
	${item.milkitStock }
	</th>
	</tr>	
	</c:forEach>
	</table>
	
	</div>
	<div class="col-md-5">팔로워 순위
	<table class="table table-hover"><tr>
	<th>순위</th>
	<th>아이디</th>
	<th>팔로워 수</th>
	</tr>
	
	<c:forEach items="${ranking.fList }" var="item" varStatus="i">
	<tr>
	<th>
	${i.count }
	</th>
	<th>
	${item.memberId }
	</th>
	<th>
	${item.memberPoint }
	</th>
	</tr>
	</c:forEach>
	</table>
	
	</div>
	<div class="col-md-1"></div>
	</div>
	
	
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠킹클래스 목록</title>
<style>
	.page-item.active .page-link {
    	background-color: #9F90CF !important;
    	border-color: #9F90CF !important;
    	color: #fff !important;
    	}
	.page-link {
    	color: #9F90CF !important;
    	}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="container">
		<h1>쿠킹클래스 목록</h1>
		<c:forEach items="${list }" var="ccls" varStatus="i">
		<img src="./resources/img/cookingcls/classtest.jpg" width="300px" height="300px"><br>
		<h5>${i.count }</h5>
		<h5>${ccls.memberNickname }</h5>
		<h5>${ccls.classTitle }</h5>
		<h5>${ccls.classPrice }</h5>
		<a href="/cookingClsView.do?classNo=${ccls.classNo}">클래스 링크임</a>
		</c:forEach>
		<div id="pageNavi">${pageNavi }
			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
  				<a href="/cookingClsWriteFrm.do" class="btn btn-primary me-lg-4" >클래스 작성</a>
  				<c:if test="${not empty sessionScope.m }">
					<a href="/cookingRsrvList.do">예약내역</a>  				
  				</c:if>
  				<a href="/profile.do?memberId=x">회원포르필테스트</a>
			</div>
		</div>
	</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
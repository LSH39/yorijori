<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠킹 클래스 예약 내역</title>
<style>
	td{
		vertical-align:middle;
	}

</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<c:if test="${empty sessionScope.m }">
		<script>
			alert("잘못된 접근입니다.");
			location.href="/";
		</script>
	</c:if>
	<section>
		<div class="container" style="min-height:40.8vh;">
			<div>
			<h1>쿠킹클래스 예약</h1>
			<h5>쿠킹클래스 예약 내역 입니다!</h5>
			<table class="table">
				<tr>
					<th>예약 번호</th>
					<th>강사 닉네임</th>
					<th>클래스 번호</th>
					<th>결제 번호</th>
					<th>클래스 예약 날짜</th>
					<th></th>
				</tr>
				<tr>
					<c:if test="${empty list }">
						<h5>로그인 하세요</h5>
					</c:if>
				</tr>
				<c:forEach items="${list }" var="crsrv">
				<tr>
					<td>${crsrv.rsrvNo }</td>
					<td>${crsrv.memberNo }</td>
					<td>${crsrv.classNo }</td>
					<td>${crsrv.impUid }</td>
					<td>${crsrv.rsrvDate }</td>
					<td><a href="/deleteCookingRsrv.do?classNo=${crsrv.classNo }" class="btn btn-danger btn-sm">취소하기</a></td>
				</tr>
				</c:forEach>

			</table>
			</div>
		</div>
	</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
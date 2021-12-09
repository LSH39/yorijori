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
	
	.vertified{
		background: url('./resources/img/member/sample.png');
    	background-repeat: no-repeat;
	    width: 19px;
    	height: 19px;
	    text-indent: -9999px;
    	display: inline-block;
    	background-position: 0 -368px;
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
				<c:choose>
					<c:when test="${empty list }">
						<h5><a href="/cookingClsList.do?reqPage=1">예약하신 클래스가 존재하지 않습니다! 클래스를 등록하러 가볼까요?</a></h5>
					</c:when>
					<c:otherwise>
						<tr>
							<th>예약 번호</th>
							<th>강사 닉네임</th>
							<th>클래스 번호</th>
							<th>결제 번호</th>
							<th>클래스 예약 날짜</th>
							<th></th>
						</tr>
						<c:forEach items="${list }" var="crsrv">
						<tr>
							<td>${crsrv.rsrvNo }</td>
							<td>${crsrv.memberNickname }<span class="vertified">정품</span></td>
							<td>${crsrv.classNo }</td>
							<td>${crsrv.impUid }</td>
							<td>${crsrv.rsrvDate }</td>
							<td>
							<c:choose>
								<c:when test="${crsrv.cancelFlag eq 1 }">
									<button type="button" class="btn btn-secondary btn-sm">취소완료</button>
									<a href="/deleteCookingRsrv.do?rsrvNo=${crsrv.rsrvNo }" class="btn btn-danger btn-sm">내역삭제</a>
								</c:when>
								<c:otherwise>
									<a href="/cancelCookingRsrv.do?classNo=${crsrv.classNo }" class="btn btn-danger btn-sm">취소하기</a>
								</c:otherwise>
							</c:choose>
							</td>
						</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</table>
			</div>
		</div>
	</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
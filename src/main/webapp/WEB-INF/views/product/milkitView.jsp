<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.3.1.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="main">
		<div id="title">
			<c:forEach items="${list }" var="p">
				<div id="titleImg">
					<img src="/resources/upload/product/${p.filepath }">
				</div>
				<div id="titleTxt">
					<p>${p.milkitName }</p>
					<p>${p.milkitComment }</p>
					<p><fmt:formatNumber value="${p.milkitPrice}"/>원</p>
					<p><span>판매자</span> <span>${p.nickname }</span></p>
					<p id="count"><span>구매수량</span>
					<button id="mi">-</button><span id="amount">1</span><button id="pl">+</button></p>
					<button><a href="#">장바구니</a></button>
				</div>
				
			</c:forEach>
		</div>
	</div>
	<script>
		$("#count>button").click(function() {
			var currAmount = Number($("#amount").html());
			if($(this).html()=="+"){
				$("#amount").html(++currAmount);
			}else{
				if(currAmount != 1){
					$("#amount").html(--currAmount);
				}
			}
		});
	</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
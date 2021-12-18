<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/product/milkitView.css">
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
				<div id="titleText">
					<p id="pName">${p.milkitName }</p>
					<p id="pComment">${p.milkitComment }</p>
					<p id="price"><fmt:formatNumber  value="${p.milkitPrice}"/>원</p>
					<input type="hidden" id="milkitPrice" value="${p.milkitPrice }">
					<hr>
					<p><span class="boldTxt">판매자</span> <span class="thinTxt">${p.nickname }</span></p>
					<p id="order"><span class="boldTxt">구매수량</span>
					<span id="count">
					<button>-</button><span id="amount">1</span><button>+</button></span></p>
					<hr>
					 <p id="amountPrice"><span class="boldTxt">총 상품금액:</span><span id="totalPrice"></span></p>
					<button id="cart"><a href="#">장바구니 담기</a></button>
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
			
			var price = Number($("#milkitPrice").val());
			console.log(price);
			var totalPrice = currAmount*price;
			$("#totalPrice").html(totalPrice.toLocaleString('ko-KR')+"원");
		});
		
	</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
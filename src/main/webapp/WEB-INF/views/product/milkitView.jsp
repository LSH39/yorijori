<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/product/milkitView.css">
<script type="text/javascript"	src="http://code.jquery.com/jquery-3.3.1.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="main">
	<input type="hidden" id="loginCheck" value="${sessionScope.m.memberNo }">
		<div id="title">
			<div id="titleImg">
				<img src="/resources/upload/product/${p.filepath }">
				<c:choose>
					<c:when test="${not empty sessionScope.m }">
						<input type="hidden" name="memberId" class="memberId" value="${sessionScope.m.memberId }">
					</c:when>
				</c:choose>
				<input type="hidden" name="productNo" class="productNo" value="${p.productNo }">
				<c:if test="${sessionScope.m.memberNo == p.milkitWriter }">
				 <p id="update"><a href="/updateMilkit.do?productNo=${p.productNo }">수정</a> <a href="/deleteMilkit.do?productNo=${p.productNo} "> 삭제</a></p>
				 </c:if>
			</div>
			<div id="titleText">
				<p id="pName">${p.milkitName }</p>
				<p id="pComment">${p.milkitComment }</p>
				<p id="price">
					<fmt:formatNumber value="${p.milkitPrice}" />
					원
				</p>
				<input type="hidden" id="milkitPrice" value="${p.milkitPrice }">
				<hr>
				<p>
					<span class="boldTxt">판매자</span> <span class="thinTxt">${p.nickname }</span>
				</p>
				<p id="order">
					<span class="boldTxt">구매수량</span> <span id="count">
						<button>-</button> <span id="amount">1</span>
						<button>+</button>
					</span>
				</p>
				<hr>
				<p id="amountPrice">
					<span class="boldTxt">총 상품금액:</span> <span id="totalPrice"><fmt:formatNumber
							value="${p.milkitPrice}" />원</span>
				</p>
				<c:if test="${p.milkitStock != 0 }">
					<button id="cart">장바구니 담기</button>
				</c:if>
				<c:if test="${p.milkitStock eq 0 }">
					<button id="soldOut">
						<a href="#">일시품절된 상품입니다</a>
					</button>
				</c:if>
			</div>
		</div>
		<div class="viewNavi">
			<ul>
				<li class="view">상품설명</li>
				<li class="view">리뷰</li>
				<li class="view">관련레시피</li>
			</ul>
		</div>
		<div class="pContent">
			<div id="detail">${p.milkitContent}</div>
		</div>
		<div class="review" style="display: none;">
			<c:forEach items="${p.RList }" var="rv">
				<div class="rvContent">
					<div class="star">
						<c:choose>
							<c:when test="${rv.reviewRate eq 1 }">
								<img src="/resources/img/product/star-on.png">
								<img src="/resources/img/product/star-off.png">
								<img src="/resources/img/product/star-off.png">
								<img src="/resources/img/product/star-off.png">
								<img src="/resources/img/product/star-off.png">
							</c:when>
							<c:when test="${rv.reviewRate eq 2 }">
								<img src="/resources/img/product/star-on.png">
								<img src="/resources/img/product/star-on.png">
								<img src="/resources/img/product/star-off.png">
								<img src="/resources/img/product/star-off.png">
								<img src="/resources/img/product/star-off.png">
							</c:when>
							<c:when test="${rv.reviewRate eq 3}">
								<img src="/resources/img/product/star-on.png">
								<img src="/resources/img/product/star-on.png">
								<img src="/resources/img/product/star-on.png">
								<img src="/resources/img/product/star-off.png">
								<img src="/resources/img/product/star-off.png">
							</c:when>
							<c:when test="${rv.reviewRate eq 4}">
								<img src="/resources/img/product/star-on.png">
								<img src="/resources/img/product/star-on.png">
								<img src="/resources/img/product/star-on.png">
								<img src="/resources/img/product/star-on.png">
								<img src="/resources/img/product/star-off.png">
							</c:when>
							<c:otherwise>
								<img src="/resources/img/product/star-on.png">
								<img src="/resources/img/product/star-on.png">
								<img src="/resources/img/product/star-on.png">
								<img src="/resources/img/product/star-on.png">
								<img src="/resources/img/product/star-on.png">
							</c:otherwise>
						</c:choose>
						<span class="reviewDate"> ${rv.reviewDate }</span>
					</div>
					<p class="content">
						<span class="text">${rv.reviewContent }</span> <span class="user"><img
							src="/resources/img/recipe/person.png" width="60px">${rv.memberNickname }</span>
					</p>
					<hr>
				</div>
			</c:forEach>		
			</div>
			<div class="recipe" style="display: none;">
				<hr>
				<c:forEach items="${p.rbList }" var="rb">
					<div class="rbContent">
						<c:if test="${sessionScope.m.memberNo != null}">
							<a
								href="/recipeView.do?recipeNo=${rb.recipeNo }&memberNo=${sessionScope.m.memberNo}">
								<img src="/resources/upload/recipe/${rb.filepath }">
								<p class="rbTitle">${rb.recipeTitle }</p>
								<p class="rbSub">${rb.subhead }</p>
							</a>
						</c:if>
						<c:if test="${sessionScope.m.memberNo == null}">
							<a href="/recipeView.do?recipeNo=${rb.recipeNo }&memberNo=0">
								<img src="/resources/upload/recipe/${rb.filepath }">
								<p class="rbTitle">${rb.recipeTitle }</p>
								<p class="rbSub">${rb.subhead }</p>
							</a>
						</c:if>
						<hr>
					</div>
				</c:forEach>
			</div>
		</div>
		<script>
			var currAmount = 0;
			var totalPrice = 0;
			$("#count>button").click(
					function() {
						currAmount = Number($("#amount").html());
						if ($(this).html() == "+") {
							$("#amount").html(++currAmount);

						} else {
							if (currAmount != 1) {
								$("#amount").html(--currAmount);
							}
						}

						var price = Number($("#milkitPrice").val());
						totalPrice = currAmount * price;
						$("#totalPrice").html(
								totalPrice.toLocaleString('ko-KR') + "원");
					});
			window.onload = function() {
				$(".view").eq(0).css("font-size", "28px");
				$(".view").eq(0).css("background-color", "#9A86B3");
				$(".view").eq(0).css("color", "#6D5874");
			}
			function initTab() {
				var frms = $(".view");
				for (var i = 0; i < frms.length; i++) {
					$(".view").eq(i).css("font-size", "25px");
					$(".view").eq(i).css("background-color", "#C4BFE3");
					$(".view").eq(i).css("color", "#8E44AD");
				}
			}
			function selectOne(i) {
				initTab();
				$(".view").eq(i).css("font-size", "28px");
				$(".view").eq(i).css("background-color", "#9A86B3");
				$(".view").eq(i).css("color", "#6D5874");
			}

			$(".view").eq(0).click(function() {
				selectOne(0);
				$(".pContent").css("display", "block");
				$(".review").css("display", "none");
				$(".recipe").css("display", "none");
			});
			$(".view").eq(1).click(function() {
				selectOne(1);
				$(".pContent").css("display", "none");
				$(".review").css("display", "block");
				$(".recipe").css("display", "none");
			});

			$(".view").eq(2).click(function() {
				selectOne(2);
				$(".pContent").css("display", "none");
				$(".review").css("display", "none");
				$(".recipe").css("display", "block");
			});
			
			//최근 본 상품 기록용
			$(function(){
				var memberId = $(".memberId").val();
				var productNo = $(".productNo").val();
				if(memberId != null){
					$.ajax({
						url: "/insertRecentProduct.do",
						method: "get",
						data: {memberId:memberId, productNo:productNo},
						success: function(data){
							console.log(data);
						}
					});
				}
			});
			$("#cart").click(function() {
				var loginCheck = $("#loginCheck").val();
				var productNo = ${p.productNo};
				
				if(loginCheck == ""){
					alert("로그인 후 이용해주세요");
					$(location).attr("href","/loginFrm.do");	
				}
			});
	
		</script>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
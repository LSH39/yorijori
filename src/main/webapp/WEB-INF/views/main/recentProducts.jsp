<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 - 최근 본 상품</title>
<link rel="stylesheet" href="resources/css/mainpage/common.css">
<!-- 전용 CSS -->
<link rel="stylesheet" href="resources/css/mainpage/RecentProducts.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<script src="resources/summernote/jquery-3.3.1.js"></script>
<main id="main">
		<div class="products-banner">
			<img src="resources/img/mainpage/recent-products.png">
		</div>
      <div class="container">
			<div class="board-content">
	      		<div class="products-outline">
	      			<c:choose>
	      				<c:when test="${not empty list }">
	      					<div>총 <span id="totalCount">${fn:length(list) }</span>개 </div>
	      				</c:when>
	      				<c:otherwise>
	      					<div>아직 본 상품이 없어요.</div>
	      				</c:otherwise>
	      			</c:choose>
	      			<div>
	      			</div>
	      		</div>
	      		<div class="products-content">
	      			<ul>
	      				<c:choose>
	      					<c:when test="${not empty list }">
	      						<c:forEach items="${list }" var="p" varStatus="i">
	      							<li>
	      								<a href="/milkitView.do?productNo=${p.productNo }">
	      									<img src="resources/upload/product/${p.productPath }">
	      									<h4>${p.productName }</h4>
	      									<h5><span class="rContent">${p.productComment }</span></h5>
	      									<h5>
	      									<span class="rLevel">가격 : </span>
	      									<fmt:formatNumber value="${p.productPrice}" pattern="#,###"/>
	      									<span class="rLevel">원</span>
	      									</h5>
	      									<div class="likeCount">
	      										<h5>좋아요</h5>
	      										<i class="bi bi-heart-fill" style="color:#D4A7FF;"></i>
	      										<span>${p.regDate }</span>
	      									</div>
	      								</a>
	      							</li>
	      						</c:forEach>
	      					</c:when>
	      				</c:choose>
	      			</ul>
	      		</div>
	      		<hr>
	      	</div>
	  </div>
  </main><!-- End #main -->
 <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
  <script>
  		
  </script>
</body>
</html>
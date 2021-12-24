<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 - 베스트 레시피</title>
<link rel="stylesheet" href="resources/css/mainpage/common.css">
<!-- 전용 CSS -->
<link rel="stylesheet" href="resources/css/mainpage/BestRecipes.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<script src="resources/summernote/jquery-3.3.1.js"></script>
<main id="main">
		<div class="recipes-banner">
			<video src="resources/img/mainpage/best-recipes.mp4" muted autoplay loop></video>
		</div>
      <div class="container">
			<div class="board-content">
				<div class="recipes-title">
					<h2><span style="border: 5px double #CAB765; padding: 0.3em;">베스트 레시피</span></h2>
				</div>
	      		<div class="recipes-outline">
	      			<c:choose>
	      				<c:when test="${not empty list }">
	      				</c:when>
	      				<c:otherwise>
	      					<div>아직 레시피가 없어요 ㅠㅠ</div>
	      				</c:otherwise>
	      			</c:choose>
	      			<div>
	      			</div>
	      		</div>
	      		<div class="recipes-content">
	      			<ul>
	      				<c:choose>
	      					<c:when test="${not empty list }">
	      						<c:forEach items="${list }" var="r" begin="0" end="11">
	      							<li>
	      								<a href="/recipeView.do?boardNo=${r.recipeNo }&memberNo=0">
	      									<img src="resources/upload/recipe/${r.recipePath }">
	      									<h4>${r.recipeTitle }</h4>
	      									<h5><span class="rContent">${r.recipeContent }</span></h5>
	      									<h5><span class="rLevel">
	      									난이도 :
	      									</span>
	      									<c:choose>
	      										<c:when test="${r.recipeLevel eq 1 }">
	      											하
	      										</c:when>
	      										<c:when test="${r.recipeLevel eq 2 }">
	      											중
	      										</c:when>
	      										<c:otherwise>
	      											상
	      										</c:otherwise>
	      									</c:choose> 
	      									</h5>
	      									<h5><span class="rLevel">요리시간 :</span> <span>${r.recipeTime }</span></h5>
	      									<div class="likeCount">
	      										<h5>좋아요</h5>
	      										<i class="bi bi-heart-fill" style="color:#D4A7FF;"></i>
	      										<span>${r.likeCount }</span>
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
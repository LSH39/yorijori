<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 - 경연대회투표</title>
<link rel="stylesheet" href="resources/css/mainpage/common.css">
<!-- 전용 CSS -->
<link rel="stylesheet" href="resources/css/recipecontest/ContestList.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<script src="resources/summernote/jquery-3.3.1.js"></script>
<main id="main">
		<div class="contest-banner">
	      	<div class="contest-banner-content">
	      		<h2><span class="thisyr"></span>년 <span class="thismonth"></span>월</h2>
	      		<h2>레시피경연대회 온라인 투표</h2><br>
	      		<h5><span style="color:#454545;">참가 및 투표기간:</span> 
	      		<span class="thisyr"></span>.
	      		<span class="thismonth"></span>.01 ~ 
	      		<span class="thisyr"></span>.
	      		<span class="thismonth"></span>.20 자정까지(23:59)
	      		</h5>
	      	</div>
	      	<div class="contest-info">
	      		<a href="#">
	      			<button class="btn-main btn-announce">경연대회 안내</button>
	      		</a>
	      	</div>
	    </div>
      <div class="container">
	      	
			<div class="board-content">
	      		<div class="contest-outline">
	      			<div>총 <span id="totalCount">${totalCount }</span>개</div>
	      			<div>
	      				<c:choose>
	      					<c:when test="${not empty sessionScope.m && sessionScope.m.memberLevel eq 1 || sessionScope.m.memberLevel eq 2 }">
	      					<input type="hidden" class="memberNo" value="${sessionScope.m.memberNo }">
	      					<button class="btn-main btn-enter">대회 참가하기</button>
	      					</c:when>
	      				</c:choose>
	      				<input type="hidden" id="orderIndex" value="${orderIndex }">
	      				<span class="order-by">최신순</span> | <span class="order-by">가나다순</span> | <span class="order-by">높은투표순</span>
	      			</div>
	      		</div>
	      		<div class="contest-content">
	      			<ul>
	      				<c:forEach items="${list }" var="r" varStatus="i">
	      				<li class="recipe">
	      					<a href="/recipeView.do?recipeNo=${r.recipeNo }">
	      						<div class="img-box">
	      							<img src="resources/upload/recipe/${r.recipePath }" style="width:300px;height:320px;">
	      						</div>
	      						<div class="recipe-info">
	      							<div class="recipe-title"><h4>${r.recipeTitle }</h4></div>
	      							<div class="recipe-content" style="color:#454545;">${r.recipeContent }</div>
	      						</div>
	      					</a>
	      					<a href="#">
	      						<div class="recipe-profile">
	      							<div class="profile-pic">
	      								<img src="resources/upload/member_profile/${r.profilePath }">
	      								<h5>${r.memberNickname }</h5>
	      							</div>
	      					</a>
	      							<div class="vote-count">
	      								<c:choose>
	      									<c:when test="${not empty sessionScope.m }">
	      										<div class="vote">
	      											<span>${r.voteCount }</span>
	      											<input type="hidden" class="contestNo" value="${r.contestNo }">
	      											<img src="resources/img/recipecontest/vote-before.png" id="vote">
	      											<label for="vote">투표하기</label>
	      										</div>	
	      									</c:when>
	      									<c:otherwise>
	      										<div class="vote">
	      											<span>${r.voteCount }</span>
	      											<input type="hidden" class="contestNo" value="${r.contestNo }">
	      											<img src="resources/img/recipecontest/vote-before.png" id="vote">
	      										</div>	
	      									</c:otherwise>
	      								</c:choose>
	      							</div>
	      						</div>
	      					</a>
	      				</li>
	      				</c:forEach>
	      			</ul>
	      		</div>
	      		<div class="pagi">
	      			${pageNavi }
	      		</div>
	      		<hr>
	      		<form action="/recipeContestSearch.do" method="get">
					<div class="board-search row">
						<div class="col-9">
							검색어 
								<input type="radio" id="searchtype-1" name="searchtype" class="searchtype" value="title">
								<label for="searchtype-1">제목</label>
								<input type="radio" id="searchtype-2" name="searchtype" class="searchtype" value="content">
								<label for="searchtype-2">내용</label>
								<input type="radio" id="searchtype-3" name="searchtype" class="searchtype" value="writerId">
								<label for="searchtype-3">작성자(ID)</label>
								<input type="radio" id="searchtype-4" name="searchtype" class="searchtype" value="writerNickname">
								<label for="searchtype-4">작성자(닉네임)</label>
						</div>
						<div class="col">
							<input type="search" class="tk-search" name="searchword">
							<button class="btn-main btn-search my-2 my-sm-0" type="submit"><img src="resources/img/mainpage/search_icon_w.png" style="width: 25px; height: 25px;"></button>
						</div>
					</div>
					</form>
					
				<!-- 모달창 부분 대회 참가 -->
					<div class="enter-contest modal fade" id="enterModal" tabindex="-1" data-bs-backdrop="static" data-bs-keyboard="false" aria-labelledby="enterModalLabel" aria-hidden="true">
					  <div class="modal-dialog modal-xl" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="enterModalLabel" style="color:#8E44AD;">참가할 레시피 목록</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true"></span>
					        </button>
					      </div>
					      <div class="modal-body">
								<input type="hidden" name="memberNo" value="${sessionScope.m.memberNo }">
									<table class="table table-hover">
										<thead>
											<tr class="table-secondary">
												<th scope="col">선택</th>
												<th scope="col">이미지</th>
												<th scope="col">제목</th>
												<th scope="col">음식이름</th>
												<th scope="col">내용</th>
												<th scope="col">조회수</th>
												<th scope="col">작성일</th>
												<th scope="col">참가여부</th>
											</tr>
										</thead>
										<tbody>
										
										</tbody>
									</table>
									<input type="hidden" name="enteredNo" value='0'>
					      </div>
					      <div class="modal-footer">
					        <input type="submit" class="recipeSubmit btn-main" value="레시피 등록">
					        <button type="button" class="btn-main btn-delete" data-bs-dismiss="modal">취소</button>
					      </div>
					    </div>
					  </div>
					</div>
	      	</div>
  </main><!-- End #main -->
 <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
  <script>
  		
  </script>
</body>
</html>
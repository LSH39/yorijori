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
		<div class="christmas-lights">
	      		<ul class="lightrope">
				  <li></li>
				  <li></li>
				  <li></li>
				  <li></li>
				  <li></li>
				  <li></li>
				  <li></li>
				  <li></li>
				  <li></li>
				  <li></li>
				  <li></li>
				  <li></li>
				  <li></li>
				  <li></li>
				  <li></li>
				  <li></li>
				  <li></li>
				  <li></li>
				  <li></li>
				  <li></li>
				  <li></li>
				  <li></li>
				  <li></li>
				  <li></li>
				  <li></li>
				  <li></li>
				  <li></li>
				  <li></li>
				  <li></li>
				  <li></li>
				  <li></li>
				  <li></li>
				  <li></li>
				 </ul>
	    </div>
		<div class="contest-banner">
	      	<div class="contest-banner-content">
	      		<h2><span class="thisyr"></span>년 <span class="thismonth"></span>월</h2>
	      		<h2>레시피경연대회 온라인 투표</h2><br>
	      		<h5><span style="color:black;">참가 및 투표기간:</span> 
	      		<span class="thisyr"></span>.
	      		<span class="thismonth"></span>.01 ~ 
	      		<span class="thisyr"></span>.
	      		<span class="thismonth"></span>.15 자정까지(23:59)
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
	      					<c:when test="${not empty sessionScope.m }">
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
	      								<img src="#">
	      								<h5>${r.memberNickname }</h5>
	      							</div>
	      					</a>
	      							<div class="vote-count">
	      								<span>${r.voteCount }</span>
	      								<c:choose>
	      									<c:when test="${not empty sessionScope.m }">
	      										<div class="vote">
	      											<input type="hidden" class="contestNo" value="${r.contestNo }">
	      											<img src="resources/img/recipecontest/vote-before.png" id="vote">
	      											<label for="vote">투표하기</label>
	      										</div>	
	      									</c:when>
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
	      	</div>
  </main><!-- End #main -->
 <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
  <script>
  	$(function(){
  		//현재 날짜 가져오기 (년/월)
  		var today = new Date();
  		var year = today.getFullYear();
  		var month = today.getMonth()+1;
  		var voted = false; //투표여부 확인
  		$(".thisyr").html(year);
  		$(".thismonth").html(month);
  		//정렬 default
  		var orderIndex = $("#orderIndex").val();
  		$(".order-by").eq(orderIndex).addClass("active");
  		
  		//정렬기준
  		$(".order-by").on("click", function(){
  			var index = $(".order-by").index(this);
  			var reqPage = 1;
  			var body = $(".contest-content").children("ul");
  			var totalCount = $("#totalCount");
  			console.log(index);
  			location.href="contestList.do?reqPage="+reqPage+"&orderIndex="+index;
  		});
  		
  		//접속자 투표여부 확인
  		var memberNo = $(".memberNo").val();
  		if(memberNo != null){
  	 		$.ajax({
				url: "/voteCheck.do",
				type: "get",
				data: {memberNo:memberNo},
				success: function(data){
					if(data > 0){
						var contestNo = data;
						var vote = $('.contestNo[value='+contestNo+']').parent('div');
						console.log(vote);
						console.log(img);
						var img = vote.children('img');
						var label = vote.children("label[for='vote']");
						img.attr("src", "");
						img.attr("src", "resources/img/recipecontest/vote-after.png");
						label.html("");
						label.html("투표완료");
						label.css("color", "#8E44AD").css("font-weight", "bolder");
						voted= true;
				}
				}
		
  			});
  		}
  		
  		
  		//투표 or 투표 취소
  		$(".vote").on("click", function(){
  			var voteRecipe_ans = confirm("투표하시겠습니까?");
  			var memberNo = $(".memberNo").val();
  			var contestNo = $(this).children(".contestNo").val();
  			console.log(contestNo);
  			if(voteRecipe_ans == true){
  				if (voted == false){
  					location.href="/insertVote.do?contestNo="+contestNo+"&memberNo="+memberNo;
  					voted = true;
  				} else {
  					alert("이미 투표하셨습니다.");
  				}
  			}else {
  				return false;
  			}
  		});
  		
  		
  		});
  		
  	//게시글 삭제 확인
  	function delCheck(){
  		var delNotice_ans = confirm("게시글을 삭제하시겠습니까?");
  		var noticeNo = $("#noticeNo").val();
  		if(delNotice_ans == true){
			location.href="/deleteNotice.do?noticeNo="+noticeNo;
		} else {
			return false;
		}
  	}
  </script>
</body>
</html>
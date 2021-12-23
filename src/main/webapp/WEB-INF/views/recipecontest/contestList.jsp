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
	      		<a href="/contestInfo.do">
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
	      					<a href="/profile.do?memberId=${r.memberId }">
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
											<tr class="table-th">
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
  	$(function(){
  		//현재 날짜 가져오기 (년/월)
  		var today = new Date();
  		var year = today.getFullYear();
  		var month = today.getMonth()+1;
  		var voted = false; //투표여부 확인
  		var written = false; //레시피 작성여부 확인

  		
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
  		
		//레시피 목록 가져오기
		if(memberNo != null){
			$.ajax({
				url: "/getRecipeList.do",
				type: "get",
				data: {memberNo:memberNo, year:year, month:month},
				success: function(data){
					var list = data;
					if(list.length == 0){
						written = false;	
					} else {
						written = true;
						for(var i=0;i<list.length;i++){
							var tbody = $("#enterModal").find("tbody");
							var table = "<tr><th scope='row'><input type='radio' name='recipeNo' value='"+list[i].recipeNo+"'><th scope='row'><img src='resources/upload/recipe/"+list[i].filepath+"' style='width:50px;height:50px;'></th><th scope='row'>"+list[i].recipeTitle+"</th><th scope='row'>"+list[i].foodName+"</th><th scope='row'>"+list[i].recipeContent+
  							"</th><th scope='row'>"+list[i].readCount+"</th><th scope='row'>"+list[i].recipeDate+"</th>";
  								if(list[i].enterDate != null){
  									var html = "<th scope='row' class='entered' style='color:#8E44AD;'>참가중</th></tr><input type='hidden' name='enteredNo' value='"+list[i].recipeNo+"'>";
	  								table += html;
  								} else {
  									var html = "<th scope='row'></th></tr>";
	  								table += html;
  								}
  								tbody.append(table);
						}	
  							
						}
					}
					
				});
		}
		
		$(".recipeSubmit").on("click", function(){
			var selected = $("#enterModal").find("input[type='radio']:checked").val();
			var entered = $("input[name='enteredNo']").val();
			if(selected == null){
				alert("레시피를 선택해주세요!");
				return false;
			}else {
				var submit_ans = confirm("해당 레시피로 참가하시겠습니까? 기존의 참가한 레시피는 무효화됩니다.");
				if(submit_ans == false){
					return false;
				} else {
					location.href="/insertContestRecipe.do?recipeNo="+selected+"&enteredNo="+entered;
				}
		}
		
		});
								
  	
  		$(".btn-enter").on("click", function(){
  			if(written == false){
  				alert("작성하신 레시피가 아직 없습니다.");
  			} else {
  				$("#enterModal").modal('show');
  			}
  		});
  		
  		
  		//투표 or 투표 취소
  		$(".vote").on("click", function(){
  			var memberNo = $(".memberNo").val();
  			var contestNo = $(this).children(".contestNo").val();
  			if(memberNo == null){
  				alert("로그인시 투표가 가능합니다.");
  				return false;
  			}
  			var voteRecipe_ans = confirm("투표하시겠습니까?");
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
  		
  		//검색어 선택 확인
  		$(".btn-search").on("click", function(){
			var radioSearch = $("input[name='searchtype']").is(":checked");
			if(radioSearch != true){
				alert("검색어 선택 후 버튼을 눌러주세요!");
				return false;
			}
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
  	
  	});
  </script>
</body>
</html>
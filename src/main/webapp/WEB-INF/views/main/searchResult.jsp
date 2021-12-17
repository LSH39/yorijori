<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 - 검색결과</title>
<link rel="stylesheet" href="resources/css/mainpage/common.css">
<!-- 전용 css -->
<link rel="stylesheet" href="resources/css/mainpage/SearchResult.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<script src="resources/summernote/jquery-3.3.1.js"></script>
<main id="main">
      <div class="container">
		  	<div class="result-banner">
		      	<div class="result-banner-content">
		      	</div>
		    </div>
			<div class="board-content">
				<div class="title"><h2>검색결과</h2></div>
	      		<div class="result-outline">
	      			<div>총 <span id="totalCount">${fn:length(recipeList) }</span>개</div>
	      			<div>
	      				<input type="hidden" id="orderIndex" value="${orderIndex }">
	      				<span style="margin-right:10px;">항목</span><button class="btn-main select-type">레시피</button> <button class="btn-main select-type">밀키트</button> <button class="btn-main select-type">회원</button> <button class="btn-main select-type">클래스</button> <button class="btn-main select-type">게시판</button>
	      			</div>
	      		</div><hr>
	      		<div class="result-content recipeList">
	      				<c:choose>
	      					<c:when test="${not empty recipeList }">
		      					<ul>
		      						<c:forEach items="${recipeList }" var="r" varStatus="i">
		      							<li>
		      								<a href="/recipeView.do?recipeNo=${r.recipeNo }">
		      									<div class="recipePic"><img src="resources/upload/recipeboard/${r.filepath }" style="width: 150px;height:150px;"></div>
		      									<div class="recipeTitle"><h5>${r.recipeTitle }</h5></div>
		      								</a>
		      							</li>
		      						</c:forEach>
		      					</ul>	
	      					</c:when>
	      					<c:otherwise>
	      						<div class="no-result">
	      						<h4>검색결과가 없습니다.</h4>
	      						</div>
	      					</c:otherwise>
	      				</c:choose>
	      		</div>
	      		<div class="result-content productList">
	      				<c:choose>
	      					<c:when test="${not empty productList }">
		      					<ul>
		      						<c:forEach items="${productList }" var="p" varStatus="i">
		      							<li>
		      								<a href="/productView.do?productNo=${p.productNo } }">
		      									<div class="recipePic"><img src="resources/upload/product/${p.filepath }" style="width: 150px;height:150px;"></div>
		      									<div class="recipeTitle"><h5>${p.milkitName }</h5></div>
		      								</a>
		      							</li>
		      						</c:forEach>
		      					</ul>	
	      					</c:when>
	      					<c:otherwise>
	      						<div class="no-result">
	      						<h4>검색결과가 없습니다.</h4>
	      						</div>
	      					</c:otherwise>
	      				</c:choose>
	      		</div>
	      		<div class="result-content memberList">
	      				<c:choose>
	      					<c:when test="${not empty memberList }">
		      					<ul>
		      						<c:forEach items="${memberList }" var="m" varStatus="i">
		      							<li>
		      								<a href="/recipeView.do?recipeNo=${m.memberNo }">
		      									<div class="recipePic"><img src="https://img.icons8.com/officel/80/000000/cooking-pot.png"/></div>
		      									<div class="recipeTitle"><h5>${m.memberId }</h5></div>
		      									<div class="recipeTitle"><h5>${m.memberNickname }</h5></div>
		      								</a>
		      							</li>
		      						</c:forEach>
		      					</ul>	
	      					</c:when>
	      					<c:otherwise>
	      						<div class="no-result">
	      						<h4>검색결과가 없습니다.</h4>
	      						</div>
	      					</c:otherwise>
	      				</c:choose>
	      		</div>
	      		<div class="result-content classList">
	      				<c:choose>
	      					<c:when test="${not empty classList }">
		      					<ul>
		      						<c:forEach items="${classList }" var="c" varStatus="i">
		      							<li>
		      								<a href="/classView.do?classNo=${c.classNo }">
		      									<div class="recipePic"><img src="resources/upload/recipeboard/${r.filepath }" style="width: 150px;height:150px;"></div>
		      									<div class="recipeTitle"><h5>${c.classTitle }</h5></div>
		      									<div class="recipeTitle"><h6>평점 : ${c.classRate }</h6></div>
		      									<div class="recipeTitle"><h6>시작일 : ${c.classTitle }</h6></div>
		      									<div class="recipeTitle"><h5>상태 : ${c.classStatus }</h5></div>
		      								</a>
		      							</li>
		      						</c:forEach>
		      					</ul>	
	      					</c:when>
	      					<c:otherwise>
	      						<div class="no-result">
	      						<h4>검색결과가 없습니다.</h4>
	      						</div>
	      					</c:otherwise>
	      				</c:choose>
	      		</div>
	      		<div class="result-content freeList">
	      				<c:choose>
	      					<c:when test="${not empty freeList }">
		      					<ul>
		      						<c:forEach items="${freeList }" var="f" varStatus="i">
		      							<li>
		      								<a href="/freeView.do?freeNo=${f.freeNo }">
		      									<div class="recipeTitle"><h5>${f.freeTitle }</h5></div>
		      									<div><h6>${f.memberNickname }</h6></div>
		      								</a>
		      							</li>
		      						</c:forEach>
		      					</ul>	
	      					</c:when>
	      					<c:otherwise>
	      						<div class="no-result">
	      						<h4>검색결과가 없습니다.</h4>
	      						</div>
	      					</c:otherwise>
	      				</c:choose>
	      		</div>
	      		<hr>
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
  		//검색 default
  		$(".select-type").eq(0).addClass("active");
  		$(".result-content").hide();
  		$(".result-content").eq(0).show();
  		
  		//정렬기준
  		$(".select-type").on("click", function(){
  			var index = $(".select-type").index(this);
  			var totalCount = $("#totalCount");
  			$(".select-type").removeClass("active");
  			$(this).addClass("active");
  			$(".result-content").hide();
  			$(".result-content").eq(index).show();
  			switch(index){
  			case 0:
  				var html = "<c:choose><c:when test='${not empty recipeList}'>${fn:length(recipeList)}</c:when><c:otherwise>0</c:otherwise></c:choose>";
  				totalCount.html(html);
  				break;
  			case 1:
  				var html = "<c:choose><c:when test='${not empty productList}'>${fn:length(productList)}</c:when><c:otherwise>0</c:otherwise></c:choose>";
  				totalCount.html(html);
  				break;
  			case 2:
  				var html = "<c:choose><c:when test='${not empty memberList}'>${fn:length(memberList)}</c:when><c:otherwise>0</c:otherwise></c:choose>";
  				totalCount.html(html);
  				break;
  			case 3:
  				var html = "<c:choose><c:when test='${not empty classList}'>${fn:length(classList)}</c:when><c:otherwise>0</c:otherwise></c:choose>";
  				totalCount.html(html);
  				break;
  			case 4:
  				var html = "<c:choose><c:when test='${not empty freeList}'>${fn:length(freeList)}</c:when><c:otherwise>0</c:otherwise></c:choose>";
  				totalCount.html(html);
  				break;
  			default:
  				break;
  			}
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
  		
  		//검색어 선택 확인
  		$(".btn-search").on("click", function(){
			var radioSearch = $("input[name='searchtype']").is(":checked");
			if(radioSearch != true){
				alert("검색어 선택 후 버튼을 눌러주세요!");
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
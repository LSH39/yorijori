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
      <div class="container">
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
				 </ul>
	      	</div>
	      	<div class="contest-banner">
	      	</div>
	      	<div class="contest-banner-content">
	      		<h2><span class="thisyr"></span>년 <span class="thismonth"></span>월</h2>
	      		<h2>레시피경연대회 온라인 투표</h2><br>
	      		<h5><span style="color:#454545;">참가 및 투표기간:</span> 
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
			<div class="board-content">
	      		<div class="contest-outline">
	      			<div>총 <span id="totalCount">${totalCount }</span>개</div>
	      			<div>
	      				<button class="btn-main btn-enter">대회 참가하기</button>
	      				<span class="order-by active">최신순</span> | <span class="order-by">가나다순</span> | <span class="order-by">높은투표순</span>
	      			</div>
	      		</div>
	      		<div class="contest-content">
	      			<ul>
	      				<li class="recipe">
	      					<a href="#">
	      						<div class="img-box">
	      							<img src="#" style="width:300px;height:320px;">
	      						</div>
	      						<div class="recipe-info">
	      							<div class="recipe-title"><h4>레시피 제목</h4></div>
	      							<div class="recipe-content">레시피에 대한 설명</div>
	      						</div>
	      						<div class="recipe-profile">
	      							<div class="profile-pic">
	      								<img src="#">
	      								<h5>아이디</h5>
	      							</div>
	      							<div class="vote-count">
	      								<span>투표수</span>
	      								<img src="#" id="vote">
	      								<label for="vote">투표하기</label>
	      							</div>
	      						</div>
	      					</a>
	      				</li>		
	      			</ul>
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
  		console.log(year);
  		console.log(month);
  		$(".thisyr").html(year);
  		$(".thismonth").html(month);
  		
  	});
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
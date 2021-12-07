<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 - 경연대회투표</title>
<link rel="stylesheet" href="resources/css/mainpage/common.css">
<link rel="stylesheet" href="resources/css/freeboard/BoardList.css">
<link rel="stylesheet" href="resources/css/notice/noticeList.css">
<link rel="stylesheet" href="resources/css/notice/boardView.css">
<!-- 전용 CSS -->
<link rel="stylesheet" href="resources/css/recipecontest/contestList.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<script src="resources/summernote/jquery-3.3.1.js"></script>
<main id="main">
    <section class="inner-page">
      <div class="container">
      	<div class="row">
	      	<div class="main-content">
	      		<div class="content-title">
	      			<h2><span class="thisyr"></span>년 <span class="thismonth"></span>월</h2>
	      			<h4>레시피경연대회 온라인 투표</h4>
	      		</div>
				<div class="board-content">
	      			
	      		</div>
	      		<div class="backTo">
	      			<a href="#"><button class="btn-main btn-update">수정하기</button></a>
	      			<button class="btn-main btn-delete" onclick='delCheck();'>삭제하기</button>
	      			<button class="btn-main">목록으로</button>
	      		</div>
	      		</div>
	      	</div>
	      </div>
    </section>
  </main><!-- End #main -->
  <script>
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
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
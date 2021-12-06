<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공자사항 - 게시글 상세보기</title>
<link rel="stylesheet" href="resources/css/mainpage/common.css">
<link rel="stylesheet" href="resources/css/freeboard/BoardList.css">
<link rel="stylesheet" href="resources/css/notice/noticeList.css">
<link rel="stylesheet" href="resources/css/notice/Notice.css">
<!-- 페이지 전용 CSS -->
<link rel="stylesheet" href="resources/css/notice/boardView.css">
<link rel="stylesheet" href="resources/summernote/summernote-lite.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<script src="resources/summernote/jquery-3.3.1.js"></script>
<script src="resources/summernote/summernote-lite.js"></script>
<script src="resources/summernote/lang/summernote-ko-KR.js"></script>
<main id="main">
    <section class="inner-page">
      <div class="container">
      	<div class="row">
	      	<div class="main-content">
	      		<div class="content-title">
	      			<h2>공지게시판</h2>
	      			<h5>요리조리의 새로운 소식과 유용한 정보를 한 곳에서 확인하세요.</h5>
	      		</div>
				<div class="view-content">
	      			<div class="form-group row">
	      				<label for="noticeTitle" class="col-sm-2 col-form-label">제목</label>
	      				<input type="hidden" value="${n.noticeNo }" id="noticeNo">
	      				<div class="col-sm-4">
	      					<input type="text" readonly class="form-control-plaintext" id="noticeTitle" name="noticeTitle" value="${n.noticeTitle }">
	      				</div>
	      			</div>
	      			<div class="form-group row">
	      				<label for="noticeWriter" class="col-sm-2 col-form-label">작성자</label>
	      				<div class="col-sm-4">
	      					<input type="text" readonly class="form-control-plaintext" name="noticeWriter" id="noticeWriter" value="${n.noticeWriter }">
	      				</div>
	      				<label for="filename" class="col-sm-2 col-form-label">첨부파일</label>
	      				<div class="col-sm-4">
	      					<c:choose>
								<c:when test="${not empty n.filename }">
								<i class="bi bi-file-arrow-down"></i>
								<a href="/fileDownNotice.do?noticeNo=${n.noticeNo }">${n.filename }</a>
								</c:when>
								<c:otherwise>
								<i class="bi bi-x-square-fill"></i>
								<span>첨부파일이 없습니다.</span>
								</c:otherwise>
							</c:choose>					
	      				</div>
	      			</div>
	      			<div class="form-group row">
	      				<label for="regDate" class="col-sm-2 col-form-label">작성일</label>
	      				<div class="col-sm-4">
	      					<input type="text" readonly class="form-control-plaintext" name="regDate" id="regDate" value="${n.regDate }">
	      				</div>
	      				<label for="readCount" class="col-sm-2 col-form-label">조회수</label>
	      				<div class="col-sm-4">
	      					<input type="text" readonly class="form-control-plaintext" name="readCount" id="readCount" value="${n.noticeReadcount }">
	      				</div>
	      			</div>
	      			<div class="form-group row">
	      				<div class="col-sm-12">
	      				<textarea readonly class="form-control-plaintext" name="noticeContent" id="noticeContent" rows="20">${n.noticeContent }</textarea>
						</div>	      			
	      			</div>
	      		</div>
	      		<div class="backTo">
	      			<a href="/noticeUpdateFrm.do?noticeNo=${n.noticeNo }"><button class="btn-main btn-update">수정하기</button></a>
	      			<button class="btn-main btn-delete" onclick='delCheck();'>삭제하기</button>
	      			<a href="/noticeList.do?reqPage=1"><button class="btn-main">목록으로</button></a>
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
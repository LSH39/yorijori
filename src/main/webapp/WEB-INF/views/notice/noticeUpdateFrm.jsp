<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공자사항 - 게시글 수정하기</title>
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
<script>
	$(function(){
		$("#noticeContent").summernote({
			height : 400,
			lang : "ko-KR",
			callbacks : {
				onImageUpload : function(files){
					uploadImage(files[0],this);
				}
			}
		});
	});
	function uploadImage(file,editor){
		//form과 같은 효과를 내는 객체생성
		var form = new FormData();
		form.append("file",file);
		$.ajax({
			url : "/uploadImageNotice",
			type : "post",
			data : form,
			processData : false,
			contentType : false,
			success : function(data){
				//결과로받은 업로드 경로를 이용해서 에디터에 이미지 추가
				$(editor).summernote("insertImage",data);
			}
		});
		//processDate : 기본값이 true
		//            -> 파일전송시 String이 아닌 파일 형태로 전송하기위해서 기본설정을 제거
		//contentType : 기본값 "application/x-wwww.form-urlencoded;charset=UTF-8"
		//			  -> 파일전송시 enctype : "multipart/form-data"로 변환하기 위해 기본값 제거
	}
</script>
<main id="main">
    <section class="inner-page">
      <div class="container">
      	<div class="row">
	      	<div class="main-content">
	      		<div class="content-title">
	      			<h2>공지게시판</h2>
	      			<h5>요리조리의 새로운 소식과 유용한 정보를 한 곳에서 확인하세요.</h5>
	      		</div>
				<form action="/noticeUpdate.do" method="post" enctype="multipart/form-data">
	      			<div class="form-group row">
	      				<label for="noticeTitle" class="col-sm-2 col-form-label">제목</label>
	      				<input type="hidden" value="${n.noticeNo }" id="noticeNo">
	      				<div class="col-sm-4">
	      					<input type="text" class="form-control" id="noticeTitle" name="noticeTitle" value="${n.noticeTitle }">
	      				</div>
	      			</div>
	      			<div class="form-group row">
	      				<label for="noticeWriter" class="col-sm-2 col-form-label">작성자</label>
	      				<div class="col-sm-4">
	      					<input type="text" readonly class="form-control-plaintext" name="noticeWriter" id="noticeWriter" value="${n.noticeWriter }">
	      				</div>
	      				<label for="filename" class="col-sm-2 col-form-label">첨부파일</label>
	      				<div class="col-sm-4">
	      					<input type="hidden" name="status" value="1">
							<c:choose>
								<c:when test="${not empty n.filename }">
								<i class="bi bi-trash-fill"></i>
								<span class="delFile">${n.filename }</span>
								<button type="button" id="delBtn" class="btn btn-primary btn-sm delFile">삭제</button>
								<input type="file" name="upfile" style="display:none;">
								<input type="hidden" name="oldFilename" value="${n.filename }">
								<input type="hidden" name="oldFilepath" value="${n.filePath }">									
								</c:when>
								<c:otherwise>
									<input type="file" name="upfile">
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
	      				<textarea class="form-control" name="noticeContent" id="noticeContent" rows="20">${n.noticeContent }</textarea>
						</div>	      			
	      			</div>
	      		<div class="backTo">
	      			<button class="btn-main btn-update" type="submit">수정완료</button>
	      			<button class="btn-main btn-delete" onclick='delCheck();'>삭제하기</button>
	      			<a href="/noticeList.do?reqPage=1"><button class="btn-main">목록으로</button></a>
	      		</div>
	      		</form>
	      		</div>
	      	</div>
	      </div>
    </section>
  </main><!-- End #main -->
  <script>
	  $(function(){
			$("#noticeContent").summernote({
				height : 400,
				lang : "ko-KR",
				callbacks : {
					onImageUpload : function(files){
						uploadImage(files[0],this);
					}
				}
			});
		});
		function uploadImage(file,editor){
			var form = new FormData();
			form.append("file",file);
			$.ajax({
				url : "/uploadNoticeImage.do",
				type : "post",
				data : form,
				processData : false,
				contentType : false,
				success : function(data){
					$(editor).summernote("insertImage",data);
				}
			});
		}
  	function delCheck(){
  		var delNotice_ans = confirm("게시글을 삭제하시겠습니까?");
  		var noticeNo = $("#noticeNo").val();
  		if(delNotice_ans == true){
			location.href="/deleteNotice.do?noticeNo="+noticeNo;
		} else {
			return false;
		}
  	}
  	$("#delBtn").click(function(){
		$(".delFile").hide();
		$(this).next().show();
		$("[name=status]").val(2);
	});
  </script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
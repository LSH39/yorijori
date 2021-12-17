<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공자사항 - 게시글 작성</title>
<link rel="stylesheet" href="resources/css/mainpage/common.css">
<link rel="stylesheet" href="resources/css/freeboard/BoardList.css">
<link rel="stylesheet" href="resources/css/notice/noticeList.css">
<!-- 페이지 전용 CSS -->
<link rel="stylesheet" href="resources/css/notice/Notice.css">
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
	      			<h5>게시글 작성하기</h5>
	      		</div>
	      		<form action="/insertNotice.do" method="post" enctype="multipart/form-data">
	      			<div class="form-group row">
	      				<label for="inputTitle" class="col-sm-2 col-form-label">제목</label>
	      				<div class="col-sm-4">
	      					<input type="text" class="form-control" id="inputTitle" name="noticeTitle" placeholder="제목">
	      				</div>
	      				<label for="fileUpload" class="col-sm-2 col-form-label">첨부파일</label>
	      				<div class="col-sm-4">
	      					<input type="file" class="form-control" id="fileUpload" name="upfile" accept=".gif, .jpg, .png, .jpeg">
	      				</div>
	      			</div>
	      			<div class="form-group row fixed">
	      				<label for="noticeWriter" class="col-sm-2 col-form-label">작성자</label>
	      				<div class="col-sm-4">
	      					<input type="text" readonly class="form-control-plaintext" name="noticeWriter" id="noticeWriter" value="${sessionScope.m.memberId }">
	      				</div>
	      				<label for="fixedNotice" class="col-sm-2 col-form-label">고정글</label>
	      				<div class="col-sm-4">
	      					<input type="checkbox" id="fixedNotice" name="noticePriority" value='y'>
	      					<input type="hidden" name="noticePriority" id="fixedNoticeHidden" value='n'>
	      				</div>
	      			</div>
	      			<div class="form-group row">
	      				<label for="content" class="col-sm-2 col-form-label">내용</label>
	      				<div class="col-sm-10">
	      				<textarea class="form-control" name="noticeContent" id="content" rows="20"></textarea>
						</div>	      			
	      			</div>
	      			<div class="form-group submitFrm">
	      				<button class="btn-main" type="submit">등록하기</button>
	      			</div>
	      		</form>
	      		<div class="backTo">
	      			<a href="/noticeList.do?reqPage=1"><button class="btn-main">목록으로</button></a>
	      		</div>
	      		</div>
	      	</div>
	      </div>
    </section>
  </main><!-- End #main -->
  <script>
		$(function(){
			$("#content").summernote({
				height : 400,
				lang : "ko-KR",
				callbacks : {
					onImageUpload : function(files){
						uploadImage(files[0],this);
					}
				}
			});
			
			//파일 용량 제한
			$("input[type='file']").off().on("change", function(){
				if (this.files && this.files[0]) {
					var maxSize = 10 * 1024 * 1024;
					var fileSize = this.files[0].size;
					console.log(fileSize);

					if(fileSize > maxSize){
						alert("첨부파일 사이즈는 10MB 이내로 등록 가능합니다.");
						$(this).val('');
						return false;
					}
				}
			});
			
			function uploadImage(file,editor){
				var form = new FormData();
				form.append("file",file);
				$.ajax({
					url : "/uploadNoticeImage.do",
					type : "post",
					data : form,
					enctype : 'multipart/form-data',
					processData : false,
					contentType : false,
					success : function(data){
						$(editor).summernote("insertImage",data);
					}
				});
			}
			
			$("#fixedNotice").on("change", function(){
				if($(this).prop('checked')){
					$("#fixedNoticeHidden").prop("disabled", true);
				} else {
					$("#fixedNoticeHidden").prop("disabled", false);
				}
			})
			

		});
	</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
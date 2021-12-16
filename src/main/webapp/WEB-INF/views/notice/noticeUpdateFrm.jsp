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
<link rel="stylesheet" href="resources/css/notice/NoticeUpdateFrm.css">
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
	      			<h5>게시글 수정하기</h5>
	      		</div>
				<form action="/noticeUpdate.do" method="post" enctype="multipart/form-data">
	      			<div class="form-group row">
	      				<label for="noticeTitle" class="col-sm-2 col-form-label">제목</label>
	      				<input type="hidden" name="noticeNo" value="${n.noticeNo }" id="noticeNo">
	      				<div class="col-sm-4">
	      					<input type="text" class="form-control" id="noticeTitle" name="noticeTitle" value="${n.noticeTitle }">
	      				</div>
	      				<label for="filename" class="col-sm-2 col-form-label">첨부파일</label>
	      				<div class="col-sm-4">
	      					<input type="hidden" name="status" value="1">
							<c:choose>
								<c:when test="${not empty n.filename }">
								<div>
								<i class="bi bi-trash-fill"></i>
								<span class="delFile">${n.filename }</span>
								<button type="button" id="delBtn" class="btn btn-update btn-sm delFile">삭제</button>
								</div>
								<input type="file" name="upfile" style="display:none;">
								<input type="hidden" name="oldFilename" value="${n.filename }">
								<input type="hidden" name="oldFilepath" value="${n.filepath }">									
								</c:when>
								<c:otherwise>
									<input type="file" name="upfile">
								</c:otherwise>
							</c:choose>
	      				</div>
	      			</div>
	      			<div class="form-group row fixed">
	      				<label for="noticeWriter" class="col-sm-2 col-form-label">작성자</label>
	      				<div class="col-sm-4">
	      					<input type="text" readonly class="form-control-plaintext" name="noticeWriter" id="noticeWriter" value="${n.noticeWriter }">
	      				</div>
	      				<label for="fixedNotice" class="col-sm-2 col-form-label">고정글</label>
	      				<div class="col-sm-4">
	      					<c:choose>
	      						<c:when test="${n.noticePriority eq 'y' }">
	      							<input type="checkbox" id="fixedNotice" name="noticePriority" value='y' checked>
	      							<input type="hidden" name="noticePriority" id="fixedNoticeHidden" value='n' disabled>
	      						</c:when>
	      						<c:otherwise>
	      							<input type="checkbox" id="fixedNotice" name="noticePriority" value='y'>
	      							<input type="hidden" name="noticePriority" id="fixedNoticeHidden" value='n'>
	      						</c:otherwise>
	      					</c:choose>
	      				</div>
	      			</div>
	      			<div class="form-group row">
	      				<label for="content" class="col-sm-2 col-form-label">내용</label>
	      				<div class="col-sm-10">
	      					<textarea class="form-control" name="noticeContent" id="content" rows="20">${n.noticeContent }</textarea>
						</div>	      			
	      			</div>
	      		<div class="backTo">
	      			<input type="submit" class="btn-main btn-update" value="수정완료">
	      			<i class="btn-main btn-delete" onclick='delCheck();'>삭제하기</i>
	      			<a href="/noticeList.do?reqPage=1" class="btn-main">목록으로</a>
	      		</div>
	      	</form>  		
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
		
		//고정글 value
		$("#fixedNotice").on("change", function(){
			if($(this).prop('checked')){
				$("#fixedNoticeHidden").prop("disabled", true);
			} else {
				$("#fixedNoticeHidden").prop("disabled", false);
			}
		})
		
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
  	$("#delBtn").click(function(){
		$(this).parent().hide();
		$(this).parent().next().show();
	});
  </script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 - 게시글 상세보기</title>
<link rel="stylesheet" href="resources/css/mainpage/common.css">
<link rel="stylesheet" href="resources/css/freeboard/BoardList.css">
<link rel="stylesheet" href="resources/css/notice/noticeList.css">
<link rel="stylesheet" href="resources/css/notice/Notice.css">
<link rel="stylesheet" href="resources/css/notice/boardView.css">
<!-- 페이지 전용 CSS -->
<link rel="stylesheet" href="resources/css/freeboard/freeView.css">
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
	      	<div class="free-main-content">
	      		<div class="content-title">
	      			<h2>자유게시판</h2>
	      			<h5>회원분들의 즐거운 커뮤니티 공간!</h5>
	      		</div>
				<div class="view-content col">
	      			<div class="form-group row">
	      				<label for="noticeTitle" class="col-sm-2 col-form-label">제목</label>
	      				<input type="hidden" value="${fb.freeNo }" id="freeNo">
	      				<div class="col-sm-4">
	      					<input type="text" readonly class="form-control-plaintext" id="freeTitle" name="freeTitle" value="${fb.freeTitle }">
	      				</div>
	      				<label for="noticeTitle" class="col-sm-2 col-form-label">추천수</label>
	      				<div class="col-sm-4">
	      					<input type="text" readonly class="form-control-plaintext" id="freeTitle" name="freeTitle" value="${fb.freeLikeCount }">
	      				</div>
	      			</div>
	      			<div class="form-group row">
	      				<label for="memberNickname" class="col-sm-2 col-form-label">작성자</label>
	      				<div class="col-sm-4">
	      					<input type="text" readonly class="form-control-plaintext" name="memberNickname" id="memberNickname" value="${fb.memberNickname } [${fb.freeWriter}]">
	      				</div>
	      				<label for="filename" class="col-sm-2 col-form-label">첨부파일</label>
	      				<div class="col-sm-4">
		      					<c:choose>
									<c:when test="${not empty n.filename }">
									<i class="bi bi-file-arrow-down"></i>
									<a href="/fileDownFree.do?freeNo=${fb.freeNo }">${ff.filename }</a>
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
	      					<input type="text" readonly class="form-control-plaintext" name="regDate" id="regDate" value="${fb.regDate }">
	      				</div>
	      				<label for="readCount" class="col-sm-2 col-form-label">조회수</label>
	      				<div class="col-sm-4">
	      					<input type="text" readonly class="form-control-plaintext" name="readCount" id="readCount" value="${fb.freeReadcount }">
	      				</div>
	      			</div>
	      			<div class="form-group row">
	      				<div class="col-sm-12">
	      				<div class="freeContent" id="freeContent" style="test-align:left;padding-bottom:50px;">${fb.freeContentBr }</div>
						</div>
						<div class="like-box">
			      			<div class="like-wrap">
			      			<label for="freeLike">추천 <span class="likeCount">${fb.freeLikeCount }</span></label>
			      			<img src="#" style="width:100px; height:100px;" id="freeLike">
			      			</div>
	      				</div>      			
	      			</div>
	      		</div>
	      		<div class="comment-box row">
	      		<c:choose>
	      			<c:when test="${empty sessionScope.m }">
	      				회원만 볼 수 있습니다.
	      			</c:when>
	      			<c:otherwise>
	      				<div class="comment-table row">
	      					<table class="table">
	      						<tbody>
	      							<tr>
	      								<td colspan="2">
	      								댓글 (${fb.fcCount })
	      								</td>
	      							</tr>
	      							<c:choose>
	      							<c:when test="${not empty commentList }">
	      								<c:forEach items="${commentList }" var="fc" varStatus="i">
	      									<tr>
	      										<td class="fc-main col-sm-10">
	      											<div class="fcwriter-profile">
	      												<table>
	      													<tr>
	      														<td rowspan="2">
	      															<img src="resources/upload/member_profile/${fc.profilePath }" style="width: 50px; height: 50px;" class="fcProfile">
	      														</td>
	      														<td>
	      														<h6>${fc.memberNickname }</h6>
	      														</td>
	      													</tr>
	      													<tr>
	      														<td><p>${fc.regDate }</p></td>
	      													</tr>
	      												</table>
	      											</div>
	      											<div class="fcContent" style="text-align:left;">
	      												${fc.fcContent }
	      											</div>
	      										</td>
	      										<td class="fcLike">
	      											<img src="#" style="width:50px;height:50px;" class="fcLike">
	      											추천<span class="fcLikeCount">${fc.fcLikeCount }</span>
	      										</td>
	      									</tr>
	      								</c:forEach>
	      							</c:when>
	      							</c:choose>
	      						</tbody>
	      					</table>
	      				</div>
	      			</c:otherwise>
	      		</c:choose>
	      		</div>
	      		<div class="backTo">
	      			<a href="/freeUpdateFrm.do?freeNo=${fb.freeNo }"><button class="btn-main btn-update">수정하기</button></a>
	      			<button class="btn-main btn-delete" onclick='delCheck();'>삭제하기</button>
	      			<a href="/noticeList.do?reqPage=1"><button class="btn-main">목록으로</button></a>
	      		</div>
	      	</div>
	      </div>
    </section>
  </main><!-- End #main -->
  <script>
  	function delCheck(){
  		var delNotice_ans = confirm("게시글을 삭제하시겠습니까?");
  		var noticeNo = $("#freeNo").val();
  		if(delNotice_ans == true){
			location.href="/deleteFreeboard.do?freeNo="+noticeNo;
		} else {
			return false;
		}
  	}
  </script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
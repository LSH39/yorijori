<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	      				<div class="col-sm-4 writerinfo">
	      					<input type="text" readonly class="form-control-plaintext" name="memberNickname" id="memberNickname" value="${fb.memberNickname } [${fb.freeWriter}]">
	      				</div>
	      				<label for="filename" class="col-sm-2 col-form-label">첨부파일</label>
	      				<div class="col-sm-4">
		      					<c:choose>
									<c:when test="${not empty fileList }">
										<div class="dropdown">
										  <button class="btn btn-announce dropdown-toggle" type="button" id="fileDropDownButton" data-bs-toggle="dropdown" aria-expanded="false">
										    <i class="bi bi-file-arrow-down"></i> ${fn:length(fileList) }개
										  </button>
										  <ul class="dropdown-menu" aria-labelledby="fileDropDownButton">
										  <c:forEach items="${fileList }" var="ff" varStatus="i">
										  	<li><a class="dropdown-item filedown" href="/fileDownFree.do?ffNo=${ff.ffNo }">${ff.ffFilename }</a></li>
										  </c:forEach>
										  </ul>
										</div>
									</c:when>
									<c:otherwise>
									<i class="bi bi-x-square-fill"></i>
									<span>파일이 없습니다.</span>
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
	      				<div class="freeContent" id="freeContent" style="test-align:left;padding-bottom:50px;">
	      					<c:forEach items="${fileList }" var="ff" varStatus="i">
								<img src="resources/upload/freeboard/${ff.ffFilepath }" style="width: 300px; height: 180px;">	
							</c:forEach>
	      				${fb.freeContentBr }
	      				</div>
						</div>
						<div class="like-box">
			      			<div class="like-wrap">
				      			<label for="freeLike">추천 <span class="likeCount">${fb.freeLikeCount }</span></label>
				      			<img src="resources/img/freeboard/cookhat.png" style="width:40px; height:40px;" id="freeLike">
			      			</div>
	      				</div>      			
	      			</div>
	      		</div>
	      		<div class="comment-box row">
	      		<c:choose>
	      			<c:when test="${empty sessionScope.m }">
	      				<table class="comment-table row">
	      					<tbody>
	      						<tr>
	      							<th style="padding-bottom: 20px;">
	      								댓글 (${fb.fcCount })
	      							</th>
	      						</tr>
	      						<tr>
	      							<td>
	      								회원만 볼 수 있습니다. 로그인 해주세요.
	      							</td>
	      						</tr>
	      					</tbody>
	      				</table>
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
	      							<!-- 댓글 작성하기 -->
	      							<tr class="write-comment-box">
	      								<form action="/insertFreeboardComment.do" method="post" class="insert-comment">
		      								<td class="fc-main col-sm-10">
		      									<input type="hidden" name="freeNo" id="freeNo" value="${fb.freeNo }">
		      									<input type="hidden" name="fcWriter" id="fcWriter" value="${sessionScope.m.memberId }">
			      								<div class="write-comment"><h5>댓글 작성하기</h5></div>
			      								<textarea rows="5" cols="110" name="fcContent" id="fcContent"></textarea>
		      								</td>
		      								<td class="fc-main col-sm comment-submit">
		      									<button type="submit" class="btn-main submit-comment">댓글 등록하기</button>
		      								</td>
	      								</form>
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
	      														<c:choose>
	      														<c:when test="${fc.memberLevel == 3 }">
	      															<h6>${fc.memberNickname } [관리자]</h6>
	      														</c:when>
	      														<c:otherwise>
	      															<h6>${fc.memberNickname }</h6>
	      														</c:otherwise>
	      														</c:choose>
	      														</td>
	      													</tr>
	      													<tr>
	      														<td><p>${fc.regDate }</p></td>
	      													</tr>
	      												</table>
	      											</div>
	      											<div class="contentBox" style="text-align:left;">
	      												<textarea rows="3" cols="110" class="fcContent-o" readonly>${fc.fcContent }</textarea>
	      											</div>
	      										</td>
	      										<td class="fcLike">
	      											<div class="fc-like">
		      											<img src="resources/img/freeboard/spoonknife.png" style="width:30px;height:30px;" class="fcLike">
		      											<p>추천 <span class="fcLikeCount">${fc.fcLikeCount }</span></p>
		      											<input type="hidden" value="${fc.fcNo }" class="fcNo">
	      											</div>
	      											<c:choose>
	      												<c:when test="${fc.memberNickname eq sessionScope.m.memberNickname }">
	      													<div>
	      														<span class="comment-upd">수정</span> / <span class="comment-del">삭제</span>
	      													</div>
	      													<div>
	      														<button class="commentup-submit" style="display:none;">등록하기</button>
	      														<button class="commentup-cancel" style="display:none;">취소</button>
	      													</div>
	      												</c:when>
	      											</c:choose>
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
	      		<c:choose>
	      			<c:when test="${fb.freeWriter eq sessionScope.m.memberId }">
	      				<a href="/freeUpdateFrm.do?freeNo=${fb.freeNo }"><button class="btn-main btn-update">수정하기</button></a>
	      				<button class="btn-main btn-delete" onclick='delCheck();'>삭제하기</button>
	      			</c:when>
	      		</c:choose>
	      			<a href="/freeboardList.do?reqPage=1&orderIndex=0"><button class="btn-main">목록으로</button></a>
	      		</div>
	      	</div>
	      </div>
    </section>
  </main><!-- End #main -->
  <script>
  	//게시글 삭제
  	function delCheck(){
  		var delBoard_ans = confirm("게시글을 삭제하시겠습니까?");
  		var boardNo = $("#freeNo").val();
  		if(delBoard_ans == true){
			location.href="/deleteFreeboard.do?freeNo="+boardNo;
		} else {
			return false;
		}
  	}
  	$(function(){
  		$("#freeLike").on("click", function(){
  	  		var memberId = $("#fcWriter").val();
  	  		var freeNo = $("#freeNo").val();
  	  		if (memberId != null){
  	  			var like_ans = confirm("게시글을 추천하시겠습니까?");
  	  			if (like_ans == true){
  	  				$.ajax({
  	  					url: "/likeFreeboard.do",
  	  					type: "get",
  	  					data: {freeNo:freeNo, memberId:memberId},
  	  					success: function(data){
  	  						if(data>0){
  	  							alert("이미 추천하셨습니다!");
  	  						} else {
  	  							location.href="/insertFreeboardLike.do?freeNo="+freeNo+"&memberId="+memberId;	
  	  					}
  	  					}
  	  			
  	  	  			});
  	  			} else {
  	  				return false;
  	  			}
  	  		} else {
  	  			alert("회원만 추천이 가능합니다. 로그인 해주세요.");
  	  		}
  	  	});
  		
  		//댓글 삭제
  		$(".comment-del").on("click", function(){
  			var fcDel_ans = confirm("댓글을 삭제하시겠습니까?");
  			var freeNo = $("#freeNo").val();
  			var fcNo = $(this).parents(".fcLike").find("input[type='hidden']").val();
  			if(fcDel_ans == true){
  				location.href="/deleteFc.do?fcNo="+fcNo+"&freeNo="+freeNo;
  			} else {
  				return false;
  			}
  		});
  		
  		//댓글 수정 클릭시 화면 변경
  		$(".comment-upd").on("click", function(){
  			var fcNo = $(this).parent(".fc-like").children("input[type='hidden']").val();
  			var fcContentBox = $(this).parents(".fcLike").prev().children(".contentBox");
  			var fcContent = $(this).parents(".fcLike").prev().find("textarea").html();
  			$(this).parent().hide();
  			$(this).parent().next().children("button").show();
  			fcContentBox.empty();
  			var html = "<textarea class='fcContentUp' rows='4' cols='100' name='fcContentUp'>"+fcContent+"</textarea>";
  			fcContentBox.html(html);
  			
  			//댓글 수정 취소
  	  		$(".commentup-cancel").on("click", function(){
  	  			$(this).hide();
  	  			$(this).prev().hide();
  	  			$(this).parent().prev().show();
  	  			fcContentBox.html("<textarea rows='3' cols='110' class='fcContent-o' readonly>"+fcContent+"</textarea>");
  	  		});
  		});
  		//댓글 수정 완료
  		$(".commentup-submit").on("click", function(){
  			var freeNo = $("#freeNo").val();
  			var fcNo = $(this).parents(".fcLike").find("input[type='hidden']").val();
  			var fcContent = $(this).parents(".fcLike").prev().find(".fcContentUp").val();
  			location.href="/updateFc.do?fcNo="+fcNo+"&fcContent="+fcContent+"&freeNo="+freeNo;
  		});
  		
  		//댓글 추천여부 확인
  		var memberId = $("#fcWriter").val();
  		var freeNo = $("#freeNo").val();
  		if(memberId != null){
  	 		$.ajax({
				url: "/fcLikeCheck.do",
				type: "get",
				data: {memberId:memberId, freeNo:freeNo},
				success: function(data){
					var list = data;
					console.log(list);
					if(list != null){
						for(var i=0;i<list.length;i++){
							var fcNo = $(".fcNo");
							var fcLikeCount = fcNo.prev().children().html();
							if(fcNo.val() == list[i].fcNo){
								fcNo.parent().removeClass("fc-like");
								fcNo.parent().addClass("fc-unlike");
								fcNo.prev("p").html("<span class='fcLikeCount'>"+fcLikeCount+"</span> 추천취소");
							}
						}
						
						}
				}
		
  			});
  		}
  		
  		
  		//댓글 추천 or 비추천
  		$(".fc-like").on("click", function(){
  			var freeNo = $("#freeNo").val();
	  		var fcNo = $(this).children(".fcNo").val();
	  		var memberId = $("#fcWriter").val();
  			if($(this).hasClass("fc-like")){
  	  			location.href="/insertFcLike.do?fcNo="+fcNo+"&memberId="+memberId+"&freeNo="+freeNo;
  			} else if ($(this).hasClass("fc-unlike")){
  	  			location.href="/deleteFcLike.do?fcNo="+fcNo+"&memberId="+memberId+"&freeNo="+freeNo;
  			}
  		});
  		
  		//파일다운로드 제한
  		$(".filedown").on("click", function(){
  			var memberId = $("#fcWriter").val();
  			if(memberId == null){
  				alert("로그인시 이용 가능합니다.");
  				return false;
  			}
  		})
  		
  		
  	});
  		


  	
  	
  </script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
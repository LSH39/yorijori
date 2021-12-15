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
										  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
										    <i class="bi bi-file-arrow-down"></i> ${fn:length(fileList) }개
										  </button>
										  <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
										    <li><a class="dropdown-item" href="#">Action</a></li>
										    <li><a class="dropdown-item" href="#">Another action</a></li>
										    <li><a class="dropdown-item" href="#">Something else here</a></li>
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
	      														<h6>${fc.memberNickname }</h6>
	      														</td>
	      													</tr>
	      													<tr>
	      														<td><p>${fc.regDate }</p></td>
	      													</tr>
	      												</table>
	      											</div>
	      											<div class="fcContent" style="text-align:left; padding-bottom: 15px;">
	      												${fc.fcContent }
	      											</div>
	      										</td>
	      										<td class="fcLike">
	      											<div class="fc-like">
	      											<img src="resources/img/freeboard/spoonknife.png" style="width:30px;height:30px;" class="fcLike">
	      											<p>추천 <span class="fcLikeCount">${fc.fcLikeCount }</span></p>
	      											</div>
	      											<c:choose>
	      												<c:when test="${fc.memberNickname eq sessionScope.m.memberNickname }">
	      													<div>
	      														<input type="hidden" value="${fc.fcNo }" class="fcNo">
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
	      			<a href="/freeUpdateFrm.do?freeNo=${fb.freeNo }"><button class="btn-main btn-update">수정하기</button></a>
	      			<button class="btn-main btn-delete" onclick='delCheck();'>삭제하기</button>
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
  			var fcNo = $(this).parent().children("input[type='hidden']").val();
  			if(fcDel_ans == true){
  				location.href="/deleteFc.do?fcNo="+fcNo+"&freeNo="+freeNo;
  			} else {
  				return false;
  			}
  		});
  		
  		//댓글 수정 클릭시 화면 변경
  		$(".comment-upd").on("click", function(){
  			var fcNo = $(this).parent().children("input[type='hidden']").val();
  			var fcContentBox = $(this).parents(".fcLike").prev().find(".fcContent");
  			var fcContent = $(this).parents(".fcLike").prev().find(".fcContent").html();
  			$(this).parent().hide();
  			$(this).parent().next().children("button").show();
  			fcContentBox.empty();
  			var html = "<textarea rows='5' cols='100' name='fcContentUp' style='text-align:left;'>"+fcContent+"</textarea>";
  			fcContentBox.html(html);
  			
  			//댓글 수정 취소
  	  		$(".commentup-cancel").on("click", function(){
  	  			$(this).hide();
  	  			$(this).prev().hide();
  	  			$(this).parent().prev().show();
  	  			fcContentBox.empty();
  	  			fcContentBox.html(fcContent);
  	  		});
  		});
  		//댓글 수정 완료
  		$(".commentup-submit").on("click", function(){
  			var freeNo = $("#freeNo").val();
  			var fcNo = $(this).parent().prev().children(".fcNo").val();
  			var fcContent = $(this).parents(".fcLike").prev().find(".fcContent").children("textarea").val();
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
					var list = data.list;
					var fcNoList = new Array();
					if(list != null){
						for(var i=0; i<list.length; i++){
							fcNoList[i] = list[i].fcNo;
						}
						var fcNo = $(".fcNo").val();
						for(var j = 0; j < fcNoList.length; j++){
							if(fcNo == fcNoList[j]){
								var img = fcNo.parents(".fcLike").children().eq(0).children("img");
								var p = fcNo.parents(".fcLike").children().eq(0).children("p");
								img.css("");
								p.html("추천취소");
								p.css("font-weight", "bolder");
							}
						}
					}
				}
		
  			});
  		}
  		
  		//댓글 추천하기
  		$(".fc-like").on("click", function(){
  			var freeNo = $("#freeNo").val();
  			var fcNo = $(this).parent().find(".fcNo").val();
  			var memberId = $("#fcWriter").val();
  			location.href="/insertFcLike.do?fcNo="+fcNo+"&memberId="+memberId+"&freeNo="+freeNo;
  		});
  		
  		
  		
  	});
  	
  	
  </script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
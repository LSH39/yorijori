<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<link rel="stylesheet" href="/resources/css/recipe/recipeView.css">

</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp"/>
    <div class="main">	
		<div class="mainImg">
		<img src="/resources/upload/recipe/${rb.filepath }">
		<div id="count"><span id="countImg"><img src="/resources/img/recipe/eye.png" width="20px"></span><span id="countText"> ${rb.readCount }</span></div> 
		</div>
       
            <div class="rbList">
             <p id="rbName">${rb.nickname }</p>	
			<p id="rbTitle">${rb.recipeTitle }</p>
			<p id="rbSub">${rb.subhead }</p>
			<div class="rbImg">
                <div><p><img src="/resources/img/recipe/watch.png" width="20px"></p><p class="text">${rb.recipeTime }</p></div>
                <div><p> <img src="/resources/img/recipe/star.png" width="20px"></p><p  class="text">
                <c:choose>
                <c:when test="${rb.recipeLevel eq 1}">상</c:when>
                <c:when test="${rb.recipeLevel eq 2}">중</c:when>
                <c:when test="${rb.recipeLevel eq 3}">하</c:when>
                </c:choose>
                </p></div>
            </div>
            </div>
			<div id="mList">
			 <p id="mTitle">[ 재료 ]</p>
			<ul>            
                <c:forEach items="${rb.MList}" var="m">
				<li>${m.materialName } <span class="amount"> ${m.MAmount}</span></li>
				</c:forEach>
			</ul>
			</div>
	
        <div class="recipeNavi">
            <ul>
                <li><a href="#" >상세정보</a></li>
                <li id="comment">댓글</li>
                <li><a href="#">관련상품</a></li>
            </ul>
        </div>
        
		<div class="rcList" style="display:none;">
		<div class="rcInput" >
		<c:if test="${not empty sessionScope.m.memberNo}">
		<form id="insertRc">
			<textarea name="rcContent" id="rcContent"></textarea>
			<input type="hidden" value="${sessionScope.m.memberNo }" id="memberNo">
			<input type="button" value="댓글작성" id="insertBtn"> 
		</form>	
		</c:if>
		</div> 
		 <c:forEach items="${list}" var="rc" >
			<img src="/resources/img/recipe/person.png" width="30px"> <span class="rcNmae">${rc.nickname }</span><span class="rcDate">${rc.rcDate }</span>
			<p class="rcContents">${rc.rcContentBr }</p>
			<textarea id="rcContent" name="rcContent" class="form-control" style="display:none;">${rc.rcContent }</textarea>
			<button style="display:none;">수정완료</button>
			<p class="commentsBtn">
			<c:if test= "${sessionScope.m.memberNo eq rc.memberNo}">
			<a href="javascript:void(0)" onclick="updateComment(this,'${rc.RCommentNo}');">수정</a>
			<a href="javascript:void(0)" onclick="deleteComment(this,'${rc.RCommentNo}');">삭제</a>	
			</c:if>
			</p>	
			</c:forEach>
			</div>
		<div class="rContent">
		<c:forEach items="${rb.RList }" var="rc" varStatus="i">
			${rc.rContentBr }
			<img src="/resources/upload/recipeContent/${rc.filepath }" width="100px">
		</c:forEach>
		</div>
		</div>
			<c:import url="/WEB-INF/views/common/footer.jsp"/>
	<script>
		$("#comment").click(function() {
			var memberNo = ${sessionScope.m.memberNo};
			$(".rcList").css("display","block");	
			$(".rContent").css("display","none");
			console.log(memberNo);
			});

		$("#insertBtn").click(function() {
			var rcContent = $("#rcContent").val();
			var recipeNo = ${rb.recipeNo};
			var memberNo = 1;
			$.ajax({
				url: "/insertComment.do",
				data:{rcContent:rcContent,
					recipeNo: recipeNo,
					memberNo:memberNo},
				type:"post",
				success:function(data){
					if(data >0){
						alert("댓글 작성 완료");
					}else{
						alert("댓글 작성 실패");
					}
					location.reload();
				}
			});
		});
		function updateComment(obj,rCommentNo) {
			$(obj).parent().prev().show();
			$(obj).parent().prev().prev().show();
			$(obj).parent().prev().prev().prev().hide();
			$(obj).hide();
			$(obj).parent().prev().attr("onclick","updateComplete(this,'"+rCommentNo+"');");
			$(obj).next().html("취소");
			$(obj).next().attr("onclick","updateCancel(this,'"+rCommentNo+"'');");
		}
		function updateCancel(obj,rCommentNo) {
			$(obj).parent().prev().hide();
			$(obj).parent().prev().prev().hide();
			$(obj).prev().show();
			$(obj).html("삭제");
			$(obj).attr("onclick","deleteComment(this,'"+rCommentNo+"');");
		}
		function updateComplete(obj,rCommentNo) {
			var rcContent = $("#rcContent").val();
			$.ajax({
				url:"/updateComment.do",
				data :{rCommentNo:rCommentNo,
					rcContent:rcContent},
				type:"post",
				success:function(data){
					if(data>0){
						alert("수정완료");
					}else{
						alert("수정실패");
					}
					location.reload();
				}
			})
		}
		function deleteComment(obj,rCommentNo) {
			if(confirm("댓글을 삭제하시겠습니까?")){
				$.ajax({
					url:"/deleteComment.do",
					data:{rCommentNo:rCommentNo},
					type:"post",
					success:function(data){
						if(data>0){
							alert("삭제완료");	
						}else{
							alert("삭제실패");	
						}
						location.reload();
					}
				});
				}
			}
	</script>
	
</body>
</html>
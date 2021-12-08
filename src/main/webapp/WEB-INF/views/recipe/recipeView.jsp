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
    <div class="main">	
		<div class="mainImg">
		<img src="/resources/upload/recipe/${rb.filepath }">
		<div id="count"><span id="countImg"><img src="/resources/img/recipe/eye.png" width="20px"></span><span id="countText"> ${rb.readCount }</span></div> 
		</div>
        <p id="rbName">${rb.nickname }</p>	
            <div class="rbList">
			<p id="rbTitle">${rb.recipeTitle }</p>
			<p id="rbSub">${rb.subhead }</p>
			<div class="rbImg">
                <div><p><img src="/resources/img/recipe/watch.png" width="20px"></p><p class="text">${rb.recipeTime }</p></div>
                <div><p> <img src="/resources/img/recipe/star.png" width="20px"></p><p  class="text">${rb.recipeLevel }</p></div>
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
	
    
        <div class="navi">
            <ul>
                <li><a href="#">상세정보</a></li>
                <li id="comment">댓글</li>
                <li><a href="#">관련상품</a></li>
            </ul>
        </div>
		
		<div class="rcInput" style="display:none;">
		<form >
			<textarea name="rcContent" id="rcContent"></textarea>
			<input type="hidden" value="${sessionScope.m.memberNo }" id="memberNo">
			<input type="button" value="댓글작성" id="insertBtn"> 
		</form>	
		</div>
		<div class="rContent">
		<c:forEach items="${rb.RList }" var="rc" varStatus="i">
			${rc.recipeContent }
			<img src="/resources/upload/recipeContent/${rc.filepath }" width="100px">
		</c:forEach>
		</div>
		</div>
	<script>
		$("#comment").click(function() {
			$(".rcInput").css("display","block");
			var recipeNo = ${rb.recipeNo }
			$.ajax({
				url : "/selectComment.do",
				data:{recipeNo:recipeNo},
				type:"post",
				success:function(data) {
					$(".rContent").empty();
					for(var i=0; i<data.length;i++){
					var html = "";
					html += "<div class='cmList'>";
					html += "<img src='/resources/img/recipe/person.png' width='30px'> <span class='rcNmae'>"+data[i].nickname+"</span><span class='rcDate'>"+data[i].rcDate+"</span>";
					html += "<div class='rcContents'>"+data[i].rcContent+"</div>";
					html += "</div>";
					$(".rContent").append(html);
					}
				}
			});
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
	</script>
</body>
</html>
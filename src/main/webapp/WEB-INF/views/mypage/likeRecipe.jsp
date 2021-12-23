<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>

#line2 {
	background-color: gray;
	height: 1px;
	width: 800px;
}

/* 메인 콘텐츠 설정 */
.main-content{
    width: 875px;
}
/*밀키트*/
.recipe{
    width: 400px;
    height:250px;
      background-color:pink;
    margin-right: 20px;
    margin-bottom: 40px;
    float: left;
    
}
#itemI{
    width: 180px;
    height:200px;
    margin-top:20px;
    margin-left:10px;
}
.recImg{
    width: 200px;
    height:200px;
    float:left;
}
#recipes{
    width: 200px;
    height:200px;
    float:left;
    margin-top: 10px;
    
}
.noCou{
color:gray;
margin-left:300px;
margin-top:120px;

}
.pagenation{
margin-top:200px;
margin-left:370px;
}

.pagenation a{
color: #9F90CF;
background-color :#fff; 

}
.pagenation a:hover{
color: #9F90CF;
}
</style>
</head>
<body>
   <jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="main">
      <c:choose>
		<c:when test="${sessionScope.m.memberLevel==1}">
      	   <jsp:include page="/WEB-INF/views/mypage/memberNavi.jsp" />	
        </c:when>

       	 <c:otherwise>
   	   <jsp:include page="/WEB-INF/views/mypage/sellerNavi.jsp" />	
        
       	</c:otherwise>
       </c:choose>  
		<!-- 메인 콘텐츠 -->
		<div class="main-content">
			<h3 id="h_hotel">♥좋아요 레시피♥</h3>
			<div id="line2"></div>
			<br>
				<h5>좋아요 레시피 수 : <span style="color: rgb(159, 144, 207);">${totalCount }</span>개</h5>
			<c:choose>
				<c:when test="${ not empty list }">
					<c:forEach items="${list}" var="lr" varStatus="i">
						<div class="recipe">
							<div class="recImg">
								<a
									href="/recipeView.do?recipeNo=${lr.recipeNo}&memberNo=${lr.recipeWriter}">
									<img id="itemI" src="resources/upload/recipe/${lr.filepath}">
								</a>
							</div>
							<div id="recipes">

								<span class="it_info1"><b id="it1"><레시피제목></b>&emsp;</span><br>
								<span class="it_info1"> ${lr.recipeTitle }</span><br> <span
									class="it_info1"><b id="it1"><레시피 설명></b>&emsp;</span>&emsp;<br>
								<span class="it_info1">${lr.subhead }</span><br> <span
									class="it_info1"><b id="it1">레시피번호 :</b>&emsp;${lr.recipeNo }</span><br>
								<span class="it_info1"><b id="it1">작성자 :</b>&emsp;${lr.memberNickname }님</span>&emsp;<br>
								<span class="it_info1"><b id="it1">조회수 :</b>&emsp;${lr.readCount }회</span>&emsp;<br>
								<span class="it_info1"><b id="it1">등록일 :</b>&emsp;${lr.recipeDate }</span>&emsp;<br>
								<input type="hidden" value="${lr.likeNo}">

							</div>
						</div>
					</c:forEach>
				</c:when>

				<c:otherwise>
					<h6 class="noCou">찜한 레시피 내역이 존재하지 않습니다!</h6>
				</c:otherwise>
			</c:choose>

		</div>
		     <div class="pagenation">
						${pageNavi }
					</div>
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
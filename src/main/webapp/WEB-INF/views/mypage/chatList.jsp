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


/*dm*/
.dm{
    width:700px;
    height:100px;
    background-color: rgb(224, 224, 224);
    margin-left: 50px;
}
.pho{
    width:120px;
    height:100px;
    
    float: left;
}
.dmC{
    width:550px;
    height:100px;
    float: left;
   

}
#pic{
    width: 70px;
    height:70px;
    border-radius: 50px;
    margin-left: 30px;
    float: left;
    margin-top: 10px;
   
}
.dContent{
    width:550px;
}
#time{
    text-align: right;
}
#name{
    font-weight: 600;
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
			<h3 id="h_hotel">●MY DM ●</h3>
			<div id="line2"></div>
			<br>
			   <c:forEach items="${list}" var="mc" varStatus="i">
			<div class="dm">

				<div class="pho">
					<img id="pic" src="resources/img/mypage/profile.jpeg">
				</div>
				<div class="dmC">
					<table class="dContent">
						<tr>
							<td id="name">${mc.chatSend}</td>
						</tr>
						<tr>
							<td>${mc.chatContent }</td>
						</tr>
						<tr>
							<td id="time">${mc.chatDate }</td>
						</tr>
					</table>
				</div>

			</div>
			</c:forEach>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
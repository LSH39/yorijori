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
	height: 3px;
	width: 875px;
}

/* 메인 콘텐츠 설정 */
.main-content{
    width: 875px;
  
    
}
.retable {
   width: 850px;
   height: 40px;
   margin-bottom: 30px;
   text-align: center;
   border:none;
   background-color: rgb(224, 219, 239);
}
.events{
    width: 850px;
   height: 60px;
   background-color:rgb(224, 224, 224);

}
.eve1{
    width: 150px;
    height:80px;
    float: left;
    text-align: center;
}
.eve2{
    width: 180px;
    height:80px;
    float: left;
    text-align: center;
}
.eve3{
    width: 200px;
    height:80px;
    float: left;
    text-align: center;
}.eve4{
    width: 160px;
    height:80px;
    float: left;
    text-align: center;
   
}.eve5{
    width: 160px;
    height:80px;
    float: left;
    text-align: center;
}
#winn{
 color:red;
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
            <h3 id="h_hotel">내 이벤트 참여내역</h3>
            <div id="line2"></div><br>
            	<h5>총  참여횟수 : <span style="color: rgb(159, 144, 207);">${totalCount }</span>번</h5>
            <table border="1" class="retable">
                <tr>
 
                  
                   <td><b>대회번호</b></td>
                   <td><b>레시피이름</b></td>
                   <td><b>참가신청일</b></td>
                   <td><b>경연날짜</b></td>
                   <td><b>우승여부</b></td>
                
                </tr>
                </table>
                  <c:forEach items="${list}" var="myc" varStatus="i">
                <div class="events">
                <div class="eve1">${myc.contestNo }</div>
                <div class="eve2">${myc.recipeTitle }</div>
                <div class="eve3">${myc.enterDate }</div>
                <div class="eve4">${myc.contestMonth }</div>
                <div class="eve4" id="winn">${myc.winResult}</div>

                </div>
               </c:forEach>
        </div>
                <div class="pagenation">
						${pageNavi }
					</div>
        </div>

   <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
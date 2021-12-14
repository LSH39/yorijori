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
	width: 800px;
}

/* 메인 콘텐츠 설정 */
.main-content{
    width: 875px;
    
}
/*내 레시피*/
.follow{
    width:800px;
    height: 120px;
    background-color: burlywood;
}
.item{
    width: 250px;
    height:280px;
    background-color:rgb(224, 224, 224);
    float: left;
    margin-left: 10px;
    margin-right: 10px;
    margin-bottom: 40px;
    
}
#itemI{
    width: 250px;
    height:180px;

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
     
            <h3 id="h_hotel">my recipe</h3>
             <div id="line2"></div><br>
             <c:forEach items="${list}" var="rb" varStatus="i">
            <div class="item">
                <a href="#"> 
                    <img id="itemI" src="/resources/img/mypage/house.png">
                </a>
                <div id="items">
                    <span class="it_info1"><b id="it1">#</b>${rb.recipeTitle}</span><br>
                    <span class="it_info1"><b id="it1">#</b>난이도 ${rb.recipeLevel}</span><br>
                    <span class="it_info1"><b id="it1">#</b>${rb.recipeTime}조리</span><br>   
                </div>
                
              </div>
              </c:forEach>

        </div>
        
        </div>
  <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
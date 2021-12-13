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
/*내 팔로우*/

.followR{
    width:250px;
    height: 300px;
    
    float: left;
    margin-right: 30px;
}
.pt{
    width:250px;
    height: 60px;
    background-color:darksalmon ;
}
.pr{
    width:250px;
    height: 140px;
     background-color:rgb(224, 219, 239) ;
  
}
.pw{
    width:250px;
    height: 100px;
    background-color:rgb(224, 219, 239) ;
}
#pp{
    width: 60px;
    height:60px;
    border-radius: 50px;
    margin-left: 30px;
    float: left;
   
}
#nickName{
    float: left;
    margin-left: 15px;
}
#itemI{
    width: 250px;
    height:130px;
}
</style>
</head>
<body>
   <jsp:include page="/WEB-INF/views/common/header.jsp" />
    <div class="main">
          <jsp:include page="/WEB-INF/views/mypage/memberNavi.jsp" />   
        <!-- 메인 콘텐츠 -->
        <div class="main-content">
            <h3 id="h_hotel">★my Follow★</h3>
            <div id="line2"></div><br>
              <c:forEach items="${list}" var="fol" varStatus="i">
            <div class="followR">
                <div class="pt">
                    <img id="pp" src="resources/img/mypage/profile.jpeg">
                    <h5 id="nickName">${fol.memberNickname }</h5>
                </div>
                <div class="pr">
                    <a href="#"> 
                        <img id="itemI" src="resources/img/mypage/house.png">
                    </a>
                </div>
                <div class="pw">
                    <h5>#${fol.recipeTitle}</h5>
                    <h5>#${fol.subhead }</h5>
                </div>

            </div>
            </c:forEach>
        </div>
        
        </div>
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
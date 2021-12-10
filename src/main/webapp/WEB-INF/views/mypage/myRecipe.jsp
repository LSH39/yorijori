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

#fone{
    width: 150px;
    height:120px;
    float: left;
    margin-left: 100px;   
}
#ftwo{
    width: 450px;
    height:120px;
    float: left;
    
}

#pp{
    width: 100px;
    height:100px;
    border-radius: 50px;
    margin-left: 30px;
   
}
.myFollow{
    width:400px;
    text-align: center;
    margin-left: 30px;
    margin-top: 10px;
    

}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
    <div class="main">
       <jsp:include page="/WEB-INF/views/mypage/memberNavi.jsp" />   
        <!-- 메인 콘텐츠 -->
        <div class="main-content">
            <h4>naeun_SOn</h4>
            <div class="follow">
             <div id="fone"><img id="pp" src="/resources/img/mypage/profile.jpeg"></div>
             <div id="ftwo">
              <table class="myFollow">
                  <tr>
                      <td>0</td>
                      <td>0</td>
                      <td>0</td>
                  </tr>
                  <tr>
                    <th>게시글</th>
                    <th>팔로워</th>
                    <th>팔로잉</th>
                </tr>
              </table>
             </div>  
            
            </div>
            <div id="line2"></div><br>
            <h3 id="h_hotel">my recipe</h3>
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
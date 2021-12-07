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

.h_left{
	width: 350px;
	height: 300px;

	float:left;
	margin-left:30px;
	margin-top:20px;
}
.h_right{
	width: 350px;
	height: 300px;

	float:left;
	margin-left:30px;
	margin-top:20px;
}
/* 메인 영역 */
.main{
    width: 1200px;
    margin: 0 auto;
    margin-top: 50px;
    overflow: hidden;
}
.main>div{
    float: left;
}


#line2 {
	background-color: gray;
	height: 3px;
	width: 800px;
}


/* 메인 콘텐츠 설정 */
.main-content{
    width: 1200px;
    margin-bottom: 30px;
}

.win{
    width: 250px;
    height:400px;
    background-color:rgb(240, 240, 192);
    float: left;
    margin-left: 30px;
    margin-right: 10px;
    margin-top: 20px;
    
}
#recipeI{
    width: 250px;
    height:200px;
}
#wintt{
    text-align: center;
    font-weight: 800;
    font-size: 25px;;
}
#win{
    width: 60px;
    height:60px;
}
#winners{
 line-height: 30px;
 overflow: hidden;
 }
</style>
</head>
<body>
 <jsp:include page="/WEB-INF/views/common/header.jsp" />
    <div class="main">
       
        <!-- 메인 콘텐츠 -->
        <div class="main-content">
            <h3 id="wintt">WINNER LIST</h3>
    
       
               <c:forEach items="${list}" var="ct" varStatus="i">
              <div class="win">
                 <img id="win" src="resources/img/mypage/win.jpeg">
                <a href="#"> 
                    <img id="recipeI" src="resources/img/mypage/house.png">
                </a>
                <div id="winners">
                   <span class="it_info1"><b id="it1">경연날짜 :</b>&emsp;${ct.contestMonth }</span><br>
                   <span class="it_info1"><b id="it1">레시피이름 :</b>&emsp;${ct.recipeTitle}</span><br>
                   <span class="it_info1"><b id="it1">우승자 :</b>&emsp;${ct.recipeWriter }</span>&emsp;<br>
            
    
                </div>
                
              </div>
              </c:forEach>
        </div>
        
        </div>
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
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
/* 메인 내부 서브 네비 */
.main-left-box{
    width: 230px;
    padding: 23px;
    box-sizing: border-box;
    background-color: rgb(224, 219, 239);
    margin-right: 60px;
}
.main-left-box>h2{
    margin: 0;
    height: 50px;
    cursor: default;
    border-bottom: 3px solid #565c54;
    margin-bottom: 25px;
}
.main-left-box ul{
    list-style-type: none;
    padding: 0;
}
.main-left-box ul>*{
    text-indent: 5px;
}
.main-left-box>ul>li>span{
    font-family: 'ns_b';
    font-size: 18px;
    cursor: default;
    display: block;
    border-bottom: 1px dotted #b9a989;
    padding-bottom: 8px;
    margin-bottom: 8px;
}
.subnavi{
    margin-bottom: 25px;
}
.subnavi a{
    display: block;
    text-decoration: none;
    font-size: 15px;
    line-height: 23px;
    margin-bottom: 2px;
    position: relative;
}
.subnavi a>span{
    position: absolute;
    right: 10px;
    font-size: 10px;
    display: none;
}


/* 클릭 표시 a태그 배경색 #d6c6a5 */
.main{
margin-bottom:40px;
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
        <div class="main-left-box">
            <h3>마이페이지</h3>
            <ul>
                <li>
                    <span>MY INFO</span>
                 	<ul class="subnavi">
						<li><a href="#">내정보 조회 및 수정<span>&gt;</span></a></li>
						<li><a href="#" id="lf-click">내 구매내역<span>&gt;</span></a></li>
						<li><a href="#">쿠폰함<span>&gt;</span></a></li>
						<li><a href="#">회원탈퇴<span>&gt;</span></a></li>
						<li><a href="#">참여한 경연대회<span>&gt;</span></a></li>
						<li><a href="#">요리클래스 예약내역<span>&gt;</span></a></li>
						<li><a href="#">Dm내역<span>&gt;</span></a></li>
						<li><a href="#">follwer 게시글<span>&gt;</span></a></li>
						<li><a href="#">찜한 레시피<span>&gt;</span></a></li>
					</ul>
                </li>
                <li>
                    <span>MY WRITE</span>
                    <ul class="subnavi">
                      	<li><a href="#">작성후기<span>&gt;</span></a></li>
						<li><a href="#" id="lf-click">작성 게시글<span>&gt;</span></a></li>
						<li><a href="#">내 작성 레시피<span>&gt;</span></a></li>
                    </ul>
                </li>
            </ul>
        </div>
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
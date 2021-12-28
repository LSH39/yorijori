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
.myorder{
         width:800px;
         height:220px;
         margin-bottom:30px;
         
}
.foodI{
background-color:rgb(244, 244, 191);
height:220px;
width:270px;
float: left;
}
.orders{
    height:220px;
    width:330px;
    float: left;
    background-color: rgb(244, 244, 191);

}
.rebutton{
    background-color: rgb(244, 244, 191);
    height:220px;
    width:200px;
    float: left;
    text-align: center;
    

}
.reClick{
    margin-top: 90px;
    width:100px;
    height:30px;
    background-color:rgb(232, 232, 11);
    color:white;
    border: none;
    text-align:center;
    border-radius: 30px;
    
}
.orderN{
   
    width:300px;
    height:35px;
}
#imgItem{
  
    width:300px;
    height:185px;
}
#milkit{
    width:180px;
    height:150px;
    margin-left: 50px;

}
#m{
  line-height: 35px;  
}
#detail{
    margin-left: 40px;
}
.pagenation{

margin-left:400px;
margin-top:100px;
}
.pagenation ul{
align-self: center;
margin : 0 auto;
}
.pagenation a{
color: #9F90CF;
background-color :#fff;
 }
.pagenation a:hover{
color: #9F90CF;
}
.page-item.active .page-link{
  color: #fff;
  background: #9F90CF;
  border-color : #9F90CF;
}
.noCou{
color:gray;
margin-left:300px;
margin-top:120px;

}

</style>


</head>
<body>
  <jsp:include page="/WEB-INF/views/common/header.jsp" />
  <script type="text/javascript" src="/js/jquery-3.3.1.js"></script>

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
            <h3 id="h_hotel">구독권 구매내역 조회</h3>
            <div id="line2"></div><br>
            	<h5>구매 구독횟수 : <span style="color: rgb(159, 144, 207);">${totalCount }</span>번</h5>
			<c:choose>
				<c:when test="${ not empty list }">
					<c:forEach items="${list}" var="mym" varStatus="i">
						<div class="myorder">
							<div class="foodI">
								<div class="orderN">
									<span>구독권번호 :${mym.membershipNo }</span>
								</div>
								<c:choose>
								<c:when test="${mym.membershipLevel=='standard'}">
								<div id="imgItem">
									<img id="milkit" src="/resources/img/membership/오븐2.jpg">
								</div>							
								</c:when>
								<c:otherwise>
								<div id="imgItem">
									<img id="milkit" src="/resources/img/membership/premium.jpg">
								</div>
								</c:otherwise>
								</c:choose>
							</div>
							<div class="orders">
                        
                        
								<span class="pay"><b id="m">구독등급: </b>&emsp;${mym.membershipLevel}</span><br>
								<span class="it_info1"><b id="m">구독가격:</b>&emsp;${mym.membershipPrice }원</span>&emsp;<br>	
								<span class="it_info1"><b id="m">구독자: </b>&emsp;${mym.memberName}</span>&emsp;<br>					
								<span class="it_info1"><b id="m">구독시작일: </b>&emsp;${mym.payDate}</span>&emsp;<br>
							    <span class="it_info1"><b id="m">구독기간: </b>&emsp;${mym.membershipDate}개월</span>&emsp;<br>
							</div>
							<div class="rebutton">
							
								
								  <c:choose>
								  <c:when test="${mym.subStatus==1}">
								  
								<div class="review">
									<input type="text" value="구독중" class="reClick">

								</div>
								</c:when>
								<c:otherwise>
									<div class="review">
									<input type="text" value="구독종료" class="reClick">

								</div>
								</c:otherwise>
								</c:choose>
							
							
							
							</div>

						</div>
					</c:forEach>
				</c:when>

				<c:otherwise>
					<h6 class="noCou">구매 내역이 존재하지 않습니다.</h6>
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
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
/* 메인 내부 서브 네비 */
.main-left-box{
    width: 230px;
    padding: 23px;
    box-sizing: border-box;
    background-color: #9F90CF;
    margin-right: 60px;
}
.main-left-box>h3{
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
    font-family: 'ns_b';
    display: none;
}
#line2 {
	background-color: gray;
	height: 3px;
	width: 830px;
}

/* 메인 콘텐츠 설정 */
.main-content{
    width: 875px;
}
.amount{
    width:800px;
    height:200px;
    background-color: rgb(247, 247, 229);
    margin-bottom:30px;
}
.mim{
    width:300px;
    height:200px;
    background-color: rgb(233, 148, 43);
    float: left;
}
.tot{
    width:300px;
    height:200px;
    background-color: yellowgreen;
    float: left;
}
.tmn{
    width:200px;
    height:200px;
    background-color: gold;
    float: left;
}
#pic{
    width:200px;
    height:200px;
    margin-left: 50px;
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
            <h3 id="h_hotel">판매량 통계</h3>
            <div id="line2"></div><br>
            <c:forEach items="${list}" var="ms" varStatus="i">
            <div class="amount">
            <h3>${i.count}</h3>
               <div class="mim"><img id="pic" src="resources/img/mypage/profile.jpeg"></div>
               <div class="tot"> 
                <span class="it_info1"><b id="m"><밀키트이름></b>&emsp;${ms.milkitName}</span>&emsp;<br>
                <span class="it_info1"><b id="m"><재고량> </b>&emsp;${ms.milkitStock}개</span>&emsp;<br>
                 </div>
               <div class="tmn">
                <span class="it_info1"><b id="m">금액:</b>&emsp;${ms.milkitPrice}원</span>&emsp;<br>
                <span class="it_info1"><b id="m">수량: </b>&emsp;${ms.orderOptionAmount}</span>&emsp;<br>
                 <span class="it_info1"><b id="m">총 누적금액: </b>&emsp;${ms.orderOptionAmount*ms.milkitPrice}원</span>&emsp;<br>
               </div>
               </div>
               </c:forEach>


            </div>

        </div>
        
       
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
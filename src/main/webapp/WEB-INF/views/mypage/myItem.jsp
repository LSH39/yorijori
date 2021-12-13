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

#line2 {
	background-color: gray;
	height: 3px;
	width: 830px;
}


/* 메인 콘텐츠 설정 */
.main-content{
    width: 875px;
}
/*밀키트*/
.item{
    width: 250px;
    height:360px;
    background-color: rgba(224, 224, 224, 0.41);
    float: left;
    margin-left: 15px;
    margin-right: 10px;
    margin-bottom: 40px;
    line-height: 27px;
 
    
    
}
#itemI{
    width: 250px;
    height:180px;
}
#items{
   margin-top:12px;
  
   }
</style>
</head>
<body>
   <jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="main">
	 <jsp:include page="/WEB-INF/views/mypage/memberNavi.jsp" />   
		<!-- 메인 콘텐츠 -->
		<div class="main-content">
			<h3 id="h_hotel">내가 판매하는 밀키트</h3>
			<div id="line2"></div>
			<br>


            <c:forEach items="${list}" var="mi" varStatus="i">
			<div class="item">
				<a href="#"> <img id="itemI"
					src="resources/img/mypage/house.png">
				</a>
				<div id="items">
					<span class="it_info1"><b id="it1">상품번호 :</b>&emsp;${mi.productNo}</span><br>
					<span class="it_info1"><b id="it1">밀키트이름 :</b>&emsp;${mi.milkitName}</span><br>
					<span class="it_info1"><b id="it1">밀키트가격 :</b>&emsp;${mi.milkitPrice}원</span>&emsp;<br>
					<span class="it_info1"><b id="it1">등록일:</b>&emsp;${mi.milkitDate}</span>&emsp;<br>
					<span class="it_info1"><b id="it1">재고 :</b>&emsp;${mi.milkitStock}개 남음</span>&emsp;<br>
					<input type="hidden" value="${mi.milkitWriter}">
					
				</div>
			</div>
			</c:forEach>
		</div>
	</div>

   <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
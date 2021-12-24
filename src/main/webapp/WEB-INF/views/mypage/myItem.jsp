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
    width: 700px;
    height:300px;
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
    float:left;
}
#items{
   margin-top:12px;
   float:left;
  
   }
   
   .mySell{
         width:800px;
         height:230px;
         background-color:rgb(251, 251, 137);
         margin-bottom:30px;
}


.sellItem{
    width:300px;
    height:200px;
    float: left; 
    line-height: 30px;
  
}

#sell{
  width:30px;
  height:30px;
  
  
  }
  #product{
  width:270px;
    height:180px;
    margin-left:30px;
  
  }
  .it{
  margin-left:70px;
  }
#ii{

width:400px;
height:150px;
float:left;
margin-left:20px;
line-height: 30px;
}
#total{

width:300px;
height:50px;
float:left;
margin-left:200px;
text-align:right;
color:navy;
font-weight:600;

}
.noCou{
color:gray;
margin-left:350px;
margin-top:120px;

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
            <h3 id="h_hotel">내가 판매하는 밀키트</h3>
            <div id="line2"></div><br>

			<c:choose>
				<c:when test="${ not empty list }">
					<c:forEach items="${list}" var="ms" varStatus="i">

						<div class="mySell">
							<div class="sellNo">

								<span id="dd">${i.count }</span>
							</div>
							<div class="sellItem">
                                <a href="/milkitView.do?productNo=${ms.productNo}&recipeNo=${ms.recipeNo}">
								<img id="product"
									src="/resources/upload/product/${ms.filepath}"><br></a>
							</div>

							<div id="ii">
								<span class="it_info1"><b id="it1">상품번호 :</b>&emsp;${ms.productNo}</span><br>
								<span class="it_info1"><b id="it1">밀키트이름 :</b>&emsp;${ms.milkitName}</span><br>
								<span class="it_info1"><b id="it1">밀키트가격 :</b>&emsp;${ms.milkitPrice}원</span>&emsp;<br>
								<span class="it_info1"><b id="it1">등록일:</b>&emsp;${ms.milkitDate}</span>&emsp;<br>
								<span class="it_info1"><b id="it1">재고 :</b>&emsp;${ms.milkitStock}개남음</span>&emsp;<br>
								<input type="hidden" value="${ms.milkitWriter}">

							</div>
							<div id="total">
								<span class="it_info1"><b id="m">총 판매수량: </b>&emsp;${ms.totalAmount}개</span>&emsp;<br>
								<span class="it_info1"><b id="m">총 누적금액: </b>&emsp;${ms.totalAmount*ms.milkitPrice}원</span>&emsp;<br>


							</div>
						</div>
					</c:forEach>
				</c:when>

				<c:otherwise>
					<h6 class="noCou">판매하시는 상품이 없습니다.</h6>
				</c:otherwise>
			</c:choose>

		</div>
	</div>

   <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
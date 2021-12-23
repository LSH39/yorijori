<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/js/jquery-3.3.1.js"></script>
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
    background-color: #f6eabf;
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
	width: 800px;
}

/* 클릭 표시 a태그 배경색 #d6c6a5 */

/* 메인 콘텐츠 설정 */
.main-content{
    width: 875px;
}
.mySell{
         width:800px;
         height:220px;
         background-color: rgb(224, 219, 239);
         margin-bottom:30px;
}
.sellNo{
    width:800px;
    height:40px;
     background-color: rgb(191, 190, 190);
 
}

.sellItem{
    width:398px;
    height:220px;
    float: left; 
    line-height: 30px;
}
.orderInfo{
    width:399px;
    height:200px;
    float: left;
    line-height: 35px;
    
   
   
}
#sell{
  width:30px;
  height:30px;
  
  
  }
  #product{
  width:300px;
    height:130px;
  
  }
  .it{
  margin-left:70px;
  }
 
  .request{
  color:navy;
  }

  .upOrr{
   width:90px;
   height:30px;
   font-size:12px;
   background-color:purple;
   color:white;
   border:none;
   margin-left:20px;
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
.pagenation hover{
color: #9F90CF;
}
.page-item.active .page-link{
  color: #fff;
  background: #9F90CF;
  border-color : #9F90CF;
}
#tt{
margin-left:660px;
}
.noCou{
color:gray;
margin-left:350px;
margin-top:120px;

}
</style>
<script>
function orderDetail(orderNo){
	   location.href="/detailOrder.do?orderNo="+orderNo;
	}

</script>



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
            <h3 id="h_hotel">판매내역 조회</h3>
            <div id="line2"></div><br>
			<h5 id="tt">
				판매개수 : <span style="color: rgb(159, 144, 207);" class="amount">${totalCount }</span>개
			</h5>
                <c:choose>
                  	<c:when test="${ not empty list }">
					<c:forEach items="${list}" var="ms" varStatus="i">
						<form action="/updateOrder.do" method="POST">


							<div class="mySell">
								<div class="sellNo">

									<span id="dd">주문번호 :${ms.orderNo }</span><img id="sell"
										src="/resources/img/mypage/sell.png">
								</div>
								<div class="sellItem">
									<span class="it"><b id="m">●상품번호:</b>&emsp;${ms.productNo}번
										상품●</span>&emsp;<br> <span class="it_info1">&emsp;<img
										id="product" src="/resources/upload/product/milkit_test.jpg"></span><br>

									<%--hidden 값으로 숨기는 값들 --%>
									<input type="hidden" value="${ms.orderOptionNo}"name="orderOptionNo" id="orderOptionNo">
										 <input type="hidden" value="${sessionScope.m.memberNo}" name="milkitWriter" id="milkitWriter"> 
										 	 <input type="hidden" value="${sessionScope.m.memberNo}" name="memberNo" id="memberNo"> 
										 <input type="hidden" value="${ms.orderOptionAmount}" name="orderOptionAmount" id="orderOptionAmount"> 
										 <input type="hidden" value="${ms.milkitPrice}" name="milkitPrice" id="milkitPrice">
									<input type="hidden" name="reqPage" value="${reqPage }">
									<%--hidden 값으로 숨기는 값들끝 --%>
								</div>

								<div class="orderInfo">
									<span class="it_info1"><b id="m">밀키트: </b>&emsp;${ms.milkitName}</span><br>
									<span class="it_info1"><b id="m">주문수량: </b>&emsp;${ms.orderOptionAmount}개</span>&emsp;<br>
									<span class="it_info1"><b id="m">결제금액: </b>&emsp;${ms.milkitPrice*ms.orderOptionAmount}원</span><br>


									<b id="m">주문상태: </b> <select name="orderStatus" class="order"
										id="orderStatus">
										<c:choose>
											<c:when test="${ms.status eq '주문완료' }">
												<option value="1" selected>주문완료</option>
												<option value="2">배송 준비중</option>
												<option value="3">배송중</option>
												<option value="4">배송완료</option>
												<option value="0">주문취소</option>
											</c:when>
											<c:when test="${ms.status eq '배송준비중' }">
												<option value="1">주문완료</option>
												<option value="2" selected>배송 준비중</option>
												<option value="3">배송중</option>
												<option value="4">배송완료</option>
												<option value="0">주문취소</option>
											</c:when>
											<c:when test="${ms.status eq '배송중' }">
												<option value="1">주문완료</option>
												<option value="2">배송 준비중</option>
												<option value="3" selected>배송중</option>
												<option value="4">배송완료</option>
												<option value="0">주문취소</option>
											</c:when>
											<c:when test="${ms.status eq '배송완료' }">
												<option value="1">주문완료</option>
												<option value="2">배송 준비중</option>
												<option value="3">배송중</option>
												<option value="4" selected>배송완료</option>
												<option value="0">주문취소</option>
											</c:when>
											<c:when test="${ms.status eq '주문취소' }">

												<option value="1">주문완료</option>
												<option value="2">배송 준비중</option>
												<option value="3">배송중</option>
												<option value="4">배송완료</option>
												<option value="0" selected>주문취소</option>
											</c:when>
										</c:choose>
									</select>

									<button class="upOrr">주문상태 변경</button>
									<br>

									<c:choose>
										<c:when test="${ms.orderRequest !=null}">
											<span class="request"><b id="ms">요청사항: </b>&emsp;${ms.orderRequest}</span>
											&emsp;
											<br>
										</c:when>

										<c:otherwise>
											<span class="it_info1"><b id="m">요청사항: </b>&emsp;요청사항
												없음</span>
											&emsp;
											<br>

										</c:otherwise>
									</c:choose>

								</div>

							</div>

						</form>
					</c:forEach>
					</c:when>
                
                  	<c:otherwise><h6 class="noCou">판매내역이 텅~~~.</h6>
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
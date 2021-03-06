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
.li{
    width:3px;
    height:180px;
    background-color: gray;
    float: left;
}
.sellItem{
    width:398px;
    height:220px;
    float: left; 
    line-height: 30px;
}
.orderInfo{
    width:399px;
    height:220px;
    float: left;
    line-height: 35px;
   
   
}
#sell{
  width:30px;
  height:30px;
  margin-left:660px;
  margin-top:5px;
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
            <c:forEach items="${list}" var="ms" varStatus="i">
             <div class="mySell">
                <div class="sellNo">   
                <span>주문번호 :${ms.orderNo }</span><img id="sell" src="/resources/img/mypage/sell.png">  </div>
                <div class="sellItem">
                    <span class="it_info1"><b id="m">밀키트: </b>&emsp;${ms.milkitName}</span><br>
                      <span class="it_info1"><b id="m">주문수량: </b>&emsp;${ms.orderOptionAmount}개</span>&emsp;<br>
                     <span class="it_info1"><b id="m">결제금액: </b>&emsp;${ms.orderPayment}원</span><br>
                     <span class="it_info1"><b id="m">배송비:</b>&emsp;무료배송</span>&emsp;<br> 
                     <span class="it_info1"><b id="m">결제방식: </b>&emsp;${ms.card}</span>&emsp;<br> 
                    <span class="it_info1"><b id="m">결제번호: </b>&emsp;${ms.impUid}</span>&emsp;<br>

                </div>
                <div class="li"></div>
                <div class="orderInfo">
                    <span class="it_info1"><b id="m">주문자이름: </b>&emsp;${ms.orderName}</span>&emsp;<br>
                    <span class="it_info1"><b id="m">주문자이메일: </b>&emsp;${ms.orderEmail}</span><br>
                     <span class="it_info1"><b id="m">주문자 연락처: </b>&emsp;${ms.orderPhone}</span><br>
                    <span class="it_info1"><b id="m">주문상태: </b>&emsp;${ms.status}</span>&emsp;<br>
                    <span class="it_info1"><b id="m">요청사항: </b>&emsp;${ms.orderRequest}</span>&emsp;<br>
                </div>
             </div>
             </c:forEach>

        </div>
        
        </div>
   
      <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
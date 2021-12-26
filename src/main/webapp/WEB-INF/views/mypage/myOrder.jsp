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
    margin-top: 70px;
    width:100px;
    height:30px;
    background-color: rgb(196, 191, 227);
    color:white;
    border: none;
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

margin-left : 550px;
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
<script>
function orderDetail(orderNo){
	   location.href="/detailOrder.do?orderNo="+orderNo;
	}


$(function() {
	
	
    $(".reClick").click(function() {
    	var index =$(".reClick").index(this);
    	var orderNo =$(this).next().val();
    	var orderSale =$(this).next().next().val();
    	var memberNo =$(this).next().next().next().val();
	$.ajax({
		url:"cancelOrder.do",
		type:"post",
		data : {orderNo:orderNo,memberNo:memberNo,orderSale:orderSale},
		success: function(data){
			location.href="myOrderList.do?memberNo="+memberNo+"&reqPage=1";
			alert("주문이 취소되었습니다.");
			
		},
		error:function(){
			console.log("err");
			
		}
		
		
	});
	
  });

});

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
            <h3 id="h_hotel">주문내역 조회</h3>
            <div id="line2"></div><br>
            	<h5>총  주문횟수 : <span style="color: rgb(159, 144, 207);">${totalCount }</span>번</h5>
			<c:choose>
				<c:when test="${ not empty list }">
					<c:forEach items="${list}" var="mo" varStatus="i">
						<div class="myorder">
							<div class="foodI">
								<div class="orderN">
									<span>주문번호 :${mo.orderNo }</span>
								</div>
								<div id="imgItem">
									<img id="milkit" src="/resources/img/mypage/orders.jpeg">
								</div>
							</div>
							<div class="orders">

								<span class="pay"><b id="m">결제방식: </b>&emsp;${mo.card}</span><br>
								<span class="it_info1"><b id="m">배송비: </b>&emsp;무료배송</span><br>
								<span class="it_info1"><b id="m">결제금액:</b>&emsp;${mo.orderPayment }원</span>&emsp;<br>
								 <span class="it_info1"><b id="m">결제번호: </b>&emsp;${mo.impUid }</span>&emsp;<br>								
								  <c:choose>
				                  	<c:when test="${ not empty mo.orderRequest}">
								<span class="it_info1"><b id="m">요청사항: </b>&emsp;${mo.orderRequest }</span>&emsp;<br>
								</c:when>
								<c:otherwise>
								<span class="it_info1"><b id="m">요청사항: </b>&emsp;없음</span>&emsp;<br>
								</c:otherwise>
								</c:choose>
							</div>
							<div class="rebutton">
								<div class="detailOrder">
									<input type="button" value="<<주문상세보러가기" id="detail"
										onclick="orderDetail(${mo.orderNo})">
								</div>
								<c:choose>
				                  	<c:when test="${mo.cancleOrder=='Y'}">
								<div class="review">
									<input type="button" value="주문취소" class="reClick">
									<input type="hidden" value="${mo.orderNo }" >
									<input type="hidden" value="${mo.orderSale }" >
									<input type="hidden" value="${mo.memberNo}" >
								</div>
								</c:when>
								<c:otherwise>
								</c:otherwise>
								</c:choose>
							</div>

						</div>
					</c:forEach>
				</c:when>

				<c:otherwise>
					<h6 class="noCou">주문하신 내역이 존재하지 않습니다.</h6>
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
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
background-color: rgb(224, 224, 224);
height:220px;
width:300px;
float: left;
}
.orders{
    
    height:220px;
    width:300px;
    float: left;
    background-color: rgb(224, 224, 224);

}
.rebutton{
    background-color: rgb(224, 224, 224);
    height:220px;
    width:200px;
    float: left;
    text-align: center;
    

}
#reClick{
    margin-top: 70px;
    width:100px;
    height:30px;
    background-color: rgb(196, 191, 227);
    color:white;
    border: none;
    border-radius: 30px;
    
}
#orderN{
   
    width:300px;
    height:35px;
}
#imgItem{
  
    width:300px;
    height:185px;
}
#milkit{
    width:200px;
    height:150px;
    margin-left: 50px;

}
#m{
  line-height: 35px;  
}
#detail{
    margin-left: 40px;
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
       <jsp:include page="/WEB-INF/views/mypage/memberNavi.jsp" />   
        <!-- 메인 콘텐츠 -->
        <div class="main-content">
            <h3 id="h_hotel">주문내역 조회</h3>
            <div id="line2"></div><br>
             <c:forEach items="${list}" var="mo" varStatus="i">
             <div class="myorder">
               <div class="foodI">
                 <div id="orderN">
                 <span>주문번호 :${mo.orderNo }</span>
                 </div>
                 <div id="imgItem">
                    <img id="milkit" src="/resources/img/mypage/orders.jpeg">  
                 </div>
               </div>
               <div class="orders">
        
                <span class="it_info1"><b id="m">주문수량: </b>&emsp;${mo.orderOptionAmount }개</span>&emsp;<br>
                <span class="it_info1"><b id="m">결제방식: </b>&emsp;${mo.orderPayOption }</span><br>
                 <span class="it_info1"><b id="m">배송비: </b>&emsp;무료배송</span><br>
                <span class="it_info1"><b id="m">결제금액:</b>&emsp;${mo.orderPayment }원</span>&emsp;<br>
                <span class="it_info1"><b id="m">주문상태: </b>&emsp;${mo.orderStatus }</span>&emsp;<br>
                <span class="it_info1"><b id="m">요청사항: </b>&emsp;${mo.orderRequest }</span>&emsp;<br>
               </div>
                <div class="rebutton">
                   <div class="detailOrder">
                    <input type="button" value="<<주문상세보러가기" id="detail" onclick="orderDetail(${mo.orderNo})">
                   </div>
                   <div class="review">
                   <input type="button" value="후기작성" id="reClick">
                </div>
               </div>

             </div>
             </c:forEach>

        </div>
        
        </div>
   
      <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
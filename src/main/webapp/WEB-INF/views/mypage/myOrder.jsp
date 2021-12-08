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
        <div class="main-left-box">
            <h3>마이페이지</h3>
            <ul>
                <li>
                    <span>소개</span>
                    <ul class="subnavi">
                        <li><a href="/introHotel">내정보 조회 및 수정<span>&gt;</span></a></li>
                        <li><a href="/membership" id="lf-click">멤버십 정보<span>&gt;</span></a></li>
                        <li><a href="/location">쿠폰함<span>&gt;</span></a></li>
                        <li><a href="/location">회원탈퇴<span>&gt;</span></a></li>
                        <li><a href="/location">오시는 길<span>&gt;</span></a></li>
                        <li><a href="/location">오시는 길<span>&gt;</span></a></li>
                        <li><a href="/location">오시는 길<span>&gt;</span></a></li>
                    </ul>
                </li>
                <li>
                    <span>소개</span>
                    <ul class="subnavi">
                        <li><a href="/introHotel">내정보 조회 및 수정<span>&gt;</span></a></li>
                        <li><a href="/membership" id="lf-click">멤버십 정보<span>&gt;</span></a></li>
                        <li><a href="/location">쿠폰함<span>&gt;</span></a></li>
                        <li><a href="/location">회원탈퇴<span>&gt;</span></a></li>
                        <li><a href="/location">오시는 길<span>&gt;</span></a></li>
                        <li><a href="/location">오시는 길<span>&gt;</span></a></li>
                        <li><a href="/location">오시는 길<span>&gt;</span></a></li>
                    </ul>
                </li>
            </ul>
        </div>
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
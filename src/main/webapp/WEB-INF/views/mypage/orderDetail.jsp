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
.orD{
     width:800px;
    height:2000px;
    background-color:aquamarine;
        }

.or{
    width:800px;
    height:800px;
  
}
.pay{
    width:800px;
    height:300px;
    
}
.oin{
    width:800px;
    height:300px;
   
}
.ship{
     width:800px;
    height:300px;
 

}
.extra{
    width:800px;
    height:150px;
 
}
.no{
    width:800px;
    height:150px;   
}
.ppa{
    width:800px;
    height:300px; 
}
.orl{
    width:800px;
    height:800px; 
}
#sort{
    width:20px;
    height:10px;
}
.tb2-th{
 text-align:center;
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
            <h3 id="h_hotel">주문내역 상세보기</h3>
            <div id="line2"></div><br>
            <div class="orD">
                <div class="or">
               
                    <table border="1" class="orl">
                   
                        <tr>
                        <th class="tb2-th" colspan="3">주문번호:${mo.orderNo}</th>
                        <td class="tb2-td"><img src="img/s.jpeg" id="sort" ></td>
                    </tr>
                         <c:forEach items="${list}" var="mo" varStatus="i">
                    <tr class="tb2-tr2">
                        <td class="tb2-td">${mo.filepath}</td>
                        <td class="tb2-td">${mo.milkitName}</td>
                        <td class="tb2-td">${mo.milkitPrice}</td>
                        <td class="tb2-td">${mo.orderOptionAmount}</td>
                    </tr>
                  </c:forEach>
                    
                    
                    </table>
                </div>
                <div class="pay">
                    <table border="1" class="ppa">
                        <tr>
                        <th class="tb2-th" colspan="2">결제정보<img src="img/s.jpeg" id="sort" ></th>
                    </tr>
                    <tr class="tb2-tr2">
                        <td class="tb2-td">상품금액</td>
                        <td class="tb2-td">${mo.orderPrice}원</td>
                    </tr>
                    <tr class="tb2-tr2">
                        <td class="tb2-td">배송비</td>
                        <td class="tb2-td">무료배송</td>
                    </tr>
                    <tr class="tb2-tr2">
                        <td class="tb2-td">할인금액</td>
                        <td class="tb2-td">-${mo.orderSale}원</td>
                    </tr>
                    <tr class="tb2-tr2">
                        <td class="tb2-td">결제금액</td>
                        <td class="tb2-td">${mo.orderPayment}원</td>
                    </tr>
                    <tr class="tb2-tr2">
                        <td class="tb2-td">결제번호</td>
                        <td class="tb2-td">${mo.impUid}</td>
                    </tr>
                   
                    </table>
                </div>
                <div class="oin">
                    <table border="1" class="ppa">
                        <tr>
                        <th class="tb2-th" colspan="2">주문정보<img src="img/s.jpeg" id="sort" ></th>
                    </tr>
                    <tr class="tb2-tr2">
                        <td class="tb2-td">주문번호</td>
                        <td class="tb2-td">${mo.orderNo}</td>
                    </tr>
                    <tr class="tb2-tr2">
                        <td class="tb2-td">주문자명</td>
                        <td class="tb2-td">${mo.orderName}</td>
                    </tr>
                    <tr class="tb2-tr2">
                        <td class="tb2-td">주문자이메일</td>
                        <td class="tb2-td">${mo.orderEmail}</td>
                    </tr>
                    <tr class="tb2-tr2">
                        <td class="tb2-td">주문자 연락처</td>
                        <td class="tb2-td">${mo.orderPhone}</td>
                    </tr>
                 
                   
                    </table>
                </div>
                <div class="ship">
                    <table border="1" class="ppa">
                        <tr>
                        <th class="tb2-th" colspan="2">배송정보<img src="img/s.jpeg" id="sort" ></th>
                    </tr>
                    <tr class="tb2-tr2">
                        <td class="tb2-td">받는분</td>
                        <td class="tb2-td">${mo.orderName}</td>
                    </tr>
                    <tr class="tb2-tr2">
                        <td class="tb2-td">우편번호</td>
                        <td class="tb2-td">${mo.orderPostcode}</td>
                    </tr>
                    <tr class="tb2-tr2">
                        <td class="tb2-td">도로명주소</td>
                        <td class="tb2-td">${mo.orderAddrRoad}</td>
                    </tr>
                    <tr class="tb2-tr2">
                        <td class="tb2-td">상세주소</td>
                        <td class="tb2-td">${mo.orderAddrDetail}</td>
                    </tr>
                 
                   
                    </table>
                </div>
                <div class="extra">
                    <table border="1" class="no">
                        <tr>
                        <th class="tb2-th">요청사항<img src="img/s.jpeg" id="sort" ></th>
                    </tr>
                       
                    <tr class="tb2-tr2">
                        <td class="tb2-td">${mo.orderRequest}</td>
                    </tr>
                    
                    </table>
                     
                </div>

            </div>
               
        </div>
        
        </div>
    
 <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
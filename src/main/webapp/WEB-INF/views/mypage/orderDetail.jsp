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
       <jsp:include page="/WEB-INF/views/mypage/memberNavi.jsp" />   
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
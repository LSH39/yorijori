<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Payment</title>
<link href="/resources/css/member/LoginCommon.css" rel="stylesheet">
<link href="/resources/css/order/PaymentSuccess.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%@include file = "/WEB-INF/views/common/header.jsp" %>
	<div class="container">
        <div class="wrap">
            <div class="content">
                <div class="center">
                    <div>
                        <img src="/resources/img/about/logo_header.png">
                        <p class="p1_txt">를 이용해주셔서 감사합니다.</p>
                    </div>
                    <div>
                        <h2 class="h2_txt">고객님의 주문이 완료되었습니다.</h2>
                    </div>
                    <div>
                        <p class="p2_txt">고객님이 주문하신 주문번호는</p>
                        <p class="p2_txt"><span>${orderNo }</span> 입니다.</p>
                    </div>
                    <div>
                        <p class="p1_txt">주문내역 및 배송에 관한 안내는 <a href="/myOrderList.do?memberNo=${memberNo }&reqPage=1"><button type="button" class="purple_btn">주문조회</button></a> 를 통하여 가능합니다.</p>
                    </div>
                </div>
            </div>

        </div>
    </div>
	<%@include file = "/WEB-INF/views/common/footer.jsp" %>
</body>
</html>
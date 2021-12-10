<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join</title>
<link href="/resources/css/member/LoginCommon.css" rel="stylesheet">
<link href="/resources/css/member/Join.css" rel="stylesheet">
</head>
<body>
	<%@include file = "/WEB-INF/views/common/header.jsp" %>
	<div class="container">
        <div class="wrap">
            <div class="content">
                <h2 class="h2_txt">회원가입</h2>
                <div class="center">
                    <div>
                        <h2 class="h2_txt">모든 상품 배송비 <span>0</span>원</h2>
                        <img src="/resources/img/login/Join_delivery.png">
                    </div>
                    <div>
                        <h2 class="h2_txt">가입 즉시 사용가능한 <span>20% 할인쿠폰</span> 제공</h2>
                        <img src="/resources/img/login/Join_coupon.png">
                    </div>
                    <div>
                        <button onclick="location.href='/siteInfo.do'" class="light_btn">가입 혜택 더 보기</button>
                    </div>
                </div>
                <div class="bottom">
                    <button onclick="location.href='#'" class="kakao_btn">KAKAO 회원가입</button>
                    <button onclick="location.href='/joinBasicFrm.do'" class="purple_btn">만 14세 이상 회원가입</button>
                    <button onclick="location.href='/joinProFrm.do'" class="purple_btn">전문가 회원가입</button>
                </div>
                <div class="bottom_down">
                	<button onclick="location.href='/joinAdminFrm.do'" class="gray_btn" id="joinAdmin_btn">관리자 회원가입</button>
                </div>
            </div>

        </div>
    </div>
	<%@include file = "/WEB-INF/views/common/footer.jsp" %>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link href="/resources/css/member/LoginCommon.css" rel="stylesheet">
<link href="/resources/css/member/Login.css" rel="stylesheet">
</head>
<body>
	<%@include file = "/WEB-INF/views/common/header.jsp" %>
	
	<div class="container">
        <div class="wrap">
            <div class="content">
                <h2 class="h2_txt">로그인</h2>
                <form action="/login.do" method="POST">
                    <input type="text" name="memberId" class="input_txt" placeholder="아이디를 입력해주세요">
                    <input type="password" name="memberPw" class="input_txt" placeholder="비밀번호를 입력해주세요">
                    <input type="submit" value="로그인" class="purple_btn">    
                </form>
                <p>또는</p>
                <button type="button" class="kakao_btn" onclick="location.href='/'">KAKAO 로그인</button>
                <div class="joinSearch">
                    <div onclick="location.href='/joinCommon.do'">
                        <img src="/resources/img/login/Login_JoinG.png">
                        <img src="/resources/img/login/Login_JoinP.png">
                        <p>회원가입</p>
                    </div>
                    <div onclick="location.href='/findIdFrm.do'">
                        <img src="/resources/img/login/Login_IdSearchG.png">
                        <img src="/resources/img/login/Login_IdSearchP.png">
                        <p>아이디 찾기</p>
                    </div>
                    <div onclick="location.href='/findPwFrm.do'">
                        <img src="/resources/img/login/Login_PwSearchG.png">
                        <img src="/resources/img/login/Login_PwSearchP.png">
                        <p>비밀번호 찾기</p>
                    </div>
                </div>
            </div>
	
        </div>
    </div>
    <%@include file = "/WEB-INF/views/common/footer.jsp" %>

</body>
</html>
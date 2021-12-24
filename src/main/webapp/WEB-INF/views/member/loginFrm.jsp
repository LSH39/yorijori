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
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
</head>
<body>
	<%@include file = "/WEB-INF/views/common/header.jsp" %>
	
	<div class="container">
        <div class="wrap">
            <div class="content">
                <h2 class="h2_txt">로그인</h2>
                <form action="/login.do" method="POST">
                    <input type="text" name="memberId" class="input_txt" placeholder="아이디를 입력해주세요">
                    <div class="pw_div">
	                    <input type="password" name="memberPw" class="input_txt" placeholder="비밀번호를 입력해주세요">
	                    <input type="checkbox" id="pw_hidden"><span></span>
                    </div>
                    <input type="submit" value="로그인" class="purple_btn">    
                </form>
                <p>또는</p>
                <button type="button" class="kakao_btn">KAKAO 로그인</button>
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
    
    <script>
	    $(function(){
	        $("[name='memberId']").focus();
	        $("#pw_hidden").prop("checked", false);
	    });
	    
	    $("#pw_hidden+span").click(function(){
	    	console.log($("#pw_hidden").is(":checked") == false);
	    	if($("#pw_hidden").is(":checked") == false){
	    		$(this).prev().prev().attr("type","text");
	    		$("#pw_hidden").prop("checked", true);
	    	}else{
	    		$(this).prev().prev().attr("type","password");
	    		$("#pw_hidden").prop("checked", false);
	    	}
	    });
    
    	// kakao
	 	// key
		Kakao.init('e7a47deb2cb2e373f86a6aa99bf4fb5a');
	    $(".kakao_btn").click(function(){
			Kakao.Auth.login({
			    success: function (response) {
			      	Kakao.API.request({
			        	url: '/v2/user/me',
			        	success: function (data) {
			        		var id = data.id;
			        		$.ajax({
			                    type: "post",
			                    url: "/joinSearch.do",
			                    data: {memberId:id},
			                    success: function (data) {
			                        if(data != 0){
			                        	var memberNo = data;
			                        	location.href="/loginKakao.do?memberNo="+memberNo;
			                        }else{
			                        	alert("가입된 정보가 없습니다.");
			                        	location.href="/joinCommon.do";
			                        }
			                    }
			                });
			        	},
			        	fail: function (error) {
			          	console.log(error);
			        	},
			      	})
			    },
			    fail: function (error) {
			      	console.log(error);
			  	},
			})	
	    });
    </script>
    
    <%@include file = "/WEB-INF/views/common/footer.jsp" %>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join</title>
<link href="/resources/css/member/LoginCommon.css" rel="stylesheet">
<link href="/resources/css/member/Join.css" rel="stylesheet">
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
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
                    <button  class="kakao_btn">KAKAO 회원가입</button>
                    <button onclick="location.href='/joinBasicFrm.do'" class="purple_btn">만 14세 이상 회원가입</button>
                    <button onclick="location.href='/joinProFrm.do'" class="purple_btn">전문가 회원가입</button>
                </div>
                <div class="bottom_down">
                	<button onclick="location.href='/joinAdminFrm.do'" class="gray_btn" id="joinAdmin_btn">관리자 회원가입</button>
                </div>
            </div>
        </div>
    </div>
    
    <script>
	    // key
		Kakao.init('e7a47deb2cb2e373f86a6aa99bf4fb5a');
	    
	    $(".kakao_btn").click(function(){
			Kakao.Auth.login({
				scope: 'account_email',
			    success: function (response) {
			      	Kakao.API.request({
			        	url: '/v2/user/me',
			        	success: function (data) {
			        		var id = data.id;
			        		var email = data.kakao_account.email;
			        		$.ajax({
			                    type: "post",
			                    url: "/joinSearch.do",
			                    data: {memberId:id},
			                    success: function (data) {
			                        if(data != 0){
			                        	alert("이미 가입된 정보가 존재합니다.");
			                        	location.href = "/loginFrm.do";
			                        }else{
			                        	// ajax method=post
						        		var form = document.createElement('form');
						    	        var obj = document.createElement('input');
						    	        obj.setAttribute('type', 'hidden');
						    	        obj.setAttribute('name', 'id');
						    	        obj.setAttribute('value', id);
						    	        form.appendChild(obj);
						    	        var obj2 = document.createElement('input');
						    	        obj2.setAttribute('type', 'hidden');
						    	        obj2.setAttribute('name', 'email');
						    	        obj2.setAttribute('value', email);
						    	        form.appendChild(obj2);
						    	        form.setAttribute('method', 'post');
						    	        form.setAttribute('action', "/joinKakaoFrm.do");
						    	        document.body.appendChild(form);
						    	        form.submit();
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
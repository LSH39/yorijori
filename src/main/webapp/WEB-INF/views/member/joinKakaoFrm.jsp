<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join</title>
<link href="/resources/css/member/LoginCommon.css" rel="stylesheet">
<link href="/resources/css/member/JoinCommon.css" rel="stylesheet">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	<%@include file = "/WEB-INF/views/common/header.jsp" %>
	<div class="container">
        <div class="wrap">
            <div class="content">
                <p class="top_txt">KAKAO 회원가입</p>
                <form method="POST" id="join_form">
                    <div class="center">
                        <p class="title">아이디 <span>*</span><span class="join_check"></span></p>
                        <input type="text" name="memberId" class="input_txt" value="${id }" readonly>
						
						<span class="join_check" style="display:none;"></span>
                        <input type="hidden" name="memberPw" class="input_txt" value="kakao">
						
						<p class="title">이메일 <span>*</span><span class="join_check"></span></p>
                        <input type="text" id="kakaoMail" name="memberEmail" class="input_txt" value="${email }" readonly>
						<p class="sub">아이디 / 비밀번호 찾기 시 사용됩니다.</p>

                        <p class="title">이름 <span>*</span><span class="join_check"></span></p>
                        <input type="text" id="memberName" name="memberName" class="input_txt" placeholder="이름 입력" maxlength="4">
                        <p class="sub">조건 : 2~4자리 / 한글 사용가능</p>
                        
                        <p class="title">닉네임 <span>*</span><span class="join_check"></span></p>
                        <input type="text" id="memberNickname" name="memberNickname" class="input_txt" placeholder="닉네임 입력" maxlength="10">
                        <p class="sub">조건 : 2~10자리</p>

                        <p class="title">휴대폰 번호 <span>*</span><span class="join_check"></span></p>
                        <input type="text" id="memberPhone" name="memberPhone" class="input_txt" placeholder="010-0000-0000">
                        
                        <p class="title">생년월일 <span>*</span><span class="join_check"></span></p>
                        <input type="date" id="memberBirth" name="memberBirth" class="input_txt" min="1900-01-01" max="">

                        <p class="title">주소 <span>*</span><span class="join_check"></span></p>
                        <input type="text" id="postcode" name="postcode" class="input_txt" placeholder="우편번호" readonly>
                        <input type="text" id="addressRoad" name="addressRoad" class="input_txt" placeholder="도로명주소" readonly>
                        <input type="text" id="addressDetail" name="addressDetail" class="input_txt" placeholder="상세주소" maxlength="30">
                        <button type="button" class="light_btn check" id="address_btn">주소 검색</button>

                    </div>
                    <hr id="line">
                    <div class="bottom">
                        <label><input type="checkbox" onclick="checkAll();"><span></span><p id="p3_txt">약관 전체 동의</p></label><br>
                        <label><input type="checkbox" onclick="check();"><span></span><p class="bottom_p">만 14세 이상입니다</p><span class="agree">(필수)</span></label><br>
                        <label><input type="checkbox" onclick="check();"><span></span><p class="bottom_p">요리조리 약관 동의</p><span class="agree">(필수)</span></label><p class="agree_info" onclick="textarea(1);">내용보기</p><br>
                        <label><input type="checkbox" onclick="check();"><span></span><p class="bottom_p">전자금융거래 약관 동의</p><span class="agree">(필수)</span></label><p class="agree_info" onclick="textarea(2);">내용보기</p><br>
                        <label><input type="checkbox" onclick="check();"><span></span><p class="bottom_p">개인정보수집 및 이용에 대한 안내</p><span class="agree">(필수)</span></label><p class="agree_info" onclick="textarea(3);">내용보기</p><br>
                        <label><input type="checkbox" onclick="check();" name="consentCheck"><span></span><p class="bottom_p">이벤트/마케팅 수신 동의 (선택)</p></label><p class="agree_info" onclick="textarea(4);">내용보기</p><br>

						<%@include file = "/WEB-INF/views/member/joinText.jsp" %>

                        <input type="button" class="purple_btn" id="submit_btn" value="가입하기">
                    </div>
                </form>
            </div>
        </div>

    </div>

    <%@include file = "/WEB-INF/views/member/joinJs.jsp" %>
    <script>
	    $(function(){
	    	var inputEmail = "${email}";
	    	$.ajax({
		        type: "post",
		        url: "/joinSearch.do",
		        data: {memberEmail:inputEmail},
		        success: function (data) {
		            if(data == 0){
		            	checkEmail = 1;
		            }else{
		            	checkEmail = 0;
		            	$(".join_check").eq(2).text("이미 등록된 이메일입니다.");
		            }
		        }
		    });
	    	console.log(checkEmail);
	    });
	    
    
        // submit
        $("#submit_btn").click(function(){
        	if(checkEmail == 0){
        		alert("이미 등록된 메일입니다.\n일반회원가입으로 진행해주세요.");
        		location.href="/joinCommon.do";
        	}else{
	            if(checkName*checkNickname*checkPhone*checkBirth*checkAddr*checkBox!=1){
	                alert("입력사항을 다시 확인해주세요.");
	                return;
	            }
	            var form = $("#join_form").serialize();
	            $.ajax({
	                type: "post",
	                url: "/joinKakao.do",
	                data: form,
	                success: function (data) {
	                    if(data == "1"){
	                    		alert("회원가입 성공");
	                    		location.href="/loginFrm.do";
	                    }else{
	                    	alert("error");
	                    }
	                }
	            });
        	}
        });
    </script>
	<%@include file = "/WEB-INF/views/common/footer.jsp" %>
</body>
</html>
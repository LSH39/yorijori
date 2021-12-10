<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID/PW Find</title>
<link href="/resources/css/member/LoginCommon.css" rel="stylesheet" type="text/css">
<link href="/resources/css/member/IdPwFind.css" rel="stylesheet" type="text/css">
</head>
<style>
    .top_div:nth-child(2){
        border-bottom: 3px solid #8E44AD;
        color: #8E44AD;
    }
    .top_div:nth-child(2):hover{
    	cursor:pointer;
    }
    #pw_check{
    	float: right;
    	font-size: 14px;
    	height: 27px;
    	line-height: 30px;
    }
</style>
<body>
<c:choose>
	<c:when test="${m.memberNo == null }">
	     <script>
	     	alert("잘못된 접근입니다.");
			location.href="/";
	     </script>
	</c:when>
	<c:otherwise>
		<%@include file = "/WEB-INF/views/common/header.jsp" %>
		<div class="container">
	        <div class="wrap">
	            <div class="content">
	                <div class="top_div" onclick="location.href='/findIdFrm.do'">아이디 찾기</div>
	                <div class="top_div" onclick="location.href='/findPwFrm.do'">비밀번호 찾기</div>
	                <h2 class="h2_txt">비밀번호 변경</h2>
	                <div class="center">
	                    <form id="findPwReFrm" action="/findPwRe.do" method="POST">
	                        <table class="result_tbl">
	                            <tr>
	                                <th><p class="title_txt">비밀번호<span id="pw_check"></span></p></th>
	                            </tr>
	                            <tr>
	                                <td><input type="password" name="memberPw" id="memberPw" class="input_txt" maxlength="16" placeholder="새 비밀번호 입력"></td>
	                            </tr>
	                            <tr>
	                                <td><input type="password" id="memberPw2" class="input_txt" maxlength="16" placeholder="새 비밀번호 재입력"></td>
	                            </tr>
	                            <tr>
	                                <td id="sub_txt">8~16자리 / 영어 소문자, 숫자, 특수문자(#?!@$%^&*-) 모두 포함</td>
	                            </tr>
	                            <tr>
	                                <td><input type="button" class="purple_btn" id="findPwRe" value="비밀번호 변경"></td>
	                            </tr>
	                        </table>
	                        <input type="hidden" name="memberNo" value="${m.memberNo }">
	                    </form>
	                </div>
	            </div>
	
	        </div>
	    </div>
	
	    <script>
	        var checkPw = 0;
	        $("#memberPw").on("keyup change", function(){
	            $(this).val($(this).val().replace(/[^a-z0-9#?!@$%^&*-]/g,''));
	            var inputPw = $("#memberPw").val();
	            checkPw = 0;	
	            if((inputPw != "") && (/(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,16}$/.test(inputPw) == true) && (inputPw == $("#memberPw2").val())){
	            	$("#pw_check").text("비밀번호가 일치합니다.").css("color","#0000FF");
	                checkPw = 1;
	            }else if(inputPw == "") {
	            	$("#pw_check").text("비밀번호를 입력하세요.").css("color","#FF0000");
	            }else if(/(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,16}$/.test(inputPw) == false){
	            	$("#pw_check").text("비밀번호가 조건에 맞지 않습니다.").css("color","#FF0000");	
	            }else if(inputPw != $("#memberPw2").val()){
	            	$("#pw_check").text("비밀번호가 일치하지 않습니다.").css("color","#FF0000");
	            }
	        });
	        $("#memberPw2").on("keyup change", function(){
	            $(this).val($(this).val().replace(/[^a-z0-9#?!@$%^&*-]/g,''));
	            var inputPw = $("#memberPw2").val();
	            checkPw = 0;
	            if((inputPw != "") && (/(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,16}$/.test(inputPw) == true) && (inputPw == $("#memberPw").val())){
	            	$("#pw_check").text("비밀번호가 일치합니다.").css("color","#0000FF");
	            	checkPw = 1;
	            }else{
	            	$("#pw_check").text("비밀번호가 일치하지 않습니다.").css("color","#FF0000");
	            }
	        });
	        $("#findPwRe").click(function(){
	            if(checkPw != 1){
	                alert("입력값을 다시 확인해주세요.")
	                return;
	            }
	            $("#findPwReFrm").submit();
	        });
	    </script>
		<%@include file = "/WEB-INF/views/common/header.jsp" %>
    </c:otherwise>
</c:choose>
</body>
</html>
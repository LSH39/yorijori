<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID/PW Find</title>
<link href="/resources/css/member/LoginCommon.css" rel="stylesheet" type="text/css">
<link href="/resources/css/member/IdPwFind.css" rel="stylesheet" type="text/css">
</head>
<style>
    .top_div:nth-child(1){
        border-bottom: 3px solid #8E44AD;
        color: #8E44AD;
    }
    .top_div:nth-child(2):hover{
    	cursor:pointer;
    }
</style>
<body>
	<%@include file = "/WEB-INF/views/common/header.jsp" %>
	<div class="container">
        <div class="wrap">
            <div class="content">
                <div class="top_div">아이디 찾기</div>
                <div class="top_div" onclick="location.href='/findPwFrm.do'">비밀번호 찾기</div>
                <h2 class="h2_txt">아이디 찾기</h2>
                <div class="center">
                    <form id="findIdFrm" action="/findId.do" method="POST">
                        <table>
                            <tr>
                                <th colspan="2"><p class="title_txt">이름</p></th>
                            </tr>
                            <tr>
                                <td colspan="2"><input type="text" name="memberName" id="memberName" class="input_txt" maxlength="4" placeholder="가입시 입력하신 이름을 입력해주세요"></td>
                            </tr>
                            <tr>
                                <th colspan="2"><p class="title_txt">이메일</p></th>
                            </tr>
                            <tr>
                                <td><input type="email" name="memberEmail" id="memberEmail" class="input_txt" maxlength="50" placeholder="가입시 입력하신 이메일을 입력해주세요"></td>
                                <td><button type="button" id="mailSend" class="light_btn">인증요청</button></td>
                            </tr>
                            <tr id="codeTr">
                                <td><input type="text" max="6" id="inputCode" class="input_txt" placeholder="6자리 인증번호 입력"></td>
                                <td><button type="button" id="codeCheck" class="light_btn">확인</button></td>
                            </tr>
                            <tr>
                                <td colspan="2" id="sub_txt">이메일로 전송된 6자리 인증번호를 입력해주세요. (masterKey : yori12)</td>
                            </tr>
                            <tr>
                                <td colspan="2"><input type="button" class="purple_btn" id="findId" value="아이디 확인"></td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>

        </div>
    </div>

    <script>
        var checkName=0; var checkEmail=0; var checkCode=0; var code="";
        $("#memberName").on("keyup change", function(){
            $(this).val($(this).val().replace(/[^가-힣]/g,''));
            var inputName = $("#memberName").val();
            checkName = 0;
            if(inputName != ""){
                if(inputName.length > this.maxLength){
                    inputName = inputName.slice(0, this.maxLength);
                    $("#memberName").val(inputName);
                }
                if(/[가-힣]{2,4}$/.test(inputName) == true){
                    checkName = 1;
                }
            }
        });
        $("#memberEmail").on("keyup change", function(){
            $(this).val($(this).val().replace(/[^a-zA-Z0-9@.]/g,''));
            var inputEmail = $("#memberEmail").val();
            $("#mailSend").text("인증요청");
            $("#codeTr").css("display","none");
            $("#sub_txt").css("display","none");
            checkEmail = 0; checkCode = 0;
            if((inputEmail != "") && (/^[a-zA-Z0-9]+@([a-z0-9]+.)+[a-z]{2,}$/.test(inputEmail) == true)){
                    checkEmail = 1;
            }
        });

        $("#mailSend").click(function(){
            $("#inputCode").val("");
            checkCode = 0;
            code = ""; // 저장된 인증번호 삭제
            if(checkEmail != 1){
                alert("이메일을 확인해주세요.");
                return;
            }
            var subject="요리조리 메일 인증";
        	var receiver = $("#memberEmail").val();
        	$.ajax({
                type: "post",
                url: "/mailSend.do",
                data: {subject:subject, receiver:receiver},
                success: function (data) {
                	code = data;  // 인증번호저장
                	$("#codeTr").css("display","table-row");
                	$("#sub_txt").css("display","table-row");
                }
            });
        });
        $("#codeCheck").click(function(){
            checkCode = 0;
            if($("#inputCode").val() == code || $("#inputCode").val() == "yori12"){  // masterKey : yori12
                $("#mailSend").text("인증완료");
                $("#codeTr").css("display","none");
                $("#sub_txt").css("display","none");
                checkCode = 1;
            }
        });
        
        $("#findId").click(function(){
            if(checkName*checkEmail*checkCode != 1){
            	if(checkName != 1){
            		alert("이름을 다시 입력해주세요.");
            		return;
            	}else if(checkCode != 1){
            		alert("메일을 인증해주세요.");
            		return;
            	}else{
	                alert("입력값을 다시 확인해주세요.");
	                return;
            	}
            }
            $("#findIdFrm").submit();
        });

    </script>
	<%@include file = "/WEB-INF/views/common/header.jsp" %>
</body>
</html>
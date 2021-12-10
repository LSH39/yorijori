<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                <p class="top_txt">관리자 회원가입</p>
                <form method="get" id="join_form">
                    <div class="center">
                        <p class="title">아이디 <span>*</span><span class="join_check"></span></p>
                        <input type="text" id="memberId" name="memberId" class="input_txt" placeholder="아이디 입력" maxlength='30' onkeyup="idCheck(this);" onchange="idCheck(this);">

                        <p class="title">비밀번호 <span>*</span><span class="join_check"></span></p>
                        <input type="password" id="memberPw" name="memberPw" class="input_txt" placeholder="비밀번호 입력" maxlength='16' onkeyup="pwCheck(this);" onchange="pwCheck(this);">
                        <input type="password" id="memberPw2" class="input_txt" placeholder="비밀번호 재입력" maxlength='16' onkeyup="pwCheck2(this);" onchange="pwCheck2(this);">
                        <p class="sub">조건 : 8~16자리 / 영어 소문자, 숫자, 특수문자(#?!@$%^&*- 가능) 모두 포함</p>
						
						<p class="title">이메일 <span>*</span><span class="join_check"></span></p>
                        <table id="mailTable">
                            <tr>
                                <td><input type="text" id="memberEmail" name="memberEmail" class="input_txt" placeholder="이메일 입력" maxlength='35' onkeyup="emailCheck(this);" onchange="emailCheck(this);"></td>
                                <td><span id="at">@</span></td>
                                <td>
                                    <select name="domain" class="input_txt">
                                        <option value="naver.com">naver.com</option>
                                        <option value="gmail.com">gmail.com</option>
                                        <option value="hanmail.net">hanmail.net</option>
                                        <option value="nate.com">nate.com</option>
                                    </select>
                                </td>
                                <td><button type="button" id="modalbtn" class="light_btn check" data-toggle="modal" data-target="#exampleModalCenter">인증요청</button></td>
                            </tr>
                        </table>
						
                        <p class="title">이름 <span>*</span><span class="join_check"></span></p>
                        <input type="text" id="memberName" name="memberName" class="input_txt" placeholder="이름 입력" maxlength="4">
                        <p class="sub">조건 : 2~4자리 / 한글 사용가능</p>
                        
                        <p class="title">닉네임 <span>*</span><span class="join_check"></span></p>
                        <input type="text" id="memberNickname" name="memberNickname" class="input_txt" placeholder="닉네임 입력" maxlength="10">
                        <p class="sub">조건 : 2~10자리</p>

                        <p class="title">휴대폰 번호 <span>*</span><span class="join_check"></span></p>
                        <input type="text" id="memberPhone" name="memberPhone" class="input_txt" placeholder="010-0000-0000">
                        
                        <p class="title">관리자 인증번호 <span>*</span><span class="join_check"></span></p>
                        <input type="text" id="adminCheck" class="input_txt" placeholder="1234를 입력하세요">
                        
                    </div>
                    <hr id="line">
					<div>
                        <input type="button" class="purple_btn" id="submit_btn" value="가입하기">
                    </div>
                </form>
            </div>
        </div>
	
		<!-- mailCheck -->
        <div>
            <!-- Modal -->
            <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalCenterTitle">메일 인증번호 입력</h5>
                        </div>
                        <div class="modal-body" id="modal-body">
                            <p>작성한 메일로 발송된 인증번호를 확인해주세요.</p>
                            <input type="text" id="modalCheck" class="input_txt" placeholder="인증번호 입력">
                            <button type="button" class="btn btn-secondary" id="check_btn">확인</button><br><br>
                            <p id="tf_p"></p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" id="enter_btn">사용하기</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal" id="close_btn">닫기</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /mailCheck -->
    </div>

    <%@include file = "/WEB-INF/views/member/join.jsp" %>
    <script>
        // submit
        $("#submit_btn").click(function(){
        	var adminCheckNo = "1234";
        	var adminCheckInput = $("#adminCheck").val();
            if(checkId*checkPw*checkEmail*checkName*checkNickname*checkPhone!=1 || adminCheckNo!=adminCheckInput){
                alert("입력사항을 다시 확인해주세요.");
            	return;
            }
            var form = $("#join_form").serialize();
            $.ajax({
                type: "post",
                url: "/joinAdmin.do",
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
        });
    </script>
	<%@include file = "/WEB-INF/views/common/footer.jsp" %>
</body>
</html>
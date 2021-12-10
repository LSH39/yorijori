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
                <p class="top_txt">일반 회원가입</p>
                <form method="POST" id="join_form">
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
            if(checkId*checkPw*checkEmail*checkName*checkNickname*checkPhone*checkBirth*checkAddr*checkBox!=1){
                alert("입력사항을 다시 확인해주세요.");
                return;
            }
            var form = $("#join_form").serialize();
            $.ajax({
                type: "post",
                url: "/joinBasic.do",
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
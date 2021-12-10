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
    .top_div:nth-child(1){
        border-bottom: 3px solid #8E44AD;
        color: #8E44AD;
    }
    .top_div:nth-child(2):hover{
    	cursor:pointer;
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
	                <h2 class="h2_txt">아이디 찾기</h2>
	                <div class="center">
	                    <table class="result_tbl">
	                        <tr id="result_txt">
	                            <th>
	                                <p class="result_txt">입력하신 정보로 등록된 아이디는</p>
	                                <p class="result_txt">${m.memberId }</p>
	                                <p class="result_txt">입니다.</p>
	                            </th>
	                        </tr>
	                        <tr>
	                            <td><input type="button" onclick="location.href='/loginFrm.do'" class="purple_btn" value="로그인하러 가기"></td>
	                        </tr>
	                    </table>
	                </div>
	            </div>
	
	        </div>
	    </div>
		<%@include file = "/WEB-INF/views/common/header.jsp" %>
    </c:otherwise>
</c:choose>
</body>
</html>
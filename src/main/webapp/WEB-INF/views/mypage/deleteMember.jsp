<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>


#delFrm {
	width: 800px;
	height: 300px;
	margin-top:20px;
	margin-bottom: 50px;
    background-color: rgb(244, 232, 250);
	
}
#confirm {
	width: 800px;
	height: 80px;
	margin-top:30px;
	margin-bottom: 50px;
    background-color:rgb(247, 247, 229);
}

.delete{
    width: 400px;
    height: 200px;
    margin: 0 auto;
 
}
#delbutton{
    background-color: rgb(224, 224, 224);
    width:300px;
    height: 30px;
    border: none;
    margin-left: 30px;
}
#memberId{
    width:300px;
    height: 30px;
    margin-bottom: 20px;
    margin-top: 50px;
    margin-left: 30px;
}
#memberPw{
    width:300px;
    height: 30px;
    margin-bottom: 20px;
    margin-left: 30px;
}

/* 메인 콘텐츠 설정 */
.main-content{
    width: 875px;
}


</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
    <div class="main">
       <jsp:include page="/WEB-INF/views/mypage/memberNavi.jsp" />   
        <!-- 메인 콘텐츠 -->
        <div class="main-content">
            <h2 id="h_hotel">회원탈퇴</h2>
            <div id="line2"></div><br>
          <div id="confirm">
              <p><b>${sessionScope.m.memberNickname}님</b>의 정확한 정보확인을 위해 아이디/비밀번호를 다시 확인하겠습니다.</p> </div>
          <div id="delFrm">
          <form action="/deleteMember.do" method="post">
              <div class="delete">
               <input type="text" id="memberId" placeholder="아이디 입력"><br>
               <input type="password" id="memberPw" placeholder="비밀번호 입력"><br>
               <button type="submit" id="delbutton">회원탈퇴하기</button>
              </div>
        </form>
        </div>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
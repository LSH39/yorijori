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
.h_left{
	width: 350px;
	height: 300px;

	float:left;
	margin-left:30px;
	margin-top:20px;
}
.h_right{
	width: 350px;
	height: 300px;

	float:left;
	margin-left:30px;
	margin-top:20px;
}
/* 메인 영역 */
.main{
    width: 1200px;
    margin: 0 auto;
    margin-top: 50px;
    overflow: hidden;
}
.main>div{
    float: left;
}
/* 메인 내부 서브 네비 */
.main-left-box{
    width: 230px;
    padding: 23px;
    box-sizing: border-box;
    background-color: rgb(224, 219, 239);
    margin-right: 60px;
}
.main-left-box>h2{
    margin: 0;
    height: 50px;
    cursor: default;
    border-bottom: 3px solid #565c54;
    margin-bottom: 25px;
}
.main-left-box ul{
    list-style-type: none;
    padding: 0;
}
.main-left-box ul>*{
    text-indent: 5px;
}
.main-left-box>ul>li>span{
    font-family: 'ns_b';
    font-size: 18px;
    cursor: default;
    display: block;
    border-bottom: 1px dotted #b9a989;
    padding-bottom: 8px;
    margin-bottom: 8px;
}
.subnavi{
    margin-bottom: 25px;
}
.subnavi a{
    display: block;
    text-decoration: none;
    font-size: 15px;
    line-height: 23px;
    margin-bottom: 2px;
    position: relative;
}
.subnavi a>span{
    position: absolute;
    right: 10px;
    font-size: 10px;
    font-family: 'ns_b';
    display: none;
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
        <div class="main-left-box">
            <h2>마이페이지</h2>
            <ul>
                <li>
                    <ul class="subnavi">
                        <li><a href="#">내정보 조회 및 수정<span>&gt;</span></a></li>
                        <li><a href="#" id="lf-click">내 구매내역<span>&gt;</span></a></li>
                        <li><a href="#">쿠폰함<span>&gt;</span></a></li>
                        <li><a href="#">회원탈퇴<span>&gt;</span></a></li>
                        <li><a href="#">참여한 경연대회<span>&gt;</span></a></li>
                        <li><a href="#">요리클래스 예약내역<span>&gt;</span></a></li>
                        <li><a href="#">Dm내역<span>&gt;</span></a></li>
                        <li><a href="#">follwer 게시글<span>&gt;</span></a></li>
                        <li><a href="#">찜한 레시피<span>&gt;</span></a></li>
                    </ul>
                </li>
                <li>
                    <span>my write</span>
                    <ul class="subnavi">
                        <li><a href="#">작성후기<span>&gt;</span></a></li>
                        <li><a href="#" id="lf-click">작성 게시글<span>&gt;</span></a></li>
                        <li><a href="#">내 작성 레시피<span>&gt;</span></a></li>
                  
                    </ul>
                </li>
            </ul>
        </div>
        <!-- 메인 콘텐츠 -->
        <div class="main-content">
            <h2 id="h_hotel">판매자회원탈퇴</h2>
            <div id="line2"></div><br>
          <div id="confirm">
              <p>xx님의 정확한 정보확인을 위해 아이디/비밀번호를 다시 확인하겠습니다.</p> </div>
          <div id="delFrm">
          <form action="/deleteSeller.do" method="post">
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
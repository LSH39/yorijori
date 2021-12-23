<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
    display: none;
}
.subnavi>li>a:hover{
		 background-color:rgb(177, 109, 204);
		 }
.subnavi>li>a:focus{
		 background-color:rgb(177, 109, 204);
		 }
#count{
color:red;

}
</style>
</head>
<body>
<div class="main-left-box">
			<h2>마이페이지</h2>
			<ul>
				<li>
					<ul class="subnavi">
						<li><a href="/mypage.do?memberNickname=${sessionScope.m.memberNickname }">내정보 조회 및 수정<span>&gt;</span></a></li>
						<li><a href="/profilePath.do?memberId=${sessionScope.m.memberId }">프로필 사진 바꾸기<span>&gt;</span></a></li>
						<li><a href="/myOrderList.do?memberNo=${sessionScope.m.memberNo }&reqPage=1" id="lf-click">내 구매내역<span>&gt;</span></a></li>
						<li><a href="/mycouponList.do?memberNo=${sessionScope.m.memberNo }&reqPage=1">내 쿠폰함<span>&gt;</span></a></li>
						<li><a href="/deleteFrm.do?">회원탈퇴<span>&gt;</span></a></li>
						<li><a href="/myContestList.do?recipeWriter=${sessionScope.m.memberNo }&reqPage=1">참여한 경연대회<span>&gt;</span></a></li>
						<li><a href="/myclass.do?memberNo=${sessionScope.m.memberNo}">요리클래스 예약내역<span>&gt;</span></a></li>
						<c:choose>
						 	<c:when test="${sessionScope.rm.dmCount==0}">
						<li><a href="/mydmList.do?dmReceiver=${sessionScope.m.memberNickname}">내 쪽지함<span>&gt;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="/mydmList.do?dmReceiver=${sessionScope.m.memberNickname}">내 쪽지함<span>&gt;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b id="count">${sessionScope.rm.dmCount}쪽지 안읽음</b></a></li>
						</c:otherwise>
						</c:choose>
						
						<li><a href="/myChatList.do?chatReceive=${sessionScope.m.memberNo }">내 채팅내역<span>&gt;</span></a></li>
						<li><a href="/followList.do?memberNo=${sessionScope.m.memberNo }">follwer 게시글<span>&gt;</span></a></li>
						<li><a href="/myLikeList.do?memberNo=${sessionScope.m.memberNo }&reqPage=1">좋아요 레시피<span>&gt;</span></a></li>
						<li><a href="/myPoint.do?memberNo=${sessionScope.m.memberNo }&reqPage=1">포인트 내역<span>&gt;</span></a></li>            
					</ul>
				</li>
				<li><span><b>내 작성글</b></span>
					<ul class="subnavi">
					    <li><a href="/myRecipe.do?recipeWriter=${sessionScope.m.memberNo }">내 작성 레시피<span>&gt;</span></a></li>
						<li><a href="/myitemReview.do?memberNickname=${sessionScope.m.memberNickname }">구매 밀키트후기<span>&gt;</span></a></li>
						<li><a href="/myclassReview.do?memberNickname=${sessionScope.m.memberNickname }">작성 클래스후기<span>&gt;</span></a></li>
						<li><a href="/myBoardList.do?freeWriter=${sessionScope.m.memberId }&reqPage=1" id="lf-click">내 작성 게시글<span>&gt;</span></a></li>
						

					</ul></li>
			</ul>
		</div>
</body>
</html>
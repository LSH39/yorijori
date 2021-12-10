<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<title>내 프로필</title>
<script>
	$(function(){
		$(".follow").click(function(){
			/*
			$(".follow").css("background-color", "white");
			$(".follow").css("color", "#0095f6");
			$(".follow").text("언팔로우");
			*/
			
			let myMemberNo = $("#myMemberNo").val();
			let memberNo = $("#memberNo").val();
			
			$.ajax({
				url : "/profileFollow.do",
				type : "post",
				data : {myMemberNo:myMemberNo, memberNo:memberNo},
				success : function(data){
					console.log("팔로"+data);
					if(data == -1){
						alert("올바른 접근이 아닙니다!");						
					}else{
						$(".follow").css("display", "none");						
						$(".unfollow").css("display", "block");						
						$(".profile-info").load(location.href+" .profile-info");
					}
				}
			});
		});
			
		$(".unfollow").click(function(){
			
			let myMemberNo = $("#myMemberNo").val();
			let memberNo = $("#memberNo").val();
			
			$.ajax({
				url : "/profileUnfollow.do",
				type : "post",
				data : {myMemberNo:myMemberNo, memberNo:memberNo},
				success : function(data){
					console.log("언팔"+data);
					if(data == -1){
						alert("올바른 접근이 아닙니다!");
					}else{
						$(".unfollow").css("display", "none");						
						$(".follow").css("display", "block");		
						$(".profile-info").load(location.href+" .profile-info");
						//$(".profile-container").load(location.href+" .profile-container");
						
					}
				}
			});
		});
	});
	
	
	
</script>
<style>


/*
nav{
    min-width: 1024px;
    max-width: 1400px;
    position: fixed;
    width: 100%;
    z-index: 1;
    border-bottom: solid #dbdbdb 1px;
    background: #fff;
}
*/
.nav-cont{
    width: 80%;
    margin: auto;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 10px 50px;
}
.cont-input{
    height: 28px;
    border: solid 1px #dbdbdb;
    display: flex;
    align-items: center;
    background: #fafafa;
    padding: 5px;
}
.cont-input input{
    border: 0;
    outline: none;
    background: #fafafa;
}

.profile-header{
    width: 60%;
    margin: 0 auto;
    transform: translateY(50px);
    padding: 20px 0;
}

.profile-wrap{
	margin-bottom: 120px;
}

.profile-container{
    display: flex;
}
.profile-container img{
    height: 150px;
    width: 150px;
    border-radius: 50%;
    cursor: pointer;
}
.profile-info-wrap{
    margin-left: 100px;
}
.profile-info-header{
    width: 530px;
    display: flex;
    align-items: center;
    margin-bottom: 15px;
    /*justify-content: space-between;*/
}
.profile-info-header h1{
    color: #616161;
    font-weight: 100;
    font-size: 26px;
    margin-bottom: 0;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
}
.profile-info-header button{
    width: 90px;
    height: 30px;
    /* background-color: #fafafa; */
    background-color: #0095f6;
    border: solid #dbdbdb 1px;
    cursor: pointer;
    border-radius: 3px;
    font-weight: 600;
    color: #fff;
    margin-left:20px;
}
.profile-info-header svg{
    cursor: pointer;
}
.profile-info{
    display: flex;

    font-size: 15px;
    margin-bottom: 15px;
}

.profile-info p{
	margin-right: 40px;
}

.profile-intro h2,
.profile-intro .p-ciencia,
.profile-intro .p-creador,
.profile-intro .p-dev,
.profile-intro .p-suscribe{
    font-size: 16px;
    margin-bottom: 5px;
}

.profile-intro .p-ciencia{
    color: #a2a2a2;
}
.profile-intro .p-link{
    text-align: none;
    color: #1e4e7c;
}

.profile-nothing{
	margin-top:60px;
	display:flex;
	flex-direction: column;
	align-items: center;
}

.profile-cameradiv{
    display:flex;
	width:62px;
	height:62px;
	border-radius:50%;
	border: 2px solid black;
	justify-content: center;
    align-items: center;
}

.profile-cameradiv>span{
	width:24px;
	height:24px;
	background:url('./resources/img/member/sample2.png');
	background-repeat: no-repeat;
	background-position: -473px -401px;
	text-indent:-9999px;
}

.feed-nothing{
	margin-top:30px;
	font-size:28px;
}

.line{
    width: 100%;
    height: 1px;
    margin: auto;
    background-color: #dbdbdb;
}
.main-nav{
    display: flex;
    justify-content: space-between;
    align-items: center;
    width: 50%;
    margin: auto;
    padding: 15px;
}
.main-nav a{
    color: #333;
    text-decoration: none;
    font-size: 13px;
}
main{
    width: 70%;
    margin: 0 auto 30px;
    margin-top: 60px;
}
.main-grid{
    display: grid;
    grid-template-columns: repeat(3, 19vw);
    /*grid-template-rows: 19vw;*/
    grid-auto-rows: 19vw;
    gap: 2%;
    height: auto;

}
.main-grid div > img{
    width: 100%;
    height: 100%;
    cursor: pointer;

}

.main-grid div{
	        overflow: hidden;
}

.profile-info-header>span{
    /* background: url('./imgs/vertifi.png'); */
    background: url('./resources/img/member/sample.png');
    background-repeat: no-repeat;
    width: 18px;
    height: 18px;
    text-indent: -9999px;
    display: inline-block;
    margin-left: 8px;
    background-position: 0 -369px;
}

.first{
	position: relative;
}

.second{
	position:absolute;
	top:0;
	bottom:0;
	left:0;
	right:0;
	text-align:center;
	vertical-align: middle;
	text-indent: -9999px;
	color: white;
	font-size: 1.3vw;
	
	}

.second:hover{
	background: rgba(0, 0, 0, 0.3);
	text-indent:0px;
	display: flex;
    align-content: center;
    flex-direction: row;
    flex-wrap: wrap;
    justify-content: center;
    align-items: center;
}

.unfollow{
	background-color:#fafafa;
	color:#0095f6;

}


.profile-view{
	width: 19px;
	height: 19px;
	background: url('./resources/img/member/sample.png');
	background-repeat: no-repeat;
	background-position: -382px -333px;
	margin-right: 7px;
}

.profile-like{
	width: 19px;
	height: 19px;
	background: url('./resources/img/member/sample.png');
	background-repeat: no-repeat;
	background-position: -340px -333px;
	margin-right: 7px;
}

.like-count{
	margin-right:15px;
}


</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<!-- 프로필 -->
	<div class="container">
		<div class="profile-wrap">
			<div class="profile-header">
		        <div class="profile-container">
		        <input type="hidden" id="myMemberNo" value="${sessionScope.m.memberNo }">
		        <input type="hidden" id="memberNo" value="${member.memberNo }">
		            <!-- 프로필 사진 연동 되면 이 부분 주석 지워주세요 
		            <img class="img-profile" src="./resources/img/member/${member.profilePath }" alt="기본프로필">
		            -->
		            <img class="img-profile" src="./resources/img/member/profile_basic.png" alt="기본프로필">
		            <div class="profile-info-wrap">
		                <div class="profile-info-header">
		                    <h1>${member.memberNickname}</h1>
		                    <c:if test="${member.memberLevel eq 2 }">
		                    <span>인증됨</span>
		                    </c:if>
		                    <!-- <button>프로필 수정</button> -->
		                    <c:choose>
		                    	<c:when test="${empty sessionScope.m.memberNo }">
				                    <button>팔로우</button>
		                    	</c:when>
		                    	<c:when test="${member.memberNo ne sessionScope.m.memberNo}">
		                    		<c:choose>
		                    			<c:when test="${empty fl }">
						                    <button class="follow">팔로우</button>
						                    <button class="unfollow" style="display:none;">언팔로우</button>
		                    			</c:when>
		                    			<c:when test="${not empty fl }">
						                    <button class="unfollow">언팔로우</button>
						                    <button class="follow" style="display:none;">팔로우</button>
		                    			</c:when>
		                    		</c:choose>
		                    	</c:when>
		                    	<c:when test="${member.memberNo eq sessionScope.m.memberNo}">
		                    	</c:when>
		                    </c:choose>
		
		                    <!-- <svg aria-label="Opciones" class="_8-yf5 " fill="#262626" height="24" viewBox="0 0 48 48" width="24"><path clip-rule="evenodd" d="M46.7 20.6l-2.1-1.1c-.4-.2-.7-.5-.8-1-.5-1.6-1.1-3.2-1.9-4.7-.2-.4-.3-.8-.1-1.2l.8-2.3c.2-.5 0-1.1-.4-1.5l-2.9-2.9c-.4-.4-1-.5-1.5-.4l-2.3.8c-.4.1-.8.1-1.2-.1-1.4-.8-3-1.5-4.6-1.9-.4-.1-.8-.4-1-.8l-1.1-2.2c-.3-.5-.8-.8-1.3-.8h-4.1c-.6 0-1.1.3-1.3.8l-1.1 2.2c-.2.4-.5.7-1 .8-1.6.5-3.2 1.1-4.6 1.9-.4.2-.8.3-1.2.1l-2.3-.8c-.5-.2-1.1 0-1.5.4L5.9 8.8c-.4.4-.5 1-.4 1.5l.8 2.3c.1.4.1.8-.1 1.2-.8 1.5-1.5 3-1.9 4.7-.1.4-.4.8-.8 1l-2.1 1.1c-.5.3-.8.8-.8 1.3V26c0 .6.3 1.1.8 1.3l2.1 1.1c.4.2.7.5.8 1 .5 1.6 1.1 3.2 1.9 4.7.2.4.3.8.1 1.2l-.8 2.3c-.2.5 0 1.1.4 1.5L8.8 42c.4.4 1 .5 1.5.4l2.3-.8c.4-.1.8-.1 1.2.1 1.4.8 3 1.5 4.6 1.9.4.1.8.4 1 .8l1.1 2.2c.3.5.8.8 1.3.8h4.1c.6 0 1.1-.3 1.3-.8l1.1-2.2c.2-.4.5-.7 1-.8 1.6-.5 3.2-1.1 4.6-1.9.4-.2.8-.3 1.2-.1l2.3.8c.5.2 1.1 0 1.5-.4l2.9-2.9c.4-.4.5-1 .4-1.5l-.8-2.3c-.1-.4-.1-.8.1-1.2.8-1.5 1.5-3 1.9-4.7.1-.4.4-.8.8-1l2.1-1.1c.5-.3.8-.8.8-1.3v-4.1c.4-.5.1-1.1-.4-1.3zM24 41.5c-9.7 0-17.5-7.8-17.5-17.5S14.3 6.5 24 6.5 41.5 14.3 41.5 24 33.7 41.5 24 41.5z" fill-rule="evenodd"></path></svg> -->
		                </div>
		                <!-- 인스타그램은 단위별로 메세지가 다르게나옴 천, 만, 십만,-->
		                <!-- examples 
		                <div class="profile-info">
		                    <p><b>16</b> 게시물</p>
		                    <p><b>39.5천</b> 팔로워</p>
		                    <p><b>619</b> 팔로우</p>
		                </div>
		                -->
		                <div class="profile-info">
		                    <p><b>${rbCnt }</b> 게시물(레시피)</p>
		                    <p><b>${follower}</b> 팔로워</p>
		                    <p><b>${follow }</b> 팔로우</p>
		                </div>    
		                <div class="profile-intro">
		                	<c:choose>
		                		<c:when test="${empty member.profileIntro }">
		        		            <h2>자기 소개가 없습니다.</h2>
		                		</c:when>
		                		<c:otherwise>
				                    <h2>${member.profileIntro }</h2>
		                		</c:otherwise>
		                	</c:choose>
		                	<!-- 언제 써먹을지 모르니 일단 주석
		                    <p class="p-ciencia">점심</p>
		                    <p class="p-creador">메뉴</p>
		                    <p class="p-dev">뭐먹</p>
		                    <p class="p-suscribe">을까요</p>
		                    <a class="p-link" href="https://www.google.com">https://www.google.com</a>
		                	 -->
		                </div>
		            </div>
		        </div>
		    </div>
    	<!-- 메인피드 -->
        <main>
		<div class="line"></div>
        <div class="main-nav">
            <a href="#">
                <svg aria-label="a" class="_8-yf5 " fill="#262626" height="12" viewBox="0 0 48 48" width="12"><path clip-rule="evenodd" d="M45 1.5H3c-.8 0-1.5.7-1.5 1.5v42c0 .8.7 1.5 1.5 1.5h42c.8 0 1.5-.7 1.5-1.5V3c0-.8-.7-1.5-1.5-1.5zm-40.5 3h11v11h-11v-11zm0 14h11v11h-11v-11zm11 25h-11v-11h11v11zm14 0h-11v-11h11v11zm0-14h-11v-11h11v11zm0-14h-11v-11h11v11zm14 28h-11v-11h11v11zm0-14h-11v-11h11v11zm0-14h-11v-11h11v11z" fill-rule="evenodd"></path></svg>
                레시피
            </a>
            <a href="#">
                <svg aria-label="b" class="_8-yf5 " fill="#8e8e8e" height="12" viewBox="0 0 48 48" width="12"><path d="M41 10c-2.2-2.1-4.8-3.5-10.4-3.5h-3.3L30.5 3c.6-.6.5-1.6-.1-2.1-.6-.6-1.6-.5-2.1.1L24 5.6 19.7 1c-.6-.6-1.5-.6-2.1-.1-.6.6-.7 1.5-.1 2.1l3.2 3.5h-3.3C11.8 6.5 9.2 7.9 7 10c-2.1 2.2-3.5 4.8-3.5 10.4v13.1c0 5.7 1.4 8.3 3.5 10.5 2.2 2.1 4.8 3.5 10.4 3.5h13.1c5.7 0 8.3-1.4 10.5-3.5 2.1-2.2 3.5-4.8 3.5-10.4V20.5c0-5.7-1.4-8.3-3.5-10.5zm.5 23.6c0 5.2-1.3 7-2.6 8.3-1.4 1.3-3.2 2.6-8.4 2.6H17.4c-5.2 0-7-1.3-8.3-2.6-1.3-1.4-2.6-3.2-2.6-8.4v-13c0-5.2 1.3-7 2.6-8.3 1.4-1.3 3.2-2.6 8.4-2.6h13.1c5.2 0 7 1.3 8.3 2.6 1.3 1.4 2.6 3.2 2.6 8.4v13zM34.6 25l-9.1 2.8v-3.7c0-.5-.2-.9-.6-1.2-.4-.3-.9-.4-1.3-.2l-11.1 3.4c-.8.2-1.2 1.1-1 1.9.2.8 1.1 1.2 1.9 1l9.1-2.8v3.7c0 .5.2.9.6 1.2.3.2.6.3.9.3.1 0 .3 0 .4-.1l11.1-3.4c.8-.2 1.2-1.1 1-1.9s-1.1-1.2-1.9-1z"></path></svg>
                점심
            </a>
            <a href="#">
                <svg aria-label="c" class="_8-yf5 " fill="#8e8e8e" height="12" viewBox="0 0 48 48" width="12"><path d="M43.5 48c-.4 0-.8-.2-1.1-.4L24 29 5.6 47.6c-.4.4-1.1.6-1.6.3-.6-.2-1-.8-1-1.4v-45C3 .7 3.7 0 4.5 0h39c.8 0 1.5.7 1.5 1.5v45c0 .6-.4 1.2-.9 1.4-.2.1-.4.1-.6.1zM24 26c.8 0 1.6.3 2.2.9l15.8 16V3H6v39.9l15.8-16c.6-.6 1.4-.9 2.2-.9z"></path></svg>
                메뉴
            </a>
            <a href="#">
                <svg aria-label="d" class="_8-yf5 " fill="#8e8e8e" height="12" viewBox="0 0 48 48" width="12"><path d="M41.5 5.5H30.4c-.5 0-1-.2-1.4-.6l-4-4c-.6-.6-1.5-.6-2.1 0l-4 4c-.4.4-.9.6-1.4.6h-11c-3.3 0-6 2.7-6 6v30c0 3.3 2.7 6 6 6h35c3.3 0 6-2.7 6-6v-30c0-3.3-2.7-6-6-6zm-29.4 39c-.6 0-1.1-.6-1-1.2.7-3.2 3.5-5.6 6.8-5.6h12c3.4 0 6.2 2.4 6.8 5.6.1.6-.4 1.2-1 1.2H12.1zm32.4-3c0 1.7-1.3 3-3 3h-.6c-.5 0-.9-.4-1-.9-.6-5-4.8-8.9-9.9-8.9H18c-5.1 0-9.4 3.9-9.9 8.9-.1.5-.5.9-1 .9h-.6c-1.7 0-3-1.3-3-3v-30c0-1.7 1.3-3 3-3h11.1c1.3 0 2.6-.5 3.5-1.5L24 4.1 26.9 7c.9.9 2.2 1.5 3.5 1.5h11.1c1.7 0 3 1.3 3 3v30zM24 12.5c-5.3 0-9.6 4.3-9.6 9.6s4.3 9.6 9.6 9.6 9.6-4.3 9.6-9.6-4.3-9.6-9.6-9.6zm0 16.1c-3.6 0-6.6-2.9-6.6-6.6 0-3.6 2.9-6.6 6.6-6.6s6.6 2.9 6.6 6.6c0 3.6-3 6.6-6.6 6.6z"></path></svg>
                생각
            </a>
        </div>
        <!-- 
        <ul style="display:flex;justify-content:center;list-style:none;border-top: 1px solid #dbdbdb;">
        	<li style="position: relative;display: flex;justify-content: center;">
        		<a href="#" style="border-top: 1px solid black;display:inline-block;">
                <svg aria-label="a" class="_8-yf5 " fill="#262626" height="12" viewBox="0 0 48 48" width="12"><path clip-rule="evenodd" d="M45 1.5H3c-.8 0-1.5.7-1.5 1.5v42c0 .8.7 1.5 1.5 1.5h42c.8 0 1.5-.7 1.5-1.5V3c0-.8-.7-1.5-1.5-1.5zm-40.5 3h11v11h-11v-11zm0 14h11v11h-11v-11zm11 25h-11v-11h11v11zm14 0h-11v-11h11v11zm0-14h-11v-11h11v11zm0-14h-11v-11h11v11zm14 28h-11v-11h11v11zm0-14h-11v-11h11v11zm0-14h-11v-11h11v11z" fill-rule="evenodd"></path></svg>
                	레시피
            	</a>
        	</li>
        	<li>
        		<a href="#" style="border-top: 1px solid black;display:inline-block;">
                <svg aria-label="b" class="_8-yf5 " fill="#8e8e8e" height="12" viewBox="0 0 48 48" width="12"><path d="M41 10c-2.2-2.1-4.8-3.5-10.4-3.5h-3.3L30.5 3c.6-.6.5-1.6-.1-2.1-.6-.6-1.6-.5-2.1.1L24 5.6 19.7 1c-.6-.6-1.5-.6-2.1-.1-.6.6-.7 1.5-.1 2.1l3.2 3.5h-3.3C11.8 6.5 9.2 7.9 7 10c-2.1 2.2-3.5 4.8-3.5 10.4v13.1c0 5.7 1.4 8.3 3.5 10.5 2.2 2.1 4.8 3.5 10.4 3.5h13.1c5.7 0 8.3-1.4 10.5-3.5 2.1-2.2 3.5-4.8 3.5-10.4V20.5c0-5.7-1.4-8.3-3.5-10.5zm.5 23.6c0 5.2-1.3 7-2.6 8.3-1.4 1.3-3.2 2.6-8.4 2.6H17.4c-5.2 0-7-1.3-8.3-2.6-1.3-1.4-2.6-3.2-2.6-8.4v-13c0-5.2 1.3-7 2.6-8.3 1.4-1.3 3.2-2.6 8.4-2.6h13.1c5.2 0 7 1.3 8.3 2.6 1.3 1.4 2.6 3.2 2.6 8.4v13zM34.6 25l-9.1 2.8v-3.7c0-.5-.2-.9-.6-1.2-.4-.3-.9-.4-1.3-.2l-11.1 3.4c-.8.2-1.2 1.1-1 1.9.2.8 1.1 1.2 1.9 1l9.1-2.8v3.7c0 .5.2.9.6 1.2.3.2.6.3.9.3.1 0 .3 0 .4-.1l11.1-3.4c.8-.2 1.2-1.1 1-1.9s-1.1-1.2-1.9-1z"></path></svg>
                	점심
            	</a>
        	</li>
        	<li>
        		<a href="#" style="border-top: 1px solid black;display:inline-block;">
                <svg aria-label="c" class="_8-yf5 " fill="#8e8e8e" height="12" viewBox="0 0 48 48" width="12"><path d="M43.5 48c-.4 0-.8-.2-1.1-.4L24 29 5.6 47.6c-.4.4-1.1.6-1.6.3-.6-.2-1-.8-1-1.4v-45C3 .7 3.7 0 4.5 0h39c.8 0 1.5.7 1.5 1.5v45c0 .6-.4 1.2-.9 1.4-.2.1-.4.1-.6.1zM24 26c.8 0 1.6.3 2.2.9l15.8 16V3H6v39.9l15.8-16c.6-.6 1.4-.9 2.2-.9z"></path></svg>
                	메뉴
            	</a>
        	</li>
        	<li>
        		<a href="#" style="border-top: 1px solid black;display:inline-block;">
                <svg aria-label="d" class="_8-yf5 " fill="#8e8e8e" height="12" viewBox="0 0 48 48" width="12"><path d="M41.5 5.5H30.4c-.5 0-1-.2-1.4-.6l-4-4c-.6-.6-1.5-.6-2.1 0l-4 4c-.4.4-.9.6-1.4.6h-11c-3.3 0-6 2.7-6 6v30c0 3.3 2.7 6 6 6h35c3.3 0 6-2.7 6-6v-30c0-3.3-2.7-6-6-6zm-29.4 39c-.6 0-1.1-.6-1-1.2.7-3.2 3.5-5.6 6.8-5.6h12c3.4 0 6.2 2.4 6.8 5.6.1.6-.4 1.2-1 1.2H12.1zm32.4-3c0 1.7-1.3 3-3 3h-.6c-.5 0-.9-.4-1-.9-.6-5-4.8-8.9-9.9-8.9H18c-5.1 0-9.4 3.9-9.9 8.9-.1.5-.5.9-1 .9h-.6c-1.7 0-3-1.3-3-3v-30c0-1.7 1.3-3 3-3h11.1c1.3 0 2.6-.5 3.5-1.5L24 4.1 26.9 7c.9.9 2.2 1.5 3.5 1.5h11.1c1.7 0 3 1.3 3 3v30zM24 12.5c-5.3 0-9.6 4.3-9.6 9.6s4.3 9.6 9.6 9.6 9.6-4.3 9.6-9.6-4.3-9.6-9.6-9.6zm0 16.1c-3.6 0-6.6-2.9-6.6-6.6 0-3.6 2.9-6.6 6.6-6.6s6.6 2.9 6.6 6.6c0 3.6-3 6.6-6.6 6.6z"></path></svg>
                	추천
            	</a>
        	</li>
        </ul>
         -->
        
        <c:choose>
        	<c:when test="${fn:length(list) eq 0}">
        		<div>
        			<div class="profile-nothing">
        				<div class="profile-cameradiv">
        					<span>카메라</span>
        				</div>
        				<div class="feed-nothing">게시물 없음</div>
        			</div>
        		</div>
        	</c:when>
        	<c:otherwise>
		        <div class="main-grid">
		            <c:forEach items="${list }" var="rb">
		            	<div class="first">
			            	<img src="./resources/img/member/3.jpg" alt="레시피사진">
		    	        	<a href="/recipeView.do?recipeNo=${rb.recipeNo }">
		    	        	<div class="second">
		        	    		<span class="profile-like"></span>
		            			<span class="like-count">4</span>
		            			<span class="profile-view"></span>
		            			<span class="view-count">${rb.readCount }</span>
			            	</div>
		    	        	</a>
		    	        </div>
		            </c:forEach>
		        </div>
        	</c:otherwise>
        </c:choose>
    </main>
    <!-- 메인피드끝 -->
    	</div>
    </div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/dm/styles.css"/>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<meta charset="UTF-8">
<title>메세지</title>
</head>
<body>
  <body id="chat-screen">

    <header class="alt-header">
      <div class="alt-header__column">
        <a class="link" href="/dmList.do">
          <i class="fas fa-chevron-left fa-1x"></i>
        </a>
      </div>
      <div class="alt-header__column">
        <h1 class="alt-header__title">${receiver }</h1>
      </div>
      <div class="alt-header__column">
        <a class="link" href="#">
          <i class="fas fa-search fa-1x"></i>
        </a>
        <a class="link" href="/dmList.do">
          <i class="fas fa-sliders-h fa-1x"></i>
        </a>
      </div>
    </header>

    <main class="main-screen main-chat">
      <div class="chat__timestamp">
        <span>2021년 12월 05일 월요일</span>
      </div>
      
      <c:forEach items="${list }" var="dm">
      <!-- 메세지 받음 -->

      <c:choose>
      	<c:when test="${dm.dmSender != sessionScope.m.memberNickname }">
      <div class="message-row">
        <img src="./resources/img/dm/classtest.jpg"/>
        <div class="message-row__content">
          <span class="message__author">${dm.dmSender }</span>
          <div class="message__info">
            <span class="message__bubble">${dm.dmContent }</span>
            <span class="message__time">${dm.dmDate.substring(11, 16) }</span>
          </div>
        </div>
      </div>
      	</c:when>



      	<c:when test="${dm.dmSender == sessionScope.m.memberNickname }">
      <div class="message-row message-row--own">
        <div class="message-row__content">
          <div class="message__info">
            <span class="message__time">${dm.dmDate.substring(11, 16) }</span>
            <span class="message__bubble">${dm.dmContent }</span>
          </div>
        </div>
      </div>
      	</c:when>
      </c:choose>

      </c:forEach>
      
      <!-- 메세지 받음 -->
      <!-- 
      <div class="message-row">
        <img src="./resources/img/dm/classtest.jpg"/>
        <div class="message-row__content">
          <span class="message__author">멤버 닉네임</span>
          <div class="message__info">
            <span class="message__bubble">아니 환불 왜 안해주냐고요</span>
            <span class="message__time">21:30</span>
          </div>
        </div>
      </div>
       -->
      
      <!-- 메세지 보냄 -->
      <!-- 
      <div class="message-row message-row--own">
        <div class="message-row__content">
          <div class="message__info">
            <span class="message__time">21:32</span>
            <span class="message__bubble">ㅗ</span>
          </div>
        </div>
      </div>
       -->
      
    </main>
	
	<input type="hidden" class="dmSender" value="${sessionScope.m.memberNickname }">
	<input type="hidden" class="classNo" value="${classNo }">
	<input type="hidden" class="dmReceiver" value="${receiver }">
    <form class="reply">
      <div class="reply__column"><i class="far fa-plus-square"></i></div>
      <div class="reply__column">
        <input type="text" placeholder="메세지를 입력해주세요" class="dmContent">
        <i class="far fa-smile"></i>
        <button type="button" id="message__send">
          <i class="fas fa-arrow-up"></i>
        </button>
      </div>
    </form>

    <script src="https://kit.fontawesome.com/6478f529f2.js" crossorigin="anonymous"></script>
    <script>
    	$(function(){
    		$("#message__send").click(function(){
    			let dmReceiver = $(".dmReceiver").val();
    			let dmSender = $(".dmSender").val();
    			let classNo = $(".classNo").val();
    			let dmContent = $(".dmContent").val();
    			
    			console.log(dmReceiver);
    			console.log(dmSender);
    			console.log(classNo);
    			console.log(dmContent);
    			
    			//메세지 작성을 할때 필요한 것
    			//1. dmReceiver, dmSender<-sessionScope.m.memberId, (classNo)로 사용할것, dmContent
    			
    			$.ajax({
    				url : "/dmSend.do",
    				type : "post",
    				data : {classNo:classNo, dmReceiver:dmReceiver, dmSender:dmSender, dmContent:dmContent},
    				success : function(data){
    					if(data=="1"){
    						console.log("성공!(테스트용)");
    					}else if(data=="0"){
    						console.log("실패!(테스트용)");						
    					}
    				}
    				
    				
    				
    				
    				
    				
    				
    				
    				
    				
    				
    			});
    		});
    	});
    </script>
</body>
</html>
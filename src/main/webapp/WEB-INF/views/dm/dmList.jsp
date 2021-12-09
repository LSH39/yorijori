<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/dm/styles.css"/>
<title>메세지 리스트</title>
</head>
<body>
    <header class="screen-header">
      <h1 class="screen-header_title">Chats</h1>
      <div class="screen-header_icons">
        <span><i class="fas fa-search fa-2x"></i></span>
        <span><i class="far fa-comment-dots fa-2x"></i></span>
        <span><i class="fas fa-music fa-2x"></i></span>
        <span class="screen-header_setting">
          <a href="#">
            <i class="fas fa-cog fa-2x"></i>
            <p class="screen-header_dot"></p>
          </a>
        </span>
      </div>
    </header>

	<!-- 
    <main class="main-screen">
      <a class="link" href="/dmView.do">
        <div class="user-component">
          <div class="user-component__column">
            <img class="user-component__profile_img" src="./resources/img/dm/classtest.jpg" />
            <div class="user-component__text">
              <h4 class="user-component__text-name">얘는 샘플</h4>
              <h6 class="user-component__text-preview">
              	예시니까 무시해도 됩니다.
              </h6>
            </div>
          </div>
          <div class="user-component__column">
            <span class="user-component__time">21:22</span>
            <div class="no-badge"></div>
          </div>
        </div>
      </a>
    </main>
	 -->
    
    <c:forEach items="${list }" var="dm">
    <main class="main-screen">
      <a class="link" href="/dmView.do?classNo=${dm.classNo }">
        <div class="user-component">
          <div class="user-component__column">
            <img class="user-component__profile_img" src="./resources/img/dm/classtest.jpg" />
            <div class="user-component__text">
              <h4 class="user-component__text-name">${dm.dmReceiver }</h4>
              <h6 class="user-component__text-preview" >
                ${dm.dmContent }
              </h6>
            </div>
          </div>
          <div class="user-component__column">
            <span class="user-component__time">${dm.dmDate.substring(11, 16) }</span>
            <c:choose>
            	<c:when test="${dm.dmReadFlag eq 1 }">
            		<div class="no-badge">
            		</div>
            	</c:when>
            	<c:when test="${dm.dmReadFlag eq 0 }">
            		<div class="badge">
            		X
            		</div>
            	</c:when>
            </c:choose>
          </div>
        </div>
      </a>
    </main>
    </c:forEach>
    <script
      src="https://kit.fontawesome.com/6478f529f2.js"
      crossorigin="anonymous"
    ></script>
</body>
</html>
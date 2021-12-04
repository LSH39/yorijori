<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/dm/styles.css"/>
<meta charset="UTF-8">
<title>메세지</title>
</head>
<body>
  <body id="chat-screen">

    <header class="alt-header">
      <div class="alt-header__column">
        <a class="link" href="/dmList.do">
          <i class="fas fa-chevron-left fa-2x"></i>
        </a>
      </div>
      <div class="alt-header__column">
        <h1 class="alt-header__title">멤버 닉네임</h1>
      </div>
      <div class="alt-header__column">
        <a class="link" href="#">
          <i class="fas fa-search fa-2x"></i>
        </a>
        <a class="link" href="/dmList.do">
          <i class="fas fa-sliders-h fa-2x"></i>
        </a>
      </div>
    </header>

    <main class="main-screen main-chat">
      <div class="chat__timestamp">
        <span>Wednesday, October 7, 2020</span>
      </div>

      <div class="message-row">
        <img src="./resources/img/dm/classtest.jpg"/>
        <div class="message-row__content">
          <span class="message__author">멤버 닉네임</span>
          <div class="message__info">
            <span class="message__bubble">환불해주세요</span>
            <span class="message__time">21:27</span>
          </div>
        </div>
      </div>

      <div class="message-row message-row--own">
        <div class="message-row__content">
          <div class="message__info">
            <span class="message__time">21:29</span>
            <span class="message__bubble">ㅗ</span>
          </div>
        </div>
      </div>
      
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
      
      <div class="message-row message-row--own">
        <div class="message-row__content">
          <div class="message__info">
            <span class="message__time">21:32</span>
            <span class="message__bubble">ㅗ</span>
          </div>
        </div>
      </div>
      
    </main>

    <form class="reply">
      <div class="reply__column"><i class="far fa-plus-square"></i></div>
      <div class="reply__column">
        <input type="text" placeholder="메세지를 입력해주세요"/>
        <i class="far fa-smile"></i>
        <button>
          <i class="fas fa-arrow-up"></i>
        </button>
      </div>
    </form>

    <script
      src="https://kit.fontawesome.com/6478f529f2.js"
      crossorigin="anonymous"
    ></script>
</body>
</html>
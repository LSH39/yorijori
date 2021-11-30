<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Green Bootstrap Template - Index</title>
  <meta content="" name="description">
  <meta content="" name="keywords">


<!-- header 및 기본 CSS-->
<link rel="stylesheet" href="resources/css/mainpage/header.css">
<!-- 부트스트랩용 jQuery -->
<script type="text/javascript" src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- 부트스트랩 icon -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<!-- Favicons -->
<link href="resources/img/mainpage/favicon.png" rel="icon">
<link href="resources/img/mainpage/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="resources/vendor/animate.css/animate.min.css" rel="stylesheet">
<link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
<link href="resources/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
<link href="resources/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
<link href="resources/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="resources/css/mainpage/style.css" rel="stylesheet">

</head>

<!-- ======= 최상단 부분 ======= -->
  <section id="topbar" class="d-flex align-items-center">
    <div class="container d-flex justify-content-center justify-content-md-between">
      <div class="contact-info d-flex align-items-center">
      </div>
      <div class="social-links d-none d-md-block">
        <a href="#" class="join">회원가입</a>
        <a href="#" class="facebook">로그인</a>
        <a href="#" class="instagram">1:1 문의하기</a>
      </div>
    </div>
  </section>

  <!-- ======= 헤더 ======= -->
  <header id="header" class="d-flex align-items-center">
    <div class="container d-flex align-items-center">

      
      <a href="index.html" class="logo me-auto"><img src="img/mainpage/logo_header.png" alt="" class="img-fluid"></a>

      <nav id="navbar" class="navbar">
        <ul>
          <li><a class="nav-link scrollto active" href="#hero">서비스소개</a></li>
          <li><a class="nav-link scrollto" href="#">레시피</a></li>
          <li class="dropdown"><a href="#"><span>밀키트</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="#">신상품</a></li>
              <li><a href="#">베스트 상품</a></li>
            </ul>
          </li>
          <li><a class="nav-link scrollto " href="#">클래스</a></li>
           <li class="dropdown"><a href="#"><span>이벤트</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="#">경연대회투표</a></li>
              <li><a href="#">우승자 발표</a></li>
              <li><a href="#">역대 우승자</a></li>
            </ul>
          </li>
          <li class="dropdown"><a href="#"><span>커뮤니티</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="#">자유게시판</a></li>
              <li><a href="#">공지사항</a></li>
              <li><a href="#">메뉴추천</a></li>
            </ul>
          </li>
          <li><input type="search" id="mainsearch" placeholder="검색"></li>
          <li><a class="nav-link scrollto" href="#contact">장바구니</a></li>
          <li><a class="getstarted scrollto" href="#about">레시피 작성</a></li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->

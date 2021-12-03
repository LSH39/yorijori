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
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">

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
      <c:choose>
		<c:when test="${empty sessionScope.m }">
        <a href="#" class="join">회원가입</a>
        <a href="#" class="login">로그인</a>
        <a href="/admin.do">관리자 페이지 </a>
        </c:when>
       	<c:otherwise>
       	<a href="#" class="mypage">[${sessionScope.m.memberNickname }]님</a>
       	<a href="#" class="logout">로그아웃</a>
        <a href="#" class="subscribe" style="color:#8E44AD;">월간구독</a>
        <a href="#" class="qna">1:1문의하기</a>
        
       	</c:otherwise>
       </c:choose>
      </div>
    </div>
  </section>

  <!-- ======= 헤더 ======= -->
  <header id="header" class="d-flex align-items-center">
    <div class="container d-flex align-items-center">

      
      <a href="/" class="logo me-auto"><img src="resources/img/mainpage/logo_header.png" alt="" class="img-fluid"></a>

      <nav id="navbar" class="navbar">
        <ul>
          <li><a class="nav-link scrollto" href="#">서비스소개</a></li>
          <li><a class="nav-link scrollto" href="#" id="show-category">레시피</a></li>
          <li class="dropdown"><a href="#"><span>밀키트</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="#">신상품</a></li>
              <li><a href="#">베스트 상품</a></li>
            </ul>
          </li>
          <li><a class="nav-link scrollto " href="#">클래스</a></li>
           <li class="dropdown"><a href="#"><span>이벤트</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="/contestList.do">경연대회투표</a></li>
              <li><a href="/contestResult.do">우승자 발표</a></li>
              <li><a href="#">역대 우승자</a></li>
            </ul>
          </li>
          <li class="dropdown" style="padding-right:15px;"><a href="#"><span>커뮤니티</span> <i class="bi bi-chevron-down"></i></a>
            <ul>

              <li><a href="/noticeList.do">공지사항</a></li>
              <li><a href="/freeboardList.do">자유게시판</a></li>
              <li><a href="#">메뉴추천</a></li>
            </ul>
          </li>
          <li>
          <form action="/mainpagesearch.do" method="get" id="headersearchBar">
          <input type="search" class="nav-link scrollto" id="header-mainsearch" placeholder="검색"></li>
          <input type="hidden" name="reqPage" value=1>
          <input type="submit" id="headersearchsubmit" style="display: none;"></input>
          <label for="headersearchsubmit"><img src="/resources/img/mainpage/search_icon.png" style="width: 25px; height: 25px; top: 13px; left: 74%; position: absolute;"></label>
          </form>
          <li><a class="nav-link scrollto" href="#"><img src="resources/img/mainpage/cart.png" class="img-fluid" style="width: 40px;"></a></li>
          <li><a class="getstarted scrollto" href="#">레시피 작성</a></li>
          
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->
      
      
            <!-- 레시피 카테고리 -->
    	<!-- <form action="/recipes.do" method="get"><input name="utf8" type="hidden" value="&#x2713;" />
		<div class="row recipe-category">
			<div class="col">
			<ul>
				<li class="recipe-category-1">
					<h3>
						<span>상황에 맞는 요리</span>
					</h3>
					<ul>
						<li>
							<label><input type="radio" name="category-group1" value="1"/>면역력 강화</label>
						</li>
						<li>
							<label><input type="radio" name="category-group1" value="1"/>면역력 강화</label>
						</li>
						<li>
							<label><input type="radio" name="category-group1" value="1"/>면역력 강화</label>
						</li>
						<li>
							<label><input type="radio" name="category-group1" value="1"/>면역력 강화</label>
						</li>
					</ul>
				</li>
			</div>
			<div class="col">
				<li class="recipe-category-2">
					<h3>
						<span>상황에 맞는 요리</span>
					</h3>
					<ul>
						<li>
							<label><input type="radio" name="category-group1" value="1"/>면역력 강화</label>
						</li>
						<li>
							<label><input type="radio" name="category-group1" value="1"/>면역력 강화</label>
						</li>
						<li>
							<label><input type="radio" name="category-group1" value="1"/>면역력 강화</label>
						</li>
						<li>
							<label><input type="radio" name="category-group1" value="1"/>면역력 강화</label>
						</li>
					</ul>
				</li>		
			</ul>
			</div>
		</div>
			<div class="btn-area">
				<button type="submit" class="btn-search">검색하기</button>
				<button type="button" class="btn-close">닫기</button>
			</div>
		</div>
	</form>
	-->
	<!-- //마우스오버시 보이는 레이어메뉴 -->
	

    </div>
    
  </header><!-- End Header -->
     <!-- 따라다니는 우측 퀵 메뉴 -->
  <div class="quickmenu"> 
  	<ul>
  		<li><a href="#"><img src="/resources/img/mainpage/basket.png"> 최근 본 상품</a></li>
  		<li><a href="#"><img src="/resources/img/mainpage/q_mark.png"> 질문있어요</a></li>
  		<li><a href="#"><img src="/resources/img/mainpage/message.png"> 내 메세지</a></li>
  	</ul>
  </div>
  
  <script>
  	$(function(){
  		$('.recipe-category').hide();
  	})
  	  $('#show-category').on('click', function(){
  		  $('.recipe-category').toggle();
  	  })
	  $('.recipe-category').on('click', 'input:radio', function () {
	    $(this).parent('label').parent('li').toggleClass('checked', this.checked);
	  });
  </script>
  
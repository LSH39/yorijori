<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요리조리 - 메인</title>
<link rel="stylesheet" href="resources/css/mainpage/common.css">
</head>
<body>

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<!-- ======= 메인배너 Section ======= -->
  <section id="hero">
    <div id="heroCarousel" data-bs-interval="5000" class="carousel slide carousel-fade" data-bs-ride="carousel">

      <ol class="carousel-indicators" id="hero-carousel-indicators"></ol>

      <div class="carousel-inner" role="listbox">
        
        <!-- Slide 1 -->
        <div class="carousel-item" style="background-image: url(resources/img/mainpage/mainbanner_1.jpg)">
          <div class="carousel-container">
            <div class="container">
              <h2 class="animate__animated animate__fadeInDown">요린이도 <span>걱정 NO!</span></h2>
              <p class="animate__animated animate__fadeInUp">비건 식단부터 다양한 상황별 요리, 난이도 쉬움 레시피까지 <span style="font-weight:bolder;">요리조리</span>에서 뚝딱 만들어보세요.</p>
              <a href="/siteInfo.do" class="btn-get-started animate__animated animate__fadeInUp scrollto">자세히</a>
            </div>
          </div>
        </div>
        

        <!-- Slide 2 -->
        <div class="carousel-item" style="background-image: url(resources/img/mainpage/mainbanner_2.jpg)">
          <div class="carousel-container">
            <div class="container">
              <h2 class="animate__animated animate__fadeInDown" style="font-family: 'TmoneyRoundWindRegular', serif; font-weight: 700; font-size: 40px;"><span style="color:rgb(192, 57, 43); margin-bottom: 0px;">2021</span>년 <span style="color:rgb(192, 57, 43); margin-bottom: 0px;">12</span>월의 기적</h2>
              <h3 class="animate__animated animate__fadeInDown" style="font-family: 'TmoneyRoundWindRegular', sans-serif; font-size: 24px; color: #fff; margin-top: 5px;">요리조리의 크리스마스는 경연대회로 현재진행중!</h3>
              <h3 class="animate__animated animate__fadeInDown" style="font-family: 'TmoneyRoundWindRegular', sans-serif; font-size: 24px; color: #000; margin-top: 5px; margin-bottom: 10px;">최대 <span style="color:rgb(192, 57, 43);">20</span>만 포인트 <span style="color:rgb(192, 57, 43);">+</span> <span style="color:rgb(192, 57, 43);">밀키트</span> 상품 제작</h3>
              <a href="/contestInfo.do" class="btn-get-started animate__animated animate__fadeInUp scrollto">자세히</a>
            </div>
          </div>
        </div> 
        
          <!-- Slide 3 -->
        <div class="carousel-item" style="background-image: url(resources/img/mainpage/mainbanner_4.jpg)">
          <div class="carousel-container">
            <div class="container">
              <h2 class="animate__animated animate__fadeInDown" style="font-family: 'Noto Sans KR', serif; font-weight: 700; font-size: 42px; color: black;">신선한 샐러드도 이제는 배송 받자!</h2>
              <h4 class="animate__animated animate__fadeInDown" style="font-family: 'TmoneyRoundWindRegular', sans-serif; font-size: 28px; color: black; margin-top: 5px;">요리조리 밀키트로 간편하게 해결</h4>
            </div>
          </div>
        </div> 
        
        <!-- Slide 4 -->
        <div class="carousel-item active" style="background-image: url(resources/img/mainpage/mainbanner_3.jpg)">
          <div class="carousel-container">
            <div class="container">
              <h2 class="animate__animated animate__fadeInDown" style="margin-bottom: 0; color: #FF8554; margin-left: 90px;">YORIJORI</h2>
              <h2 class="animate__animated animate__fadeInDown" style="margin-top: 0; margin-bottom: 10px; color: #FFB192; margin-left: 90px;">Membership</h2>
              <p class="animate__animated animate__fadeInUp" style="font-family: 'TmoneyRoundWindRegular', sans-serif; color: #FF8554; margin-left: 90px;">오직 회원만 누리는 공식몰 단독 혜택</p>
            </div>
          </div>
        </div>

      </div>

      <a class="carousel-control-prev" href="#heroCarousel" role="button" data-bs-slide="prev">
        <span class="carousel-control-prev-icon bi bi-chevron-left" aria-hidden="true"></span>
      </a>

      <a class="carousel-control-next" href="#heroCarousel" role="button" data-bs-slide="next">
        <span class="carousel-control-next-icon bi bi-chevron-right" aria-hidden="true"></span>
      </a>
      

    </div>
  </section><!-- End Hero -->

  <main id="main">
  
  <!-- ======= 믿고 보는 레시피 Section ======= -->
    <section id="services" class="services">
      <div class="container">

       <!--  <div class="section-title">
          <h2>Services</h2>
          <p>Magnam dolores commodi suscipit. Necessitatibus eius consequatur ex aliquid fuga eum quidem. Sit sint consectetur velit. Quisquam quos quisquam cupiditate. Et nemo qui impedit suscipit alias ea. Quia fugiat sit in iste officiis commodi quidem hic quas.</p>
        </div>
       -->
        
        <div class="header-section-title">
          <h2>믿고 보는 레시피 리스트</h2>
          <p>회원들이 엄선한 레시피를 다양한 테마별로 확인해보세요.</p>
        </div>

        <div class="liked-recipes row">
          <div class="col-lg-4 col-md-6" data-aos="zoom-in" data-aos-delay="100">
	      	<a href="/bestRecipes.do?category=1">   
	            <div class="main-banner-pic">
	            	<div>
	              		<h4>간단하게 만드는 술안주 베스트</h4>
	              		<p>집에서 술 한잔이 땡길 때 손쉽게 만들어 먹는 안주 모음</p>
	            	</div>
	            </div>
	         </a>
          </div>
          <div class="col-lg-4 col-md-6" data-aos="zoom-in" data-aos-delay="100">
	      	<a href="/bestRecipes.do?category=2">   
	            <div class="main-banner-pic">
	            	<div>
	              		<h4>분식 요리 베스트</h4>
	              		<p>떡볶이는 집에서 만들면 맛이 없다? 노우노우~</p>
	            	</div>
	            </div>
	         </a>
          </div>
          <div class="col-lg-4 col-md-6" data-aos="zoom-in" data-aos-delay="100">
	      	<a href="/bestRecipes.do?category=3">   
	            <div class="main-banner-pic">
	            	<div>
	              		<h4>튀김요리 베스트</h4>
	              		<p>바삭바삭한 튀김 요리는 못 참지!</p>
	            	</div>
	            </div>
	         </a>
          </div>
          <div class="col-lg-4 col-md-6" data-aos="zoom-in" data-aos-delay="100">
	      	<a href="/bestRecipes.do?category=4">   
	            <div class="main-banner-pic">
	            	<div>
	              		<h4>몸보신 음식 베스트</h4>
	              		<p>입맛이 없을 때, 원기보충이 필요할 때, 건강 챙길 때</p>
	            	</div>
	            </div>
	         </a>
          </div>
          <div class="col-lg-4 col-md-6" data-aos="zoom-in" data-aos-delay="100">
	      	<a href="/bestRecipes.do?category=5">   
	            <div class="main-banner-pic">
	            	<div>
	              		<h4>다이어트 레시피 베스트</h4>
	              		<p>다이어트 음식에 대한 편견을 버리게 해 줄 레시피 모음</p>
	            	</div>
	            </div>
	         </a>
          </div>
          <div class="col-lg-4 col-md-6" data-aos="zoom-in" data-aos-delay="100">
	      	<a href="/bestRecipes.do?category=6">   
	            <div class="main-banner-pic">
	            	<div>
	              		<h4>베이킹 요리 베스트</h4>
	              		<p>만들기 어렵지 않아요. 정성을 선물하기 좋은 기회</p>
	            	</div>
	            </div>
	         </a>
          </div>          
        </div>

      </div>
    </section><!-- End Services Section -->
  
  <!-- ======= 밀키트 신상품 Section ======= -->
  <section id="main-newproducts" class="main-newproducts">
  <div class="container">
	  <div class="section-title">
	          <h2>
	          	핫한 신상품
	          	<script src="https://cdn.lordicon.com/libs/mssddfmo/lord-icon-2.1.0.js"></script>
				<lord-icon
				    src="https://cdn.lordicon.com/dnoiydox.json"
				    trigger="loop"
				    colors="primary:#121331,secondary:#c69cf4"
				    style="width:50px;height:50px">
				</lord-icon>
	          </h2>
	          <p>방금 들어온 따끈따끈한 신상 밀키트 상품을 만나보세요.</p>
	  </div>
	  <div class="clients-slider swiper">
          <div class="swiper-wrapper align-items-center">
            <c:forEach items="${productList }" var="p" begin="1" end="8">
            <div class="swiper-slide">
            	<a href="/milkitView.do?productNo=${p.productNo }">
            		<img src="resources/upload/product/${p.filepath }" class="img-fluid" alt="">
            		<h5>${p.milkitName }</h5>
            		<h6> 
            			<span class="main-product-price"><fmt:formatNumber value="${p.milkitPrice}" pattern="#,###"/></span>원
            		</h6>
            	</a>
            </div>
            </c:forEach>
          </div>
          <div class="swiper-pagination"></div>
        </div>
   </div>
  </section><!-- 밀키트 신상품 Section 끝 -->
  
     <!-- ======= 광고 Section ======= -->
    <section id="cta" class="cta">
      <div class="container">
        <div class="row">
          <div class="col-lg-10">
            <img src="resources/img/mainpage/ad-banner-re.gif" style="height:550px;">
          </div>
        </div>
      </div>
    </section><!-- End 광고 Section -->
    
    <!-- ======= 회원목록 Section ======= -->
    <section id="team" class="team section-bg">
      <div class="container">
      <input type="hidden" id="loginMemberNo" value="${sessionScope.m.memberNo }">
      <input type="hidden" id="loginMemberId" value="${sessionScope.m.memberId }">

        <div class="section-title">
          <h2>지금 뜨는 회원</h2>
          <div>
          	<button class="btn-main mainmemberlist">요리꾼</button><button class="btn-main mainmemberlist">조리꾼</button>
          </div>
        </div>
		
		<!-- 요리꾼 목록 -->
        <div class="row main-memberList"> 
          <c:forEach items="${yoriList }" var="y" begin="1" end="4">
          	<div class="col-lg-3 col-md-5 d-flex align-items-stretch">
          		<div class="member">
          			<img src="resources/upload/member_profile/${y.profilePath }" alt="">
          			<h4 class="memberNick">${y.memberNickname }</h4>
          			<input type="hidden" class="memberNo" value="${y.memberNo }">
          			<span></span>
          			<p>
          			 <c:choose>
          			 	<c:when test="${y.profileIntro eq null }">
          			 		안녕하세요.
          			 	</c:when>
          			 	<c:otherwise>
          			 		${y.profileIntro }
          			 	</c:otherwise>
          			 </c:choose>
          			</p>
          			<c:choose>
						<c:when test="${y.memberNo eq sessionScope.m.memberNo && sessionScope.m.memberNo ne null }">
							<div class="social main-myself">
		          				<span class="main-follower-count" style="color:#BE44AD;font-weight:bolder;">${y.followerCount }</span>
		          				<script src="https://cdn.lordicon.com/libs/mssddfmo/lord-icon-2.1.0.js"></script>
								<script src="https://cdn.lordicon.com/libs/mssddfmo/lord-icon-2.1.0.js"></script>
								<lord-icon
								    src="https://cdn.lordicon.com/jpdtnwas.json"
								    trigger="click"
								    colors="primary:#121331,secondary:#e86830"
								    style="width:50px;height:50px">
								</lord-icon>
		          			</div>
						</c:when>
						<c:when test="${y.memberNo ne sessionScope.m.memberNo || sessionScope.m.memberNo eq null }">
							<div class="social main-follow">
		          				<span class="main-follower-count" style="color:#BE44AD;font-weight:bolder;">${y.followerCount }</span>
		          				<script src="https://cdn.lordicon.com/libs/mssddfmo/lord-icon-2.1.0.js"></script>
								<script src="https://cdn.lordicon.com/libs/mssddfmo/lord-icon-2.1.0.js"></script>
								<lord-icon
								    src="https://cdn.lordicon.com/jpdtnwas.json"
								    trigger="click"
								    colors="primary:#121331,secondary:#e86830"
								    style="width:50px;height:50px">
								</lord-icon>
								<span class="main-follow-stat">팔로우</span>
		          			</div>
						</c:when>
					</c:choose>
          		</div>
          	  </div>
          	</c:forEach>
      </div>
      
      <!-- 조리꾼 목록 -->
      <div class="row main-memberList">
          <c:forEach items="${joriList }" var="j" begin="1" end="4">
          	<div class="col-lg-3 col-md-5 d-flex align-items-stretch">
          		<div class="member">
          			<img src="resources/upload/member_profile/${j.profilePath }" alt="">
          			<h4 class="memberNick">${j.memberNickname }</h4>
          			<input type="hidden" class="memberNo" value="${j.memberNo }">
          			<span></span>
          			<p>
          			 <c:choose>
          			 	<c:when test="${j.profileIntro eq null }">
          			 		안녕하세요.
          			 	</c:when>
          			 	<c:otherwise>
          			 		${j.profileIntro }
          			 	</c:otherwise>
          			 </c:choose>
          			</p>
          			<c:choose>
						<c:when test="${j.memberNo eq sessionScope.m.memberNo && sessionScope.m.memberNo ne null}">
							<div class="social main-myself">
		          				<span class="main-follower-count" style="color:#BE44AD;font-weight:bolder;">${j.followerCount }</span>
		          				<script src="https://cdn.lordicon.com/libs/mssddfmo/lord-icon-2.1.0.js"></script>
								<script src="https://cdn.lordicon.com/libs/mssddfmo/lord-icon-2.1.0.js"></script>
								<lord-icon
								    src="https://cdn.lordicon.com/jpdtnwas.json"
								    trigger="click"
								    colors="primary:#121331,secondary:#e86830"
								    style="width:50px;height:50px">
								</lord-icon>
		          			</div>
						</c:when>
						<c:when test="${j.memberNo ne sessionScope.m.memberNo || sessionScope.m.memberNo eq null }">
							<div class="social main-follow">
		          				<span class="main-follower-count" style="color:#BE44AD;font-weight:bolder;">${j.followerCount }</span>
		          				<script src="https://cdn.lordicon.com/libs/mssddfmo/lord-icon-2.1.0.js"></script>
								<script src="https://cdn.lordicon.com/libs/mssddfmo/lord-icon-2.1.0.js"></script>
								<lord-icon
								    src="https://cdn.lordicon.com/jpdtnwas.json"
								    trigger="click"
								    colors="primary:#121331,secondary:#e86830"
								    style="width:50px;height:50px">
								</lord-icon>
								<span class="main-follow-stat">팔로우</span>
		          			</div>
						</c:when>
					</c:choose>
          		</div>
          	  </div>
          	</c:forEach>
      </div>
      
    </section><!-- End Team Section -->
    
    <!-- ======= 요리클래스 Section ======= -->
  <section id="main-newclasses" class="main-newclasses">
  <div class="container">
	  <div class="section-title">
	          <h2>
	          	모집중인 클래스
	          	<script src="https://cdn.lordicon.com/libs/mssddfmo/lord-icon-2.1.0.js"></script>
				<lord-icon
				    src="https://cdn.lordicon.com/ajyyzcwv.json"
				    trigger="loop"
				    colors="primary:#121331,secondary:#e5d1fa"
				    style="width:50px;height:50px">
				</lord-icon>
	          </h2>
	          <p>걱정마세요. 이젠 원격으로도 가능해요.</p>
	  </div>
	  <div class="classes-slider swiper">
          <div class="swiper-wrapper align-items-center">
            <c:forEach items="${classList }" var="c" begin="1" end="8">
            <div class="swiper-slide">
            	<a href="/cookingClsView.do?classNo=${c.classNo }">
            		<img src="resources/img/mainpage/cooking-cls.jpg" class="img-fluid" alt="">
            		<h5>${c.classTitle }</h5>
            		<h6>평점 <span class="main-classrate"><i class="bi bi-star-fill"></i>${c.classRate }</span></h6>
            		<h6><span>수강인원: ${c.classNop }</span></h6>
            		<h6 class="classLocation1">
            		<c:choose>
            			<c:when test="${c.classLocation1 eq null }">
            				<span>원격</span> <i class="bi bi-laptop"></i>
            			</c:when>
            			<c:otherwise>
            				<span>${c.classLocation1 }</span>	
            			</c:otherwise>
            		</c:choose>
            		</h6>
            	</a>
            </div>
            </c:forEach>
          </div>
          <div class="swiper-button-next"></div>
      	  <div class="swiper-button-prev"></div>
      	  <div class="swiper-pagination"></div>
        </div>
   </div>
  </section><!-- 요리클래스 Section 끝 -->
  
  <!-- ======= 왜 요리조리 섹션 ======= -->
    
    <section id="featured-services" class="featured-services section-bg">
      <div class="container">
		 <div class="section-title">
	          <h2>
	          	밀키트 구독권
	          	<i class="bi bi-egg-fried" style="color:#FBDC2F;"></i>
	          </h2>
	          <p>요리조리의 밀키트 구독권 서비스를 선택해야 하는 이유!</p>
	     </div>
        <div class="row no-gutters">
          <div class="col-lg-4 col-md-6">
            <div class="icon-box">
              <div class="icon"><i class="bi bi-laptop"></i></div>
              <h4 class="title"><a href="">Lorem Ipsum</a></h4>
              <p class="description">Voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident</p>
            </div>
          </div>
          <div class="col-lg-4 col-md-6">
            <div class="icon-box">
              <div class="icon"><i class="bi bi-briefcase"></i></div>
              <h4 class="title"><a href="">Dolor Sitema</a></h4>
              <p class="description">Minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat tarad limino ata</p>
            </div>
          </div>
          <div class="col-lg-4 col-md-6">
            <div class="icon-box">
              <div class="icon"><i class="bi bi-calendar4-week"></i></div>
              <h4 class="title"><a href="">Sed ut perspiciatis</a></h4>
              <p class="description">Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur trade stravi</p>
            </div>
          </div>
        </div>

      </div>
    </section><!-- End Featured Services Section -->

    <!-- ======= Portfolio Section ======= -->
    <section id="portfolio" class="portfolio">
      <div class="container">

        <div class="section-title">
          <h2>Portfolio</h2>
          <p>Magnam dolores commodi suscipit. Necessitatibus eius consequatur ex aliquid fuga eum quidem. Sit sint consectetur velit. Quisquam quos quisquam cupiditate. Et nemo qui impedit suscipit alias ea. Quia fugiat sit in iste officiis commodi quidem hic quas.</p>
        </div>

        <div class="row">
          <div class="col-lg-12 d-flex justify-content-center">
            <ul id="portfolio-flters">
              <li data-filter="*" class="filter-active">All</li>
              <li data-filter=".filter-app">App</li>
              <li data-filter=".filter-card">Card</li>
              <li data-filter=".filter-web">Web</li>
            </ul>
          </div>
        </div>

        <div class="row portfolio-container">

          <div class="col-lg-4 col-md-6 portfolio-item filter-app">
            <div class="portfolio-wrap">
              <img src="resources/img/mainpage/portfolio/portfolio-1.jpg" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h4>App 1</h4>
                <p>App</p>
                <div class="portfolio-links">
                  <a href="resources/img/mainpage/portfolio/portfolio-1.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="App 1"><i class="bx bx-plus"></i></a>
                  <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-web">
            <div class="portfolio-wrap">
              <img src="resources/img/mainpage/portfolio/portfolio-2.jpg" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h4>Web 3</h4>
                <p>Web</p>
                <div class="portfolio-links">
                  <a href="resources/img/mainpage/portfolio/portfolio-2.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="Web 3"><i class="bx bx-plus"></i></a>
                  <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-app">
            <div class="portfolio-wrap">
              <img src="resources/img/mainpage/portfolio/portfolio-3.jpg" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h4>App 2</h4>
                <p>App</p>
                <div class="portfolio-links">
                  <a href="resources/img/mainpage/portfolio/portfolio-3.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="App 2"><i class="bx bx-plus"></i></a>
                  <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-card">
            <div class="portfolio-wrap">
              <img src="resources/img/mainpage/portfolio/portfolio-4.jpg" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h4>Card 2</h4>
                <p>Card</p>
                <div class="portfolio-links">
                  <a href="resources/img/mainpage/portfolio/portfolio-4.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="Card 2"><i class="bx bx-plus"></i></a>
                  <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-web">
            <div class="portfolio-wrap">
              <img src="resources/img/mainpage/portfolio/portfolio-5.jpg" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h4>Web 2</h4>
                <p>Web</p>
                <div class="portfolio-links">
                  <a href="resources/img/mainpage/portfolio/portfolio-5.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="Web 2"><i class="bx bx-plus"></i></a>
                  <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-app">
            <div class="portfolio-wrap">
              <img src="resources/img/mainpage/portfolio/portfolio-6.jpg" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h4>App 3</h4>
                <p>App</p>
                <div class="portfolio-links">
                  <a href="resources/img/mainpage/portfolio/portfolio-6.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="App 3"><i class="bx bx-plus"></i></a>
                  <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-card">
            <div class="portfolio-wrap">
              <img src="resources/img/mainpage/portfolio/portfolio-7.jpg" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h4>Card 1</h4>
                <p>Card</p>
                <div class="portfolio-links">
                  <a href="resources/img/mainpage/portfolio/portfolio-7.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="Card 1"><i class="bx bx-plus"></i></a>
                  <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-card">
            <div class="portfolio-wrap">
              <img src="resources/img/mainpage/portfolio/portfolio-8.jpg" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h4>Card 3</h4>
                <p>Card</p>
                <div class="portfolio-links">
                  <a href="resources/img/mainpage/portfolio/portfolio-8.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="Card 3"><i class="bx bx-plus"></i></a>
                  <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-web">
            <div class="portfolio-wrap">
              <img src="resources/img/mainpage/portfolio/portfolio-9.jpg" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h4>Web 3</h4>
                <p>Web</p>
                <div class="portfolio-links">
                  <a href="resources/img/mainpage/portfolio/portfolio-9.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="Web 3"><i class="bx bx-plus"></i></a>
                  <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                </div>
              </div>
            </div>
          </div>

        </div>

      </div>
    </section><!-- End Portfolio Section -->

  </main><!-- End #main -->

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
  <script>
  	  $(function(){
  		  var memberbtn = $(".mainmemberlist");
  		  memberbtn.eq(0).addClass("active-btn");
  		  $(".main-memberList").eq(1).hide();
  		  
  		  memberbtn.on("click", function(){
  			 var index = $(this).index();
  			 memberbtn.removeClass("active-btn");
  			 $(this).addClass("active-btn");
  			 $(".main-memberList").hide();
  			 $(".main-memberList").eq(index).show();
  		  });
  		  
  		  $(".cta").find("img").on("mouseover", function(){
  			  $(this).attr("src", "resources/img/mainpage/ad-banner-static.png");
  		  });
  		  
  		  
  		  //팔로우 여부 확인
    		var memberNo = $("#loginMemberNo").val();
    		if(memberNo != null){
    	 		$.ajax({
	  				url: "/followCheck.do",
	  				type: "get",
	  				data: {memberNo:memberNo},
	  				success: function(data){
	  					if(data.length>0){
	  						var list = data;
	  						for(var i=0;i<list.length; i++){
	  							var label = $('.memberNick:contains('+list[i].followingNick+')').parent().children('.main-follow').children('.main-follow-stat');
	  							label.html("팔로우중");
	  							label.css("color", "#8E44AD").css("font-weight", "bolder");
	  						}
	  						
	  					}
	  				}
  		
    			});
    		}
  		  
  		  //팔로우하기 / 언팔로우하기
  		  $(".main-follow").on("click", function(){
  			var memberId = $("#loginMemberId").val();
  			var memberNo = $("#loginMemberNo").val();
  			var followCheck = $(this).children(".main-follow-stat");
  			var followNo = $(this).parent().children(".memberNo").val();
  			var followerCount = $(this).children(".main-follower-count");
  			if(memberId != "" && followCheck.html() == "팔로우"){
  				$.ajax({
  					url: "/followMem.do",
  					type: "get",
  					data: {memberNo:memberNo, followNo:followNo},
  					success: function(data){
  						var count = data;
  						followerCount.html(count);
  						followCheck.html("팔로우중");
  						followCheck.css("color", "#8E44AD").css("font-weight", "bolder");
  					}
  				});
  			} else if (memberId != "" && followCheck.html() == "팔로우중"){
  				var unfollow_ans = confirm("팔로우를 취소하시겠습니까?");
  				if(unfollow_ans == true){
  					$.ajax({
  	  					url: "/delFollow.do",
  	  					type: "get",
  	  					data: {memberNo:memberNo, followNo:followNo},
  	  					success: function(data){
  	  						var count = data;
  	  						followerCount.html(count);
  	  						followCheck.html("팔로우");
  							followCheck.css("color", "#000").css("font-weight", "lighter");
  	  					}
  	  				});
  				} else {
  					return false;
  				}
  			} else if (memberId == ""){
  				alert("로그인시 이용 가능합니다.");
  				return false;
  			}
  			
  		  });
  		  
  		  
  		  
  	  });
    </script>
</body>
</html>
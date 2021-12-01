<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <!-- ======= 풋터 ======= -->
  <footer id="footer">
    <div class="container">
      <h3>요리조리</h3>
      <div class="footer-content">
      	<a href="#"><span>회사소개</span></a> |
      	<a href="#"><span>이용약관</span></a> |
      	<a href="#"><span>개인정보취급방침</span></a> |
      	<a href="#"><span>1:1문의</span></a> |
      	<a href="#"><span>인재채용</span></a> |
      	<a href="#"><span>대량주문문의</span></a>
      </div>
      <div class="footer-companyinfo">
      	<pre>주식회사 요리하조 대표 | 이윤수     주소 | 서울특별시 영등포구 선유동2로57 이레빌딩 19F</pre>
      	<p>이메일 | info@yorijori.com</p>
      </div>
      <div class="social-links" style="text-align: right;">
        <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
        <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
        <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
        <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
        <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
      </div>
      <div class="copyright">
        &copy; Copyright <strong><span>YoriJori</span></strong>. All Rights Reserved
      </div>
      <div class="credits">
        <!-- All the links in the footer should remain intact. -->
        <!-- You can delete the links only if you purchased the pro version. -->
        <!-- Licensing information: https://bootstrapmade.com/license/ -->
        <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/green-free-one-page-bootstrap-template/ -->
        Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
      </div>
    </div>
  </footer><!-- End Footer -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
  
  <!-- Vendor JS Files -->
 <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
 <script src="resources/vendor/glightbox/js/glightbox.min.js"></script>
 <script src="resources/vendor/isotope-layout/isotope.pkgd.min.js"></script>
 <script src="resources/vendor/swiper/swiper-bundle.min.js"></script>
 <script src="resources/vendor/php-email-form/validate.js"></script>

 <!-- Template Main JS File -->
 <script src="resources/js/mainpage/main.js"></script>
<script>
$(document).ready(function(){
	var currentPosition = parseInt($(".quickmenu").css("top"));
	$(window).scroll(function() {
		var position = $(window).scrollTop();
		$(".quickmenu").stop().animate({"top":position+currentPosition+"px"},1000);
		
	});
	
	});
</script>
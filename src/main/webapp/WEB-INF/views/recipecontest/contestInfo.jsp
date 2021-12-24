<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 - 경연대회 안내</title>
<link rel="stylesheet" href="resources/css/mainpage/common.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	 <main id="main">

    <section class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2 style="color:#8E44AD;">경연대회 안내</h2>
          <ol>
            <li><a href="/">홈</a></li>
            <li>경연대회</li>
          </ol>
        </div>

      </div>
    </section>

    <section class="inner-page">
      <div class="container">
        <div class="info-wrapper row">
        	<video width="950px" height="1800px" src="resources/img/recipecontest/contest-ad-re.mp4" autoplay muted loop></video>
        </div>
      </div>
    </section>

  </main><!-- End #main -->
   <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
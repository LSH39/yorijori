<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.allmember{
text-align: center;
text-overflow: ellipsis;
}



</style>
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

<body>
	
	
    <div class="container">
    <div class="row">
    <div class="col-md-1"></div>
    <div class="col-md-10">
    
    <h2>구독 회원 조회</h2>
    
    
    
        
    

    <span>구독 회원 수</span> <span class="amount">${totalCount }</span>

    <hr>
    
    
    
    
    <table class="table table-hover allmember">
    <tr>
    
    <th>아이디</th>
    <th>이름</th>
    <th>도로명 주소</th>
    <th>상세 주소</th>
    <th>전화번호</th>
    <th>구독 종료일</th>
    
    </tr>
    <c:forEach items="${list }" var="m" varStatus="i">
    <tr>
    
    <td>${m.memberId }</td>
    <td>${m.memberName }</td>
    <td>
    ${m.addressRoad }
    </td>
    <td>${m.addressDetail }</td>
    <td>${m.memberPhone }</td>
    <td>${m.withdrawDate }</td>
    
    </tr>
    
    
    </c:forEach>
    
    </table>
    
    
    
    
    
    
    
    </div>
    <div class="col-md-1"></div>
    
    </div>
        
   
   </div>
 
 	
    
    
    <script>
    
   
    </script>
    
    
</body>
</html>
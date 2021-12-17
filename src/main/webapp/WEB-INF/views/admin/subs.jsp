<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
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

<style>
.d{

color: #8E44AD;

width:200px;
margin:0 auto;

display:none;
position:absolute;
left:300px;
top:50%;
}
button ,input[type=submit],input[type=reset]{
color: #fff;
background-color: #9F90CF;

}
</style>
</head>

<body>
	
	
    <div style="margin-top: 20px;" class="container">
    
    
    <h2>구독 회원 조회</h2>
   <button class="copy">조회 내용 복사하기</button> 
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
    <tr class="item">
    
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
    
    
    <textarea style="padding:0; margin:0; position: absolute; top:-2000px;" id="copy"></textarea>
    
    
    <div class="d">
    클립보드에 복사되었습니다</div>
    
    </div>

    <script>
   
    
    $(".copy").click(function(){
    	 var i = 0;
    	    var text = "";
    	while(true){
        	if(typeof($(".item").eq(i).children().eq(0).html())=="undefined"){
        		break;
        	}
        	
        	
        	text +="이름 : "+ $(".item").eq(i).children().eq(1).html();
        	text +="도로명 주소 : "+ $(".item").eq(i).children().eq(2).html();
        	text +="상세 주소 : "+ $(".item").eq(i).children().eq(3).html();
        	text +="전화번호 : "+ $(".item").eq(i).children().eq(4).html();
        	
        	
        	i++;	
        }
        $("#copy").val(text);
        $("#copy").select();
        document.execCommand('copy');
        $(".d").fadeIn(1000);
        $(".d").fadeOut(1000);
        
    });
    
    
    </script>
    
    
</body>
</html>
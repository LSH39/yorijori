<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>yorijori</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/admin/sidenavi.jsp" />
	<div class="container">

	 <div class="row">
	 
	 <div class="col-md-1"></div>
	 <div class="col-md-10">
	 <h2>관리자 페이지</h2>
	 <div style="background-color: #F7F7E5; height: 200px;">
        <div style="float: left;">
            <img src="#" style="width: 200px;">
        <button class="btn btn-warning">로고 변경하기</button>
        
        </div>
        <div style="float: right;">
            <h5>notice</h5>
            <table class="table table-hover">
                <tr class="table-warning">
                    <td><a href="#">제목제목제목제목제목</a></td>
                    <td><a href="#">조회수</a></td>
                    
                </tr>
                </table>
        </div>
    </div>
	 
	 </div>
	 <div class="col-md-1"></div>
	 
	 
	 </div>
    
    
    
    <div class="row">
    <div class="col-md-1"></div>
    <div class="col-md-10">
    <table class="table table-hover">
        <tr class="table-warning">
            <td><a href="#">회원관리</a></td>
            <td><a href="stat.do">일간 현황</a></td>
            <td><a href="#">순위</a></td>
            <td><a href="#">쿠폰</a></td>
        </tr>
        <tr class="table-warning">
            <td><a href="allmember.do?reqPage=1">전체회원조회</a></td>
            <td><a href="#"></a></td>
            <td><a href="#"></a></td>
            <td><a href="coupon.do">쿠폰발행</a></td>
        </tr>
        <tr class="table-warning">
            <td><a href="blackList.do?reqPage=1">블랙리스트관리</a></td>
            <td><a href="#"></a></td>
            <td><a href="#"></a></td>
            <td><a href="couponList.do?reqPage=1">쿠폰 관리</a></td>
        </tr>
        <tr class="table-warning">
            <td><a href="permissionJoin.do?reqPage=1">전문가 가입 승인</a></td>
            <td><a href="#"></a></td>
            <td><a href="#"></a></td>
            <td><a href="#"></a></td>
        </tr>
        <tr class="table-warning">
            <td><a href="permissionDelete.do?reqPage=1">탈퇴요청 승인</a></td>
            <td><a href="#"></a></td>
            <td><a href="#"></a></td>
            <td><a href="#"></a></td>
        </tr>


    </table>
    
    
    </div>
    <div class="col-md-1"></div>
     </div>
    
    
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
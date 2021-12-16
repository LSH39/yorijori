<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>yorijori</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/admin/sidenavi.jsp" />
	<style>
	a{
	color:#6D5874;
	}
	a:hover{
	color:#9A86B3;}
	</style>
	<div class="container">

	 <div class="row">
	 
	 <div class="col-md-1"></div>
	 <div class="col-md-10">
	 <h2>관리자 페이지</h2>
	 <div style="background-color: #F7F7E5; height: 200px;">
        <div style="float: left;">
            <img src="resources/img/mainpage/logo_header.png" style="width: 200px;">
      	고민중
        
        </div>
        
        <div style="float: right; width:300px; padding:15px; padding-top:0;">
            
            <table class="table table-hover" style="font-size: x-small; ">
                <tr class="table" >
                    <th style="text-align: center;">제목</th>
                    
                    
                </tr>
                <c:forEach items="${list }" var="item" >
                <tr>
                <td><a href="/noticeView.do?noticeNo=${item.noticeNo }">${item.noticeTitle }</a></td>
                </tr>
                </c:forEach>
                
                </table>
                
        </div>
        <div style="float:right; width:50px; overflow: hidden; padding:10px; text-align: center; padding-top: 50px; height: 250px; background-color: #fff; ">공 지 사 항</div>
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
            <td><a href="ranking.do">순위</a></td>
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
	<script type="text/javascript">
	
	
	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
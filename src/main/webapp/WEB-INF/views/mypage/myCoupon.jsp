<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

#line2 {
	background-color: gray;
	height: 3px;
	width: 800px;
}



/* 클릭 표시 a태그 배경색 #d6c6a5 */
.main{
margin-bottom:40px;
}
/* 메인 콘텐츠 설정 */
.main-content{
    width: 875px;
    
}
.retable {
   width: 800px;
   height: 40px;
   margin-bottom: 30px;
   text-align: center;
   border:none;
   background-color: rgb(224, 219, 239);
}
.coupons{
    width: 800px;
   height: 50px;
   background-color:rgb(224, 224, 224);

}
.cou1{
    width: 800px;
    height:50px;
    float: left;
    
}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
    <div class="main">
       <jsp:include page="/WEB-INF/views/mypage/memberNavi.jsp" />   
        <!-- 메인 콘텐츠 -->
        <div class="main-content">
            <h3 id="h_hotel">내 쿠폰함</h3>
            <div id="line2"></div><br>
            <table border="1" class="retable">
                <tr>
 
                   <td><b>쿠폰명</b></td>
                   <td><b>할인금액</b></td>
                   <td><b>사용가능기간</b></td>
                   <td><b>사용여부</b></td>
                
                </tr>
                </table>
                
                       <c:forEach items="${list}" var="mcou" varStatus="i">
                <div class="coupons">
                    <table class="cou1">
                  <tr>
                    <td>${mcou.couponName }</td>
                    <td>${mcou.couponDiscount }</td>
                    <td>${mcou.couponStart }~${mcou.couponEnd }</td>
                    <td>${mcou.couponUse }</td>

                  </tr>
                 </table>
          

                </div>
                </c:forEach>
        </div>
        
        </div>
  
        <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
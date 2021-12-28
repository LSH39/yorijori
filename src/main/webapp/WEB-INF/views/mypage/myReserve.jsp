<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
  <style>

#line2 {
	background-color: gray;
	height: 3px;
	width: 90px;
}

/* 메인 콘텐츠 설정 */
.main-content{
    width: 875px;
}
.classForm{
  width:875px;
  boder:3px solid black;
  


  }
  th,td
  {padding:4px;}
  
  .main{
  margin-bottom:40px;
  }
th{
background-color:rgb(196, 191, 227);

}
.s{
text-align:center;
}
.over{
  overflow: hidden;
   text-overflow: ellipsis;
   white-space: nowrap;
}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
    <div class="main">
    <c:choose>
		<c:when test="${sessionScope.m.memberLevel==1}">
      	   <jsp:include page="/WEB-INF/views/mypage/memberNavi.jsp" />	
        </c:when>

       	 <c:otherwise>
   	   <jsp:include page="/WEB-INF/views/mypage/sellerNavi.jsp" />	
        
       	</c:otherwise>
       </c:choose> 
        <!-- 메인 콘텐츠 -->
        <div class="main-content">
            <h3 id="h_hotel">클래스 예약내역</h3>
            <div id="line2"></div><br>
            <table border="1" class="classForm">
				<tr>
					<th class="s">예약번호</th>
					<th class="s">요리클래스</th>		
					<th class="s">수업시간</th>
					<th class="s">수업장소</th>
					<th></th>
				
				</tr>
				<c:forEach items="${list}" var="mcr" varStatus="i">
					<tr>
						<td>${mcr.rsrvNo }</td>
						<td class="over">${mcr.classTitle }</td>
						<td>${mcr.classStartTime }분~ ${mcr.classEndTime}분</td>
						
						<c:choose>
							<c:when test="${empty mcr.classLocation1}">
								<td>비대면</td>
							</c:when>
							<c:otherwise>
								<td class="over">${mcr.classLocation1}</td>
							</c:otherwise>
						</c:choose>
						
						<td>
							<c:choose>
								<c:when test="${mcr.cancelFlag eq 1 }">
									<button type="button" class="btn btn-secondary btn-sm">취소완료</button>
									<a href="/deleteCookingRsrv.do?rsrvNo=${mcr.rsrvNo }" class="btn btn-danger btn-sm">내역삭제</a>
								</c:when>
								<c:otherwise>
									<a href="/cancelCookingRsrv.do?classNo=${mcr.classNo }" class="btn btn-danger btn-sm">취소하기</a>
								</c:otherwise>
							</c:choose>
							</td>
					</tr>

				</c:forEach>
			</table>

        </div>
        
        </div>
      <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
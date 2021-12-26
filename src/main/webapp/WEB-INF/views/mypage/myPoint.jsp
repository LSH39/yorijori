<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.main{
margin-bottom:20px;

}
#line2 {
	background-color: gray;
	height: 3px;
	width: 830px;
	margin-top: 30px;
}

/* 메인 콘텐츠 설정 */
.main-content {
	width: 875px;
}

/*포인트*/
#comments {
	margin-left: 120px;
	color: gray;
}

#h_hotel {
	float: left;
}

.point {
	background-color: #f6eabf;
	width: 380px;
	height: 80px;
	text-align: center;
	line-height: 80px;
	float: left;
	border: 2px solid gray;
	margin-right: 3px;
	margin-left: 30px;
}

.use {
	background-color: #f6eabf;
	width: 380px;
	height: 80px;
	text-align: center;
	line-height: 80px;
	float: left;
	border: 2px solid gray;
}

.amountp {
	margin-top: 100px;
	width: 830px;
	border-top: 1px solid #444444;
	border-collapse: collapse;
}

th, td {
	border-bottom: 1px solid #444444;
	padding: 10px;
}

table.amountp th {
	width: 150px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	margin: 20px 10px;
}

.rowTint {
	background-color: #CDFA83;
}
.pagenation{
margin-left:370px;
margin-top:100px;
}
.pagenation ul{
align-self: center;
margin : 0 auto;
}
.pagenation a{
color: #9F90CF;
background-color :#fff; 

}
.pagenation a:hover{
color: #9F90CF;
}
.page-item.active .page-link{
  color: #fff;
  background: #9F90CF;
  border-color : #9F90CF;
}
</style>
<script type="text/javascript">
	window.onload = colorRows;
	function colorRows() {
		var myTR = document.getElementsByTagName('tr');
		for (var i = 0; i < myTR.length; i++) {
			if (i % 2) {
				myTR[i].className = 'rowTint';
			}
		}
	}
</script>
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
		     <h3 id="h_hotel">내 포인트</h3><h5 id="comments">보유하고 계신 포인트를 한 눈에 확인 하실 수 있습니다.</h5>
                <div id="line2"></div><br>
                <div class="point">현재 총 보유포인트<b>${sessionScope.m.memberPoint}원</b></div>
                <div class="use"> 사용한 포인트<b>${usePoint}원</b></div><br>
              
   
                <table  class="amountp">
                    <tr>
                    <th scope="cols">포인트번호</th>
                    <th scope="cols">날짜</th>
                    <th scope="cols">내용</th>
                    <th scope="cols">포인트</th>
                    <th scope="cols">사용여부</th>
                    
                    </tr>
                   
				<c:forEach items="${list}" var="mp" varStatus="i">
					<tr>
						<td>${mp.pointNo}</td>
						<td>${mp.pointDate }</td>
						<td>${mp.pointContent }</td>
						<c:choose>
							<c:when test="${mp.pointLevel==1}">
								<td>+${mp.pointAmount}P</td>
							</c:when>

							<c:otherwise>
								<td>-${mp.pointAmount}P</td>

							</c:otherwise>
						</c:choose>

						<td>${mp.usePoint}</td>

					</tr>
				</c:forEach>
				  
                
			</table>
              
		</div>
		<div class="pagenation">
						${pageNavi }
					</div>
	</div>
           
        
        
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
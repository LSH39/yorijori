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

/* 메인 콘텐츠 설정 */
.main-content{
    width: 875px;
}
/*후기*/
.review{
    width:800px;
    height:100px;
   
}
.re{
    width:800px;
    height:50px; 
    
}
.butt{
    text-align: right;
    margin-top: 10px;
    
}
#del,#upd{
    background-color: rgb(196, 191, 227);
    border: none;
}
#rti{
    width: 800px;
    margin-bottom: 20px;
    background-color:rgb(196, 191, 227);
    border-left: none;
}
.rrr{
    margin-bottom: 20px;
}
.noCou{
color:gray;
margin-left:350px;
margin-top:120px;

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
            <h3 id="h_hotel">쿠킹 클래스 review</h3>
            <div id="line2"></div><br>
             <div class="review">
                 <table  id="rti">
                <tr>
                    <th>후기번호</th>
                    <th>요리클래스번호</th>
                    <th>요리클래스이름</th>
                    <th>리뷰내용</th>
                    <th>리뷰평점</th>
                    <th>등록일</th>
                </tr>
            </table>
                <c:choose>
                  	<c:when test="${ not empty list }">
             <c:forEach items="${list}" var="mreview" varStatus="i">
            <div class="rrr">
              <table border="1" class="re">
                  
                  <tr>
                    <td>${mreview.reviewNo}</td>
                    <td>${mreview.classNo}</td>
                    <td>${mreview.classTitle}</td>
                    <td>${mreview.reviewContent }</td>
                    <td>${mreview.reviewRate}</td>
                    <td>${mreview.reviewDate }</td>
                </tr>
              </table>

              <div class="butt">
                <input type="button" value="수정" id="upd">
                <input type="button" value="삭제" id="del">
              </div>
              </div>
             </c:forEach>
                </c:when>
                
                  	<c:otherwise><h6 class="noCou">작성한 후기가 없어요.</h6>
                  	</c:otherwise>
                  	</c:choose>
              <div>
                

                </div>
             
             </div>
           
        </div>
        
        </div>
   
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
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
    width:900px;
    height:100px;
    text-align:center;
   
}
.re{
    width:800px;
    height:50px; 
    
}
.butt{
   margin-left:580px;
    margin-top: 20px;

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

margin-top:120px;

}
.rno,.no{
 width:100px;
}
.name{
width:200px;
overflow: hidden;
text-overflow: ellipsis;
 white-space: nowrap;

}
.con{
width:260px;
overflow: hidden;
text-overflow: ellipsis;
 white-space: nowrap;
}


.sc,.en{
width:120px;

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
                    <th class="rno">후기번호</th>
                    <th class="name">요리클래스이름</th>
                    <th class="con">리뷰내용</th>
                    <th class="sc">평점</th>
                    <th class="en">등록일</th>
                </tr>
            </table>
                <c:choose>
                  	<c:when test="${ not empty list }">
             <c:forEach items="${list}" var="mreview" varStatus="i">
            <div class="rrr">
              <table border="1" class="re">
                  
                  <tr>
                    <td class="rno">${mreview.reviewNo}</td>
                    <td class="name">${mreview.classTitle}</td>
                    <td class="con">${mreview.reviewContent }</td>
                    <c:choose>
                    <c:when test="${mreview.reviewRate==1}">
                     <td class="sc">★</td>
                     </c:when>
                      <c:when test="${mreview.reviewRate==2}">
                     <td class="sc">★★</td>
                     </c:when>
                      <c:when test="${mreview.reviewRate==3}">
                     <td class="sc">★★★</td>
                     </c:when>
                      <c:when test="${mreview.reviewRate==4}">
                     <td class="sc">★★★★</td>
                     </c:when>
                      <c:when test="${mreview.reviewRate==5}">
                     <td class="sc">★★★★★</td>
                     </c:when>
                     </c:choose>
                    <%-- <td class="sc">${mreview.reviewRate}</td>--%>
                    <td class="en">${mreview.reviewDate }</td>
                </tr>
              </table>
              
              <div class="butt">
              <a href="/cookingClsView.do?classNo=${mreview.classNo}">
                <input type="button" value="후기 보러가기" id="upd"></a>
               
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
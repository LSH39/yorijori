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
   margin-left:600px;
    margin-top: 20px;
    
}
#del,#upd{
    background-color: rgb(196, 191, 227);
    border: none;
    margin-right:40px;
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
            <h3 id="h_hotel">밀키트 review</h3>
            <div id="line2"></div><br>
             <div class="review">
                 <table  id="rti">
                <tr>
                    <th class="rno">후기번호</th>
                    <th class="name">밀키트 이름</th>
                    <th class="con">리뷰내용</th>
                    <th class="sc">리뷰평점</th>
                    <th class="en">등록일</th>
                </tr>
            </table>
             <c:choose>
                  	<c:when test="${ not empty list }">
             <c:forEach items="${list}" var="ireview" varStatus="i">
            <div class="rrr">
              <table border="1" class="re">
                  
                  <tr>
                    <td class="rno">${ireview.reviewNo}</td>
                    <td class="name">${ireview.milkitName}</td>
                    <td class="con">${ireview.reviewContent }</td>
                      <c:choose>
                    <c:when test="${ireview.reviewRate==1}">
                     <td class="sc">★</td>
                     </c:when>
                      <c:when test="${ireview.reviewRate==2}">
                     <td class="sc">★★</td>
                     </c:when>
                      <c:when test="${ireview.reviewRate==3}">
                     <td class="sc">★★★</td>
                     </c:when>
                      <c:when test="${ireview.reviewRate==4}">
                     <td class="sc">★★★★</td>
                     </c:when>
                      <c:when test="${ireview.reviewRate==5}">
                     <td class="sc">★★★★★</td>
                     </c:when>
                     </c:choose>
                   
                    <td class="en">${ireview.reviewDate }</td>
                </tr>
              </table>

              <div class="butt">
              
               <a href="/milkitView.do?productNo=${ireview.productNo}&recipeNo=${ireview.recipeNo}">
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
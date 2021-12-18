<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

#delFrm {
	width: 800px;
	height: 300px;
	margin-top:20px;
	margin-bottom: 50px;
    background-color: rgb(244, 232, 250);
	
}
#confirm {
	width: 800px;
	height: 80px;
	margin-top:30px;
	margin-bottom: 50px;
    background-color:rgb(247, 247, 229);
}
.h_left{
	width: 350px;
	height: 300px;

	float:left;
	margin-left:30px;
	margin-top:20px;
}
.h_right{
	width: 350px;
	height: 300px;

	float:left;
	margin-left:30px;
	margin-top:20px;
}
/* 메인 영역 */
.main{
    width: 1200px;
    margin: 0 auto;
    margin-top: 50px;
    overflow: hidden;
}
.main>div{
    float: left;
}
/* 메인 내부 서브 네비 */
.main-left-box{
    width: 230px;
    padding: 23px;
    box-sizing: border-box;
    background-color: rgb(224, 219, 239);
    margin-right: 60px;
}
.main-left-box>h2{
    margin: 0;
    height: 50px;
    cursor: default;
    border-bottom: 3px solid #565c54;
    margin-bottom: 25px;
}
.main-left-box ul{
    list-style-type: none;
    padding: 0;
}
.main-left-box ul>*{
    text-indent: 5px;
}
.main-left-box>ul>li>span{
    font-family: 'ns_b';
    font-size: 18px;
    cursor: default;
    display: block;
    border-bottom: 1px dotted #b9a989;
    padding-bottom: 8px;
    margin-bottom: 8px;
}
.subnavi{
    margin-bottom: 25px;
}
.subnavi a{
    display: block;
    text-decoration: none;
    font-size: 15px;
    line-height: 23px;
    margin-bottom: 2px;
    position: relative;
}
.subnavi a>span{
    position: absolute;
    right: 10px;
    font-size: 10px;
    font-family: 'ns_b';
    display: none;
}
.delete{
    width: 400px;
    height: 200px;
    margin: 0 auto;
 
}
#delbutton{
    background-color: rgb(224, 224, 224);
    width:300px;
    height: 30px;
    border: none;
    margin-left: 30px;
}
#memberId{
    width:300px;
    height: 30px;
    margin-bottom: 20px;
    margin-top: 50px;
    margin-left: 30px;
}
#memberPw{
    width:300px;
    height: 30px;
    margin-bottom: 20px;
    margin-left: 30px;
}

/* 메인 콘텐츠 설정 */
.main-content{
    width: 875px;
}


</style>
<script>
$(function() {
	$("#rePro").click(function(e) {
		e.preventDefault();
		$("#myProfile").click();
	});	
	
     $("#delBtn").click(function() {
		//alert("수정하시겠습니까?");
		$(".delFile").hide();
		$(this).next().show();
		//$("[name=status]").val(2);
});


});

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
            <h2 id="h_hotel">전문가 자격증</h2>
            <div id="line2"></div><br>
          
          <div id="delFrm">
          <form action="/deleteSeller.do" method="post">
              <div class="delete">
                    <tr>
				       <td>자격증</td>
				              	<td> 
				                
				             <input type="hidden" name="status" value="1">
				             <c:choose>
							<c:when test="${not empty m.certificatePath }">
								<img src="resources/img/mypage/file.png" width="16px" class="delFile">
								<span class="delFile">${m.certificatePath}</span>
								<button type="button" id="delBtn"
									class="btn btn-primary btn-sm delFile">수정</button>

								<input type="file" name="upfile" style="display: none;">
								<input type="hidden" name="oldFilename" value="${m.certificatePath}"
									placeholder="자격증">
							</c:when>
							<c:otherwise>
								<input type="file" name="upfile">
							</c:otherwise>
						</c:choose>
						
						</td>
				 
				    </tr>
               <input type="text" id="memberId" placeholder="아이디 입력"><br>
               <input type="password" id="memberPw" placeholder="비밀번호 입력"><br>
               <button type="submit" id="delbutton">회원탈퇴하기</button>
              </div>
        </form>
        </div>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
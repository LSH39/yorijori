<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.3.1.js"></script>
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
.mbord{

    width:800px;
    height:700px;
    background-color: rgb(224, 224, 224);
    margin: 0 auto;
    margin-bottom: 40px;
}
.profile{
    width:170px;
    height:200px;
    float:left;
    margin-left:70px;
    margin-top:50px;
}
.myInfo{
    width:450px;
    height:600px;
    background-color:rgb(234, 217, 241);
    float:left;
    margin-top:50px;
    line-height:30px;
}
.mine{
    width:400px;
    text-align: center;
    margin-left: 20px;
    border-spacing: 5px;
}
#update{
    width:150px;
    height: 40px;
    background-color: rgb(254, 250, 255);
    color: rgb(126, 30, 166);
    text-align: center;
    font-weight: 600;
    margin-left: 150px;
    margin-top: 20px;
    border: none;
    border-radius: 20px;
    
}
#rePro{
   background-color:rgb(126, 30, 166);
   color:whitesmoke;
   margin-left: 40px;
   border:none;
   margin-top:10px;
}
#pp{
    width:130px;
    height:150px;
    border-radius: 100px;
    margin-left: 30px;
  
}
</style>
<script>
function loadImg(obj) {
	  var files = obj.files;
	  console.log(files);
	  if(files.length != 0){
		  var reader = new FileReader();
		  reader.readAsDataURL(files[0]);
		  reader.onload = function(e) {
			$("#pp").attr("src",e.target.result);
			$("#pp").css("height","150px");
			$("#myProfile").css("display","none");
			
		}
	  }
	}
		$(function() {
			$("#rePro").click(function(e) {
				e.preventDefault();
				$("#myProfile").click();
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
         
        <div class="mbord">
            <form action="/updateMember.do" method="post" enctype="multipart/form-data" name="updateFrm">
          <div class="profile">
          
          <img id="pp" src="resources/upload/profile/${m.profilePath }" width="130px">
          <input type="file" id="myProfile" name="myProfile" onchange="loadImg(this);"
			accept=".jpg,.jpeg,.png,.gif" style="display: none;" id="myProfile">
              <button value="프로필바꾸기" id="rePro">프로필바꾸기</button>
             
          </div>
           
          <div class="myInfo">
        
        			<table class="mine" border="1">
							<tr>
								<td>회원소개</td>
								<td><input type="text" name="memberConsent" id="memberConsent"
									onfocus="this.placeholder=''" value="${m.memberConsent }"></td>
							</tr>
							<tr>
								<td>회원아이디</td>
								<td><input type="text" name="memberId" id="memberId"
									onfocus="this.placeholder=''" value="${m.memberId }"></td>
							</tr>
							<tr>
								<td>회원이름</td>
								<td><input type="text" name="memberName" id="memberName"
									onfocus="this.placeholder=''" value="${m.memberName }"></td>
							</tr>
							<tr>
								<td>회원이메일</td>
								<td><input type="text" name="memberEmail" id="memberEmail"
									onfocus="this.placeholder=''" value="${m.memberEmail }"></td>
							</tr>
							<tr>
								<td>회원닉네임</td>
								<td><input type="text" name="memberNickname" id="memberNickname"
									onfocus="this.placeholder=''" value="${m.memberNickname }"></td>
							</tr>
							<tr>
								<td>휴대폰번호</td>
								<td><input type="text" name="memberPhone" id="memberPhone"
									onfocus="this.placeholder=''"value="${m.memberPhone }"></td>
							</tr>
							<tr>
								<td>생년월일</td>
								<td><input type="text" name="memberBirth" id="memberBirth"
									onfocus="this.placeholder=''" value="${m.memberBirth }"></td>
							</tr>
				                
				               <tr>
								<td>우편번호</td>
								<td><input type="text" name="postcode" id="postcode"
									onfocus="this.placeholder=''" value="${m.postcode }"></td>
							</tr>
							<tr>
								<td>도로명주소</td>
								<td><input type="text" name="addressRoad" id="addressRoad"
									onfocus="this.placeholder=''" value="${m.addressRoad }"></td>
							</tr>
							<tr>
								<td>상세주소</td>
								<td><input type="text" name="addressDetail" id="addressDetail"
									onfocus="this.placeholder=''" value="${m.addressDetail }"></td>
							</tr>
							<tr>
								<td>회원등급</td>
								<td><input type="text" name="memberLevel" id="memberLevel"
									onfocus="this.placeholder=''" value="${m.memberLevel }" readonly></td>
							</tr>
							<tr>
								<td>포인트내역</td>
								<td><input type="text" name="memberPoint" id="memberPoint"
									onfocus="this.placeholder=''" value="${m.memberPoint }" readonly></td>
							</tr>
							<tr>
								<td>가입일</td>
								<td><input type="text" name="enrollDate" id="enrollDate"
									onfocus="this.placeholder=''" value="${m.enrollDate }" readonly></td>
							</tr>

              </table>
              <div class="buttonBox">
              <input type="submit" value="수정하기" id="update">
              </div>
            
            
  
         
      </div>
      </form>
          </div>
          

        </div>
        
        </div>
	

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
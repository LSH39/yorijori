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
    display: none;
}


/* 클릭 표시 a태그 배경색 #d6c6a5 */

/* 메인 콘텐츠 설정 */
.main-content{
    width: 875px;
}
.mbord{

    width:800px;
    height:600px;
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
    height:500px;
    background-color:rgb(234, 217, 241);
    float:left;
    margin-top:50px;
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
$("#delBtn").click(function() {
	$(".delFile").hide();
	$(this).next().show();
	
});

</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
    <div class="main">
      		<div class="main-left-box">
			<h2>마이페이지</h2>
			<ul>
				<li>
					<ul class="subnavi">
						<li><a href="#">내정보 조회 및 수정<span>&gt;</span></a></li>
						<li><a href="#" id="lf-click">내 구매내역<span>&gt;</span></a></li>
						<li><a href="#">쿠폰함<span>&gt;</span></a></li>
						<li><a href="#">회원탈퇴<span>&gt;</span></a></li>
						<li><a href="#">참여한 경연대회<span>&gt;</span></a></li>
						<li><a href="#">요리클래스 예약내역<span>&gt;</span></a></li>
						<li><a href="#">Dm내역<span>&gt;</span></a></li>
						<li><a href="#">follwer 게시글<span>&gt;</span></a></li>
						<li><a href="#">찜한 레시피<span>&gt;</span></a></li>
					</ul>
				</li>
				<li><span>my write</span>
					<ul class="subnavi">
						<li><a href="#">작성후기<span>&gt;</span></a></li>
						<li><a href="#" id="lf-click">작성 게시글<span>&gt;</span></a></li>
						<li><a href="#">내 작성 레시피<span>&gt;</span></a></li>

					</ul></li>
			</ul>
		</div>
        <!-- 메인 콘텐츠 -->
        <div class="main-content">
        <div class="mbord">
          <div class="profile">
          <img id="pp" src="resources/img/mypage/profile.jpeg">
              <input type="button" value="프로필바꾸기" id="rePro">
          </div>
          <div class="myInfo">
                  <form action="/updateSeller.do" method="post" name="updateSellerFrm" enctype="multipart/form-data">
        			<table class="mine" border="1">
							<tr>
								<td>회원소개</td>
								<td><input type="text" name="memberConsent" id="memberConsent"
									onfocus="this.placeholder=''" value="${m.memberConsent }"></td>
							</tr>
							<tr>
								<td>회원아이디</td>
								<td><input type="text" name="memberId" id="memberId"
									onfocus="this.placeholder=''" value="${m.memberId }" readonly></td>
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
				                   <td>자격증</td>
				               <td>
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
            </form>
  
         
      </div>
   
          </div>

        </div>
        
        </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
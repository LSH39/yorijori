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
	height: 1px;
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


#line2 {
	background-color: gray;
	height: 3px;
	width: 800px;
}


/* 메인 콘텐츠 설정 */
.main-content{
    width: 1200px;
    margin-bottom: 30px;
}

.win{
    width: 250px;
    height:430px;
    background-color:rgb(240, 240, 191);
    float: left;
    margin-left: 30px;
    margin-right: 10px;
    margin-top: 20px;
    
}
#recipeI{
    width: 250px;
    height:200px;
}
#wintt{
    text-align: center;
    font-weight: 800;
    font-size: 25px;;
}
#win{
    width: 60px;
    height:60px;
     float:left;
}
#winners{
 line-height: 30px;
 overflow: hidden;
   height:100px;
 }
 .ww{
 float:left;
 color:red;
 margin-left:100px;
  margin-top:20px;
 }

/*역대우승작*/
.contest-banner{
  text-align: center;
	height: 400px;
	background-image: url("/resources/img/mypage/2.jpeg");
	position: relative;
	border-bottom: 10px solid red;
	
}
.contest-banner-content>h2{
	font-family: "Noto Sans KR", serif;
	font-weight: bolder;
	color:white;
}
.contest-banner-content>h2>span{
	color: #BD0000;
}
.contest-banner-content>h5{
	font-family: "TmoneyRoundWindRegular";
	font-size: 18px;
}
.contest-banner-content>h5, .contest-banner-content>h5>span{
	color: #FFF;
}

.contest-info{
	position: absolute;
	left: 75%;
	top: 100px;
}
.contest-banner-content{
	text-align: center;
	position: absolute;
	top: 120px;
	right: 42%;
}
.btn-announce{
  background-color:green;
  border:none;
  border-radius:40px;
  width:220px;
  height:40px;
  color:white;
 font-family: "TmoneyRoundWindRegular";
  

}
.winnerName{
height:60px;
width:240px;
overflow:hidden;
}
#wina{
    width: 60px;
    height:60px;
     float:left;
     border-radius:30px;
     margin-left:20px;
}
</style>



</head>
<body>
 <jsp:include page="/WEB-INF/views/common/header.jsp" />
 <script src="resources/summernote/jquery-3.3.1.js"></script>
 <div class="contest-banner">
 	<div class="contest-banner-content">
	      		<h2 style="color: #FFF;"><span class="thisyr" style="color:rgb(255, 84, 67);"></span>년 <span class="thismonth" style="color:rgb(255, 84, 67);"></span>월</h2>
	      		<h2 style="color: #FFF;">이번달 우승작은 과연 무엇일까요?</h2><br>
	      		<h5 style="color:#FFF;">1등 우승작은 밀키트로 제작되어 판매합니다.</h5>
	      	</div>
 	<div class="contest-info">
	      		<a href="/contestResult.do">
	      			<button class="btn-announce">>>>이번달 우승작 보러가기</button>
	      		</a>
	      	</div>

 </div>


    <div class="main">

        <!-- 메인 콘텐츠 -->
        <div class="main-content">
            <h3 id="wintt">WINNER LIST</h3>
    
       
               <c:forEach items="${list}" var="ct" varStatus="i">
              <div class="win">
                 <img id="win" src="resources/img/mypage/win.jpeg"><h5 class="ww">총 ${ct.voteCount}표</h5>
                <a href="#"> 
                    <img id="recipeI" src="resources/upload/recipe/${ct.filePath}">
                </a>
                <div id="winners">
                   <span class="it_info1"><b id="it1">경연날짜 :</b>&emsp;${ct.contestMonth }</span><br>
                   <span class="it_info1"><b id="it1">레시피이름 :</b>&emsp;${ct.recipeTitle}</span><br>
                </div>
                <div class="winnerName">
                <a href="/profile.do?memberId=${ct.memberId }">
                  <span ><img id="wina" src="resources/upload/member_profile/${ct.profilePath} ">&emsp;<b>(우승)${ct.memberNickName }</b></span>&emsp;
              </a>
              </div>
              </div>
              </c:forEach>
        </div>
        
        </div>
        
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
      <script>
  	$(function(){
  		var today = new Date();
  		var year = today.getFullYear();
  		var month = today.getMonth()+1;		
  		$(".thisyr").html(year);
  		$(".thismonth").html(month);

  		
  		});
  		

  </script>
</body>
</html>
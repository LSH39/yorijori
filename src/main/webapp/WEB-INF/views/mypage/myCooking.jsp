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
	width: 850px;
	margin-bottom:40px;
}

/* 메인 콘텐츠 설정 */
.main-content{
    width: 875px;
}

.page-item.active .page-link {
   	background-color: #9F90CF !important;
   	border-color: #9F90CF !important;
    color: #fff !important;
    }
.page-link {
    color: #9F90CF !important;
    }
    	
.main-grid{
    display: grid;
    grid-template-columns: repeat(3, 15.1vw);
    /*grid-template-rows: 19vw;*/
    grid-auto-rows: 15.1vw;
    gap: 2%;
    height: auto;

}
.main-grid div > img{
    width: 100%;
    height: 100%;
    cursor: pointer;

}

.main-grid div{
	overflow: hidden;
}

.grid-list{
	display: flex;
	overflow: hidden;
    list-style: none;
	align-content: stretch;
    justify-content: flex-start;
    padding: 0px;
    flex-wrap: wrap;
}


.grid-list > li{
	position: relative;
    min-height: 1px;
    padding-right: 12px;
    padding-left: 12px;
    margin-bottom: 32px;
    box-sizing: border-box;
    width: 50%;

}


@media (min-width: 1024px) {
	.grid-list > li{
		width: 33.3333%;
    } 
}



@media (max-width: 1023px) {
	.grid-list > li{
	    margin-bottom: 24px;
    	padding-right: 8px;
    	padding-left: 8px;
    } 
}

.class-img{
	display:block;
	text-decoration: none;
}

.img-container{
    position: relative;
    width: 100%;
}

.class-img-span{
	overflow: hidden;
	border-radius: 10px;
	margin-bottom: 8px;
	
}

.class-img-span > span{
    display: block;
    position: relative;
    border-radius: 3px;
    padding-top: 75%;
    overflow: hidden;
    z-index: -1;
    
}

.image-source{
    top: 0px;
    left: 0px;
    width: 100%;
    height: 100%;
    position: absolute;
        box-sizing: border-box;

}

.class-img-span:hover>span{
	overflow: hidden;
	transform: scale(1.1);
	transition: transform 0.3s ease 0s, opacity 0.1s linear 0s	;
}


.class-nickname{
	display: flex;
    width: 100%;
    -webkit-box-align: stretch;
    align-items: stretch;
    flex-direction: row;
}

.class-nickname > p {
	font-weight: bold;
    font-size: 0.6875rem;
    line-height: 0.875rem;
    color: black;
}

.class-title{
    font-size: 14px;
    font-weight: normal;
    line-height: 20px;
    letter-spacing: -0.15px;
    color: rgb(26, 26, 26);
    height: 40px;
    overflow: hidden;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    margin: 4px 0px 8px;
}

.class-line{
	flex: 0 0 auto;
    background-color: rgb(250, 250, 250);
    width: 100%;
    height: 1px;
    margin-top: 8px;
    margin-bottom: 8px;
}

.class-price{
	display: flex;
    flex-flow: row wrap;
    -webkit-box-align: center;
    align-items: center;
}

.class-price > div{
	display: flex;
    -webkit-box-align: center;
    align-items: center;
    flex-direction: row;
}

.class-price > div > p{
	font-weight: 700;
    font-size: 0.8125rem;
    line-height: 1.125rem;
    color: rgb(26, 26, 26);
}

.class-start{
    min-width: 20px;
    height: 20px;
    border-radius: 3px;
    padding-left: 6px;
    padding-right: 6px;
    background-color: rgb(248, 248, 248);
    flex: 0 0 auto;
    display: inline-flex;
    -webkit-box-pack: center;
    justify-content: center;
    -webkit-box-align: center;
    align-items: center;
    box-sizing: border-box;
}

.class-start > div{
	font-size: 9px;
    line-height: 12px;
    letter-spacing: normal;
    margin: 0px;
    color: rgb(0, 0, 0);
    font-weight: 600;
    display: inline-flex;
    -webkit-box-pack: center;
    justify-content: center;
    -webkit-box-align: center;
    align-items: center;
}

.vertified{
	background: url('./resources/img/member/sample.png');
   	background-repeat: no-repeat;
    width: 19px;
    height: 19px;
    text-indent: -9999px;
    display: inline-block;
   	background-position: 0 -368px;
   	margin-left: 5px;
   	}

#pageNavi{

	justify-content: center;
	margin-left:400px;
	margin-top:100px;
	
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
			<h3 id="h_hotel">내 쿠킹클래스</h3>
			<div id="line2"></div>
			<div>
			<ul class="grid-list">
	  <c:choose>
                  	<c:when test="${ not empty list }">
			<c:forEach items="${list }" var="ccls">
				<li>
					<div>
						<a href="/cookingClsView.do?classNo=${ccls.classNo}" class="class-img">
							<div class="img-container">
								<div class="class-img-span">
									<span>
										<c:choose>
											<c:when test="${empty ccls.classThumbnailFilepath && empty ccls.classThumbnailFilename }">
												<img src="./resources/img/cookingcls/classtest.jpg" class="image-source">
												</c:when>
										<c:otherwise>
										<img src="./resources/upload/cookingcls/${ccls.classThumbnailFilepath }" class="image-source">
									</c:otherwise>
									</c:choose>	
									

									</span>
								</div>
								<div>
									<div class="class-nickname">
										<p>${ccls.memberNickname }<span class="vertified"></span></p>
									</div>
									<div class="class-title">${ccls.classTitle }</div>
								</div>
								<div class="class-line"></div>
								<div class="class-price">
									<div>
										<p>${ccls.classPrice }원</p>
									</div>
								</div>
								<div class="class-start">
									<div>${ccls.classStart } 부터 시작</div>
								</div>
							</div>
							</a>
						
					</div>
				</li>
			</c:forEach>
			       </c:when>
                
                  	<c:otherwise><h6 class="noCou">작성 클래스가 없습니다.</h6>
                  	</c:otherwise>
                  	</c:choose>
			</ul>
		</div>
		</div>
		     <div id="pageNavi">
						${pageNavi }
					</div>
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
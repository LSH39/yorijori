<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<title>내 프로필</title>
<script>

	//팔로우 했을때
	$(function(){
		$(".follow").click(function(){
			let myMemberNo = $("#myMemberNo").val();
			let memberNo = $("#memberNo").val();
			
			$.ajax({
				url : "/profileFollow.do",
				type : "post",
				data : {myMemberNo:myMemberNo, memberNo:memberNo},
				success : function(data){
					if(data == -1){
						alert("올바른 접근이 아닙니다!");						
					}else{
						$(".follow").css("display", "none");						
						$(".unfollow").css("display", "block");						
						//$(".profile-info").load(location.href+" .profile-info");
						$(".follower-cnt").load(location.href+" .follower-cnt");
						$(".follow-cnt").load(location.href+" .follow-cnt");
					}
				}
			});
		});
			
		//언팔로우 했을때
		$(".unfollow").click(function(){
			
			let myMemberNo = $("#myMemberNo").val();
			let memberNo = $("#memberNo").val();
			
			$.ajax({
				url : "/profileUnfollow.do",
				type : "post",
				data : {myMemberNo:myMemberNo, memberNo:memberNo},
				success : function(data){     
					if(data == -1){
						alert("올바른 접근이 아닙니다!");
					}else{
						$(".unfollow").css("display", "none");						
						$(".follow").css("display", "block");		
						$(".follower-cnt").load(location.href+" .follower-cnt");
						$(".follow-cnt").load(location.href+" .follow-cnt");
						//$(".profile-container").load(location.href+" .profile-container");
						
					}
				}
			});
		});
		
		//스크롤 내리면 나머지 추가 로딩
		const rbCnt = $("#rbCnt").val();
		if(rbCnt > 15){
		$(document).scroll(function(){
			let memberNo = $("#memberNo").val();
			let memberId = $("#memberId").val();
			let start = $(".pfMore").val();
			let maxHeight = $(document).height();
			let currentScroll = $(window).scrollTop() + $(window).height();
		    if (maxHeight <= currentScroll + 200) {
				$.ajax({
					url : "/morePhoto.do",
					data : {start : start, memberId : memberId, memberNo : memberNo},
					type : "post",
					success : function(data){
							
						for(let i=0 ; i<data.length ; i++){
							let a = "";
							a+="<li><div>";
							a+="<a href='/recipeView.do?recipeNo="+data[i].recipeNo+"'>";
							a+="<div class='img-container'>";
							if(data[i].recipeVideo != undefined){
								a+="<div class='videolink-container'>";
								a+="<div class='videolink-icon'>";
								a+="<svg color='#000000' fill='#000000' height='18' role='img' viewBox='0 0 24 24' width='18'>";
								a+="<path d='M5.888 22.5a3.46 3.46 0 01-1.721-.46l-.003-.002a3.451 3.451 0 01-1.72-2.982V4.943a3.445 3.445 0 015.163-2.987l12.226 7.059a3.444 3.444 0 01-.001 5.967l-12.22 7.056a3.462 3.462 0 01-1.724.462z'></path></svg></div></div>";
							}
							a+="<div class='class-img-span'><span>";
							a+="<img src='./resources/upload/recipe/"+data[i].filepath+"' class='image-source'>";
							a+="</span></div>";
							a+="<div class='second'><span class='profile-like'></span>";
							a+="<span class='like-count'>"+data[i].likeCnt+"</span>";
							a+="<span class='profile-view'></span>";
							a+="<span class='view-count'>"+data[i].readCount+"</span></div></a></div></li>";

			            	$(".grid-list").append(a);
						}

							// currCnt="9" totCnt=${rbCnt } value="10">
						$(".pfMore").val(Number(start)+9);
						//지금까지 읽어온 게시물의 수를 변경(읽어온 배열의 길이만큼 기존값에 더함)
						let curr = Number($(".pfMore").attr("currCnt")); //currentCount 숫자료 변환
						$(".pfMore").attr("currCnt", curr+data.length); // curr+5가 안되는 이유는 25개가 아닌 23 24 이렇게 끝나ㅡㄴ 경우도 있으니 데이터 길이로 하는게 적당하다 
						//전체 게시물 수
						let totalCount = $(".pfMore").attr("totCnt");
						//변경된 지금 까지 읽어온 게시물의 수
						let currCount = $(".pfMore").attr("currCnt");
						//지금까지 읽어온 게시물과 전체 게시물 수가 같으면 더보기 버튼이 활성화
						if(currCount == totalCount || currCount > totalCount){
							$(".pfMore").prop("disabled", true);
						}
					}
				});
				
				
		    }

		});
			
		}
	});

</script>
<style>


/*
nav{
    min-width: 1024px;
    max-width: 1400px;
    position: fixed;
    width: 100%;
    z-index: 1;
    border-bottom: solid #dbdbdb 1px;
    background: #fff;
}
*/
.nav-cont{
    width: 80%;
    margin: auto;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 10px 50px;
}
.cont-input{
    height: 28px;
    border: solid 1px #dbdbdb;
    display: flex;
    align-items: center;
    background: #fafafa;
    padding: 5px;
}
.cont-input input{
    border: 0;
    outline: none;
    background: #fafafa;
}

.profile-header{
    width: 60%;
    margin: 0 auto;
    transform: translateY(50px);
    padding: 20px 0;
}

.profile-wrap{
	margin-bottom: 120px;
}

.profile-container{
    display: flex;
}
.profile-container img{
    height: 150px;
    width: 150px;
    border-radius: 50%;
    cursor: pointer;
}
.profile-info-wrap{
    margin-left: 100px;
}
.profile-info-header{
    width: 530px;
    display: flex;
    align-items: center;
    margin-bottom: 15px;
    /*justify-content: space-between;*/
}
.profile-info-header h1{
    color: #616161;
    font-weight: 100;
    font-size: 26px;
    margin-bottom: 0;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
}
.profile-info-header button{
    width: 90px;
    height: 30px;
    /* background-color: #fafafa; */
    background-color: #0095f6;
    border: solid #dbdbdb 1px;
    cursor: pointer;
    border-radius: 3px;
    font-weight: 600;
    color: #fff;
    margin-left:20px;
}
.profile-info-header svg{
    cursor: pointer;
}
.profile-info{
    display: flex;

    font-size: 15px;
    margin-bottom: 15px;
}

.profile-info p{
	margin-right: 40px;
}

.profile-intro h2,
.profile-intro .p-ciencia,
.profile-intro .p-creador,
.profile-intro .p-dev,
.profile-intro .p-suscribe{
    font-size: 16px;
    margin-bottom: 5px;
}

.profile-intro .p-ciencia{
    color: #a2a2a2;
}
.profile-intro .p-link{
    text-align: none;
    color: #1e4e7c;
}

.profile-nothing{
	margin-top:60px;
	display:flex;
	flex-direction: column;
	align-items: center;
}

.profile-cameradiv{
    display:flex;
	width:62px;
	height:62px;
	border-radius:50%;
	border: 2px solid black;
	justify-content: center;
    align-items: center;
}

.profile-cameradiv>span{
	width:24px;
	height:24px;
	background:url('./resources/img/member/sample2.png');
	background-repeat: no-repeat;
	background-position: -473px -401px;
	text-indent:-9999px;
}

.feed-nothing{
	margin-top:30px;
	font-size:28px;
}

.line{
    width: 100%;
    height: 1px;
    margin: auto;
    background-color: #dbdbdb;
}
.main-nav{
    display: flex;
    justify-content: space-between;
    align-items: center;
    width: 50%;
    margin: auto;
    padding: 15px;
}
.main-nav a{
    color: #333;
    text-decoration: none;
    font-size: 13px;
}
main{
    width: 70%;
    margin: 0 auto 30px;
    margin-top: 60px;
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

.profile-info-header>span{
    /* background: url('./imgs/vertifi.png'); */
    background: url('./resources/img/member/sample.png');
    background-repeat: no-repeat;
    width: 18px;
    height: 18px;
    text-indent: -9999px;
    display: inline-block;
    margin-left: 8px;
    background-position: 0 -369px;
}

.first{
	position: relative;
}

.second{
	position:absolute;
	top:0;
	bottom:0;
	left:0;
	right:0;
	text-align:center;
	vertical-align: middle;
	text-indent: -9999px;
	color: white;
	font-size: 1.3vw;
	
	}

.second:hover{
	background: rgba(0, 0, 0, 0.3);
	text-indent:0px;
	display: flex;
    align-content: center;
    flex-direction: row;
    flex-wrap: wrap;
    justify-content: center;
    align-items: center;
}

.unfollow{
	background-color:#fafafa;
	color:#0095f6;

}


.profile-view{
	width: 19px;
	height: 19px;
	background: url('./resources/img/member/sample.png');
	background-repeat: no-repeat;
	background-position: -382px -333px;
	margin-right: 7px;
}

.profile-like{
	width: 19px;
	height: 19px;
	background: url('./resources/img/member/sample.png');
	background-repeat: no-repeat;
	background-position: -340px -333px;
	margin-right: 7px;
}

.like-count{
	margin-right:15px;
}

/*새로고친*/
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

	margin-bottom: 8px;
	
}

.class-img-span > span{
    display: block;
    position: relative;

    padding-top: 100%;
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

.videolink-container{
    position: absolute;
    pointer-events: none;
	display: flex;
    -webkit-box-pack: start;
    -webkit-justify-content: flex-start;
    -ms-flex-pack: start;
    justify-content: flex-start;
    right: 0;
    top: 0;
}

.videolink-icon{
	margin-top: 8px;
    margin-right: 8px;
    margin-left: 8px;
    margin-bottom: 8px;
}

</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<!-- 프로필 -->
	<div class="container">
		<div class="profile-wrap">
			<div class="profile-header">
		        <div class="profile-container">
		        <input type="hidden" id="myMemberNo" value="${sessionScope.m.memberNo }">
		        <input type="hidden" id="memberNo" value="${member.memberNo }">
		        <input type="hidden" id="memberId" value="${member.memberId }">
		        <input type="hidden" id="rbCnt" value="${rbCnt }">
		        <input type="hidden" class="pfMore" currCnt="15" totCnt=${rbCnt } value="16">

		            <c:choose>
		            	<c:when test="${not empty member.profilePath }">
				            <img class="img-profile" src="./resources/upload/member_profile/${member.profilePath }" alt="사용자 프로필">
		            	</c:when>
		            	<c:otherwise>
				            <img class="img-profile" src="./resources/upload/member_profile/profile_basic.png" alt="기본프로필">
		            	</c:otherwise>
		            </c:choose>
		            <div class="profile-info-wrap">
		                <div class="profile-info-header">
		                    <h1>${member.memberNickname}</h1>
		                    <c:if test="${member.memberLevel eq 2 }">
		                    <span>인증됨</span>
		                    </c:if>
		                    <!-- <button>프로필 수정</button> -->
		                    <c:choose>
		                    	<c:when test="${empty sessionScope.m.memberNo }">
				                    <button style="background-color:#8E44AD;">팔로우</button>
		                    	</c:when>
		                    	<c:when test="${member.memberNo ne sessionScope.m.memberNo}">
		                    		<c:choose>
		                    			<c:when test="${empty fl }">
						                    <button class="follow" style="background-color:#8E44AD;">팔로우</button>
						                    <button class="unfollow" style="display:none;background-color:#ADADAD;">언팔로우</button>
		                    			</c:when>
		                    			<c:when test="${not empty fl }">
						                    <button class="unfollow" style="background-color:#ADADAD;">언팔로우</button>
						                    <button class="follow" style="display:none;background-color:#8E44AD;">팔로우</button>
		                    			</c:when>
		                    		</c:choose>
		                    	</c:when>
		                    	<c:when test="${member.memberNo eq sessionScope.m.memberNo}">
		                    	</c:when>
		                    </c:choose>
		
		                    <!-- <svg aria-label="Opciones" class="_8-yf5 " fill="#262626" height="24" viewBox="0 0 48 48" width="24"><path clip-rule="evenodd" d="M46.7 20.6l-2.1-1.1c-.4-.2-.7-.5-.8-1-.5-1.6-1.1-3.2-1.9-4.7-.2-.4-.3-.8-.1-1.2l.8-2.3c.2-.5 0-1.1-.4-1.5l-2.9-2.9c-.4-.4-1-.5-1.5-.4l-2.3.8c-.4.1-.8.1-1.2-.1-1.4-.8-3-1.5-4.6-1.9-.4-.1-.8-.4-1-.8l-1.1-2.2c-.3-.5-.8-.8-1.3-.8h-4.1c-.6 0-1.1.3-1.3.8l-1.1 2.2c-.2.4-.5.7-1 .8-1.6.5-3.2 1.1-4.6 1.9-.4.2-.8.3-1.2.1l-2.3-.8c-.5-.2-1.1 0-1.5.4L5.9 8.8c-.4.4-.5 1-.4 1.5l.8 2.3c.1.4.1.8-.1 1.2-.8 1.5-1.5 3-1.9 4.7-.1.4-.4.8-.8 1l-2.1 1.1c-.5.3-.8.8-.8 1.3V26c0 .6.3 1.1.8 1.3l2.1 1.1c.4.2.7.5.8 1 .5 1.6 1.1 3.2 1.9 4.7.2.4.3.8.1 1.2l-.8 2.3c-.2.5 0 1.1.4 1.5L8.8 42c.4.4 1 .5 1.5.4l2.3-.8c.4-.1.8-.1 1.2.1 1.4.8 3 1.5 4.6 1.9.4.1.8.4 1 .8l1.1 2.2c.3.5.8.8 1.3.8h4.1c.6 0 1.1-.3 1.3-.8l1.1-2.2c.2-.4.5-.7 1-.8 1.6-.5 3.2-1.1 4.6-1.9.4-.2.8-.3 1.2-.1l2.3.8c.5.2 1.1 0 1.5-.4l2.9-2.9c.4-.4.5-1 .4-1.5l-.8-2.3c-.1-.4-.1-.8.1-1.2.8-1.5 1.5-3 1.9-4.7.1-.4.4-.8.8-1l2.1-1.1c.5-.3.8-.8.8-1.3v-4.1c.4-.5.1-1.1-.4-1.3zM24 41.5c-9.7 0-17.5-7.8-17.5-17.5S14.3 6.5 24 6.5 41.5 14.3 41.5 24 33.7 41.5 24 41.5z" fill-rule="evenodd"></path></svg> -->
		                </div>
		                <div class="profile-info">
		                    <p><b>${rbCnt }</b> 게시물(레시피)</p>
		                    <p><b class="follower-cnt">${follower}</b> 팔로워</p>
		                    <p><b class="follow-cnt">${follow }</b> 팔로우</p>
		                </div>    
		                <div class="profile-intro">
		                	<c:choose>
		                		<c:when test="${empty member.profileIntro }">
		        		            <h2>안녕하세요.</h2>
		                		</c:when>
		                		<c:otherwise>
				                    <h2>${member.profileIntro }</h2>
		                		</c:otherwise>
		                	</c:choose>
		                </div>
		            </div>
		        </div>
		    </div>
    	<!-- 메인피드 -->
        <main>
		<div class="line"></div>        
		<div class="main-nav"></div>
        <c:choose>
        	<c:when test="${fn:length(list) eq 0}">
        		<div>
        			<div class="profile-nothing">
        				<div class="profile-cameradiv">
        					<span>카메라</span>
        				</div>
        				<div class="feed-nothing">게시물 없음</div>
        			</div>
        		</div>
        	</c:when>
        	<c:otherwise>
        	<div>
        		<ul class="grid-list">
        		<c:forEach items="${list }" var="rb">
        			<li>
        				<div>
        				<c:choose>
        					<c:when test="${empty sessionScope.m }">
        					<a href="/recipeView.do?recipeNo=${rb.recipeNo }&memberNo=0">
        					</c:when>
        					<c:otherwise>
        					<a href="/recipeView.do?recipeNo=${rb.recipeNo }&memberNo=${sessionScope.m.memberNo}">
        					</c:otherwise>
        				</c:choose>
        						<div class="img-container">
        								<c:if test="${not empty rb.recipeVideo }">
			        						<div class="videolink-container">
	    		    							<div class="videolink-icon">
	        										<svg color=#000000 fill="#000000" height="18" role="img" viewBox="0 0 24 24" width="18">
	        											<path d="M5.888 22.5a3.46 3.46 0 01-1.721-.46l-.003-.002a3.451 3.451 0 01-1.72-2.982V4.943a3.445 3.445 0 015.163-2.987l12.226 7.059a3.444 3.444 0 01-.001 5.967l-12.22 7.056a3.462 3.462 0 01-1.724.462z">
			        									</path>
	    		    								</svg>
	        									</div>
	        								</div>
        								</c:if>
        							<div class="class-img-span">
        							<span>
        								<c:choose>
        									<c:when test="${not empty rb.filepath }">
												<img src="./resources/upload/recipe/${rb.filepath }" class="image-source">
        									</c:when>
        									<c:otherwise>
												<img src="./resources/img/recipe/person.png" class="image-source">        									
        									</c:otherwise>
        								</c:choose>										
									</span>
									</div>
									<div class="second">
		        	    			<span class="profile-like"></span>
		            				<span class="like-count">${rb.likeCnt }</span>
		            				<span class="profile-view"></span>
		            				<span class="view-count">${rb.readCount }</span>
			            		</div>
        					</a>
        				</div>
        			</li>
        		</c:forEach>
        		</ul>
        	</div>
        	</c:otherwise>
        </c:choose>
    	</main>
    	<!-- 메인피드끝 -->
    	</div>
    </div>
    <script>
    
    </script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
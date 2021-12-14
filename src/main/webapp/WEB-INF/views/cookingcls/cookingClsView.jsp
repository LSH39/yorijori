<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<!-- 별칭 ccls -->
<meta charset="UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=qg5b1hs250&submodules=geocoder"></script>
<!-- 
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3034a6bde601c666de71198a328eaa3e&libraries=services"></script>
 -->

<title>쿠킹클래스 뷰</title>
<style>
	td{
		vertical-align:middle;
	}

	.left{
		width: 66.6666%;
		position:static;
		padding-right: 12px;
		padding-left: 12px;
		box-sizing: border-box;
	}
	
	.right{
		width:33.3333%;
		position: static;
		padding-right: 12px;
		padding-left: 12px;
		box-sizing: border-box;
	}
	
	.right-stick{
		display: inline-block;
		position: sticky;
		position: -webkit-sticky;
		top:100px;
		padding-right: 4px;
		padding-left: 4px;
		overflow: auto;
	}
	
	.right-stick-content{
		padding: 24px;
    	border-radius: 3px;
    	box-shadow: rgb(41 42 43 / 16%) 0px 2px 6px -2px;
    	border: 1px solid rgb(255, 255, 255);
	}
	
	.class-wrap{
		display:flex;
	}
	
	#payBtn{
		background-color:#8E44AD;
		border-color:#8E44AD;
	}
	
	#payBtn:focus{
		box-shadow: 0 0 0 0.25rem rgb(224 216 239 / 25%);
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
	
</style>
<script>
	$(function(){
		//리뷰 작성 버튼
		$("#reviewWrite").click(function(){
			let classNo = $("#classNo").val();
			let memberNickname = $("#memberNickname").val();
			let reviewContent = $("#reviewContent").val();
			let reviewRate = $("#reviewRate").val();
			
			console.log(classNo);
			console.log(memberNickname);
			console.log(reviewContent);
			console.log(reviewRate);
			
			if(reviewContent == ''){
				alert("공백은 안돼요");
				return;
			}
			
			$.ajax({
				url:"/insertReview.do",
				type : "post",
				data : {classNo:classNo, memberNickname:memberNickname, reviewContent:reviewContent, reviewRate:reviewRate},
				success : function(data){
					console.log(data);
					if(data==1){
						console.log("성공!(테스트용)");
					}else if(data==0){
						console.log("실패!(테스트용)");						
					}
				//location.reload();
				$(".table").load(location.href+" .table");
				
				},
				complete : function(){
					$("#reviewContent").val("");
				}
			});
		});
		
		$(document).on("click", ".reviewDelete", function(){
			//let reviewNoParam = $(this).attr("href");
			let reviewNo = $(this).children(".deleteLinkVal").val();

			$.ajax({
				url : "/deleteReview.do",
				type : "post",
				data : {reviewNo:reviewNo},
				success : function(data){
					$(".table").load(location.href+" .table");
				}
			});
			
		});
		
		$("#noPayBtn").click(function(){
			alert("자신의 클래스는 예약이 안됩니다!");
		});
		
		//강의 결제
		$("#payBtn").click(function(){
			let date = new Date();
			let classPrice = $(".classPrice").html(); //실제 가격
			let classTitle = $("#classTitle").html();
			let memberNickname = $("#clsMemberNickname").val();
			let memberNo = $("#memberNo").val();
			let classNo = $("#classNo").val();
			let classNop = $("#classNop").html();
			let impUid = date.getFullYear()+""+("0"+(date.getMonth()+1)).slice(-2)+""+("0"+date.getDate()).slice(-2)+""+("0"+date.getHours()).slice(-2)+""+("0"+date.getMinutes()).slice(-2)+""+("0"+date.getSeconds()).slice(-2);
			
			IMP.init("imp42282461"); //요리조리 가맹점
			IMP.request_pay({ //결제할 떄 필요한 정보(객체)
				merchant_uid : "상품명_"+date, //거래 아이디
				name : classTitle, //결제 이름 설정함
				amount : 100, //결제 금액 테스트용이니까 100원
				buyer_email : "forestwowch@gmail.com", //구매자 이메일
				buyer_name : "성승민",
				buyer_phone : "010-5104-4638", //구매자 핸드폰 번호
				buyer_addr : "인천광역시", //구매자 주소
				buyer_postcode : "99999" //구매자 우편번호
			},function(rsp){
				if(rsp.success){
					alert("결제 성공성공");
					//성공시 로직(db결제정보 insert -> 사용자 화면 처리)
					console.log("카드 승인 번호 "+rsp.apply_num);
				}else{
					console.log(impUid);
					//실패시 로직(장바구니에 저장 -> 사용자 화면 처리)
					$.ajax({
						url : "/insertCookingRsrv.do",
						type : "post",
						data : {memberNickname : memberNickname, memberNo : memberNo, classNo : classNo, impUid : impUid, classNop : classNop},
						success : function(data){
							console.log(data);
							if(data==1){
								alert("예약 성공");
								location.reload();
							}else if(data==0){
								alert("인원수 초과");
								location.href="/";
							}
						}
					});
				}
			});
		});

		
		var classLocation1 = $("#classLocation1").html();
		var mapOptions = {
			    center: new naver.maps.LatLng(37.3595704, 127.105399),
			    zoom: 15
			};
		var map = new naver.maps.Map('map', mapOptions);
		
		naver.maps.Service.geocode({ address: classLocation1 }, function(status, response) { 
			if (status === naver.maps.Service.Status.ERROR) { 
				console.log('Something wrong!'); 
				} 
			var new_position = new naver.maps.LatLng(response.v2.addresses[0].y, response.v2.addresses[0].x) 
			map.setCenter(new_position); 
			
			var marker = new naver.maps.Marker({ 
				position: new naver.maps.LatLng(response.v2.addresses[0].y, response.v2.addresses[0].x), 
				map: map 
			}); 
		});

		
	});
</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="container">
		<div>
		<h1>쿠킹클래스 뷰</h1>
			<div class="class-wrap">
				<div class="left position-static">
					<div class="class-content">
					<h5>내용은 ${ccls.classContent }</h5>
					<!-- 
					<img src="./resources/img/cookingcls/classtest.jpg">
					<h5>클래스 번호는 ${ccls.classNo }</h5>
					<h5>클래스 등록한 사람의 닉네임은 ${ccls.memberNickname }</h5>			
					<h5>내용은 ${ccls.classContent }</h5>
					<h5>시작일은 ${ccls.classStart }</h5>
					<h5>종료일은 ${ccls.classEnd }</h5>
					<h5>평점은 ${ccls.classRate }</h5>
					<h5>총인원수는 ${ccls.classNop }</h5>
					<h5>현재인원수는 ${ccls.classCurrNop }</h5>
					<h5>상태는 ${ccls.classStatus }</h5>
					<h5>등록일은 ${ccls.classRegDate }</h5>
					<hr>
					<p>Lorem ipsum dolor sit amet, consecteti</p>
					<hr>
					<img src="./resources/img/cookingcls/classtest.jpg">
					 -->
				
					<c:forEach items="${ccls.clsFileList }" var="f">
					<h1>파일 이름 : ${f.classFilepath }</h1>
						<img src="./resources/upload/cookingcls/${f.classFilepath }">
					</c:forEach>
					</div>
					<h3>리뷰 부분</h3>
						<h5>클래스의 평점은 ${reviewAvg }</h5>
					<div class="reviewSection">
						<c:choose>
							<c:when test="${not empty list }">
								<table class="table">
								<tr>
									<th>번호</th>
									<th>내용</th>
									<th>아이디</th>
									<th>평점</th>
									<th></th>
								</tr>
								<c:forEach items="${list }" var="review" varStatus="i">
								<tr>
									<td>${i.count }</td>
									<td>${review.reviewContent }</td>
									<td>${review.memberNickname }</td>
									<td>${review.reviewRate }</td>
									<td>									
										<c:if test="${sessionScope.m.memberNickname eq review.memberNickname }">											
											<!-- 
											<a class="btn-close deleteReview" href="/reviewDelete.do?reviewNo=${review.reviewNo }" style="text-indent:-9999px; display:inline-flex; width:1em; height:24px; padding:0px;">X</a>
											 -->
											<a class="btn-close reviewDelete" style="text-indent:-9999px; display:inline-flex; width:1em; height:24px; padding:0px;">X<input type="hidden" class="deleteLinkVal" value="${review.reviewNo }"></a>
										</c:if>
									</td>
								</tr>
								</c:forEach>
							</table>
							</c:when>
							<c:otherwise>
								<table class="table">
									<tr>
										<th style="text-align:center;">등록된 리뷰가 없어요!</th>
									</tr>
								</table>
							</c:otherwise>
						</c:choose>
						
						<table>
							<tr>
								<td colspan="2">
									<input type="hidden" name="classNo" value="${ccls.classNo }" id="classNo">
									<input type="hidden" name="memberNickname" value="${sessionScope.m.memberNickname }" id="memberNickname">
									<input type="hidden" name="memberNo" value="${sessionScope.m.memberNo }" id="memberNo">
									<input type="hidden" name="clsMemberNickname" value="${ccls.memberNickname }" id="clsMemberNickname">
									
									<c:choose>
										<c:when test="${ empty sessionScope.m }">
											<input type="text" id="needToLogin" class="form-control" readonly value="로그인해주세요!">
										</c:when>
										<c:otherwise>
											<input type="text" name="reviewContent" id="reviewContent" class="form-control">
										</c:otherwise>
									</c:choose>
								</td>							
								<td>
									<select class="form-select form-select-md" name="reviewRate" id="reviewRate">
										<option value="1">★☆☆☆☆</option>
										<option value="2">★★☆☆☆</option>
										<option value="3">★★★☆☆</option>
										<option value="4">★★★★☆</option>
										<option value="5">★★★★★</option>
									</select>
								</td>							
								<td>
									<div class="d-grid gap-2">
										<c:choose>
											<c:when test="${empty sessionScope.m }">
												<button type="button" class="btn btn-danger btn-md">작성</button>
											</c:when>
											<c:otherwise>
												<button type="button" id="reviewWrite" class="btn btn-danger btn-md">작성</button>											
											</c:otherwise>
										</c:choose>
									</div>
								</td>							
							</tr>
							
						</table>
					</div>

				</div>
				<div class="right">
					<div class="right-stick">
						<div class="right-stick-content">
							<h5>제목 : <span id="classTitle">${ccls.classTitle }</span></h5>
							<h5>클래스 강사 : ${ccls.memberNickname }<span class="vertified">정품</span></h5>
							<h5>가격 : <span class="classPrice">${ccls.classPrice }</span>원</h5>
							<h5>강의시간 : 
							<c:choose>
							<c:when test="${ccls.classStartTime.substring(0, 2) lt 12 }">
							오전&nbsp;${ccls.classStartTime }
							</c:when>
							<c:when test="${ccls.classStartTime.substring(0, 2) gt 11 }">
							오후
								<c:choose>
									<c:when test="${ccls.classStartTime.substring(0, 2)-12 lt 10}">
									0${ccls.classStartTime.substring(0, 2)-12}${ccls.classStartTime.substring(2, 5) }
									</c:when>
									<c:otherwise>
									${ccls.classStartTime.substring(0, 2)-12}${ccls.classStartTime.substring(2, 5) }
									</c:otherwise>
								</c:choose>
							</c:when>
							</c:choose>~
							<c:choose>
							<c:when test="${ccls.classEndTime.substring(0, 2) lt 12 }">
							오전&nbsp;${ccls.classEndTime }
							</c:when>
							<c:when test="${ccls.classEndTime.substring(0, 2) gt 11 }">
							오후
								<c:choose>
									<c:when test="${ccls.classEndTime.substring(0, 2)-12 lt 10}">
									0${ccls.classEndTime.substring(0, 2)-12}${ccls.classEndTime.substring(2, 5) }
									</c:when>
									<c:otherwise>
									${ccls.classEndTime.substring(0, 2)-12}${ccls.classEndTime.substring(2, 5) }
									</c:otherwise>
								</c:choose>
							</c:when>
							</c:choose>
							</h5>
							<h5>정원 : <span id="classNop">${ccls.classCurrNop }</span>&nbsp;/&nbsp;<span>${ccls.classNop }</span></h5>
							<c:choose>
								<c:when test="${not empty ccls.classLocation1 }">
									<h5>장소 : <span id="classLocation1">${ccls.classLocation1}</span></h5>
									<h5> ${ccls.classLocation2}</h5>
								</c:when>
								<c:otherwise>
									<h5>장소 : 비대면 클래스입니다!</h5>
								</c:otherwise>
							</c:choose>
							<div class="d-grid gap-2 mt-4">
								<c:if test="${not empty ccls.classLocation1 && not empty ccls.classLocation2}">
									<button type="button" class="btn btn-danger btn-lg" data-bs-toggle="modal" data-bs-target="#exampleModal">장소보기</button>
								</c:if>
							</div>
							<div class="d-grid gap-2 mt-4">
								<c:choose>
									<c:when test="${ccls.classCurrNop eq ccls.classNop }">
										<button type="button" class="btn btn-secondary btn-lg" >마감!</button>
									</c:when>
									<c:when test="${sessionScope.m.memberNickname eq ccls.memberNickname}">
										<button type="button" id="noPayBtn" class="btn btn-danger btn-lg" >수강하기</button>
									</c:when>
									<c:when test="${empty sessionScope.m  }">									
										<a href="/loginFrm.do" class="btn btn-warning btn-lg" >로그인 하세요!</a>
									</c:when>
									<c:otherwise>
										<button type="button" id="payBtn" class="btn btn-primary btn-lg" >수강하기</button>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="d-grid gap-2 mt-4">
								<a href="/dmView.do?classNo=${ccls.classNo }" class="btn btn-primary btn-lg" >문의하기</a>
							</div>
							<div class="d-grid gap-2 mt-4">
								<a href="/dmList.do" class="btn btn-primary btn-lg" >문의 목록(테스트)</a>
							</div>
							<c:if test="${sessionScope.m.memberNickname eq ccls.memberNickname }">
								<div class="mt-4 d-grid gap-8 d-md-flex justify-content-md-between">
									<a href="/cookingClsUpdateFrm.do?classNo=${ccls.classNo }" id="" class="btn btn-secondary btn-lg" >수정하기</a>
									<a href="/cookingClsDelete.do?classNo=${ccls.classNo }" class="btn btn-danger btn-lg" >삭제하기</a>							
								</div>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
    			<div class="modal-content">
      				<div class="modal-header">
        				<h5 class="modal-title" id="exampleModalLabel">클래스 장소</h5>
        				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      				</div>
      				<div class="modal-body" style="display:flex;justify-content: center;">
      					<div id="map" style="width:450px;height:450px;"></div>
      				</div>
      				<div class="modal-footer">
        				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
      				</div>
    			</div>
  			</div>
		</div>
	</div>
	<script>
	
	</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
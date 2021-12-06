<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.row div:nth-child(2) {
	border-left: 10px solid #9A86B3;
}
.row div:nth-child(2),.row div:nth-child(3),.row:first-of-type div:nth-child(4){
	border-bottom: 2px solid #9A86B3;
}
.row {
	margin : 30px;
}
.row:nth-of-type(5) div:nth-child(3) {
	border: none;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/admin/sidenavi.jsp" />
	<div class="container">
	
	<h2>혜택 등록</h2>
	<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-2">혜택 이름</div>
	<div class="col-md-5"> <input id="couponName" style="width:100%;" type="text" ></div>
	<div class="col-md-1"><span id="couponNameChk">0</span> <span>/30</span></div>
	<div class="col-md-2"></div>
	</div>
	
	<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-2">타겟팅 대상</div>
	<div class="col-md-6">
	<input checked type="radio" name="who" id="allMember"><label for="allMember">모든 회원</label> 
	<input type="radio" name="who" id="yori"><label for="yori"> 요리꾼</label> 
	<input type="radio" name="who" id="jori"><label for="jori">조리꾼</label> 
	<input type="radio" name="who" id="firstBuy"><label for="firstBuy">첫 구매 회원</label> 
	<input type="radio" name="who" id="exBuy"><label for="exBuy">기존 구매 회원</label>
	
	</div>
	<div class="col-md-2"></div>
	</div>
	
	
	<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-2">혜택 종류</div>
	<div class="col-md-6">
	<input checked id="couponType" type="radio" name="type"> <label for="couponType">쿠폰</label> 
	<input id="pointType" type="radio" name="type"> <label for="pointType">포인트 적립</label>
	
	</div>
	<div class="col-md-2"></div>
	
	
	</div>
	
	
	<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-2">
	발급방법
	</div>
	<div class="col-md-6">
	<input checked type="radio" name="method" id="download"> <label for="download">다운로드</label>
	<input type="radio" name="method" id="wallet"> <label for="wallet">지급</label>
	
	</div>
	<div class="col-md-2"></div>
	</div>
	
	<div class="row">
	
	<div class="col-md-2"></div>
	<div class="col-md-2">발급 개수</div>
	<div class="col-md-6">
	<input checked type="radio" name="limit" id="limit"> <label for="limit">제한 있음</label>
	<input type="radio" name="limit" id="unlimit"> <label for="unlimit">제한 없음</label>
	
	</div>
	<div class="col-md-2"></div>
	<div class="col-md-2"></div>
	<div class="col-md-2"></div>
	
	<div style="border-left: 2px solid #9A86B3; border-bottom:2px solid #9A86B3;" class="col-md-6 ea"><br>
	<input style="width:20%; text-align: right;" type="text">개
	</div>	
	</div>
	
	
	
	<div class="row">
	
	<div class="col-md-2"></div>
	<div class="col-md-2">할인 설정</div>
	<div class="col-md-6">
	<input style="width: 20%;"type="text">
	<select>
	<option value="%">%
	<option value="">₩
	</select>
	
	</div>
	<div class="col-md-2"></div>
	
	</div>
	
	</div>
	<script>
	var allChk;
	$("#couponName").keyup(function(){
		
		var length = $(this).val().length;
		var chk = 	$("#couponNameChk");
		chk.html(length);
		if(length>30){
			chk.css("color","red");
			allChk = false;
		}else{
			chk.css("color","purple");
			allChk = true;
		}
		
	});
	
	
	$("#limit").click(function(){
		$(".ea").slideDown();
		$(this).parent().css("border-bottom","none");
	});
	$("#unlimit").click(function(){
		$(".ea").slideUp();
		setTimeout(() => {
			$(this).parent().css("border-bottom","2px solid #9A86B3");
		}, 390);
		
		
		
	});
	
	
	
	
	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
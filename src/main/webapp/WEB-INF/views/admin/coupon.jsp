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
.row:last-of-type div {
	border:none;
	margin:10px auto;
	
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/admin/sidenavi.jsp" />
	<div class="container">
	
	<h2>혜택 등록</h2>
	<form action="createCoupon.do" method="post">
	<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-2">혜택 이름</div>
	<div class="col-md-5"> <input name="couponName" id="couponName" maxlength="30" style="width:100%;" type="text" ></div>
	<div class="col-md-1"><span id="couponNameChk">0</span> <span>/30</span></div>
	<div class="col-md-2"></div>
	</div>
	
	<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-2">타겟팅 대상</div>
	<div class="col-md-6">
	<input checked type="radio" name="who" id="allMember" value="0"><label for="allMember">모든 회원</label> 
	<input type="radio" name="who" id="yori" value="1"><label for="yori"> 요리꾼</label> 
	<input type="radio" name="who" id="jori" value="2"><label for="jori">조리꾼</label> 
	<input type="radio" name="who" id="firstBuy" value="3"><label for="firstBuy">첫 구매 회원</label> 
	<input type="radio" name="who" id="exBuy" value="4"><label for="exBuy">기존 구매 회원</label>
	
	</div>
	<div class="col-md-2"></div>
	</div>
	
	
	<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-2">혜택 종류</div>
	<div class="col-md-6">
	<input checked id="couponType" type="radio" name="type" value="1"> <label for="couponType">쿠폰</label> 
	<input id="pointType" type="radio" name="type" value="2"> <label for="pointType">포인트 적립</label>
	
	</div>
	<div class="col-md-2"></div>
	
	
	</div>
	
	
	<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-2">
	발급방법
	</div>
	<div class="col-md-6">
	<input checked type="radio" name="method" id="download" value="1"> <label for="download">다운로드</label>
	<input type="radio" name="method" id="drop" value="2"> <label for="drop">지급</label>
	
	</div>
	<div class="col-md-2"></div>
	</div>
	
	<div class="row">
	
	<div class="col-md-2"></div>
	<div class="col-md-2">발급 개수</div>
	<div class="col-md-6">
	<input checked type="radio" name="limit" id="limit" value="1"> <label for="limit">제한 있음</label>
	<input type="radio" name="limit" id="unlimit" value="2"> <label for="unlimit">제한 없음</label>
	
	</div>
	<div class="col-md-2"></div>
	<div class="col-md-2"></div>
	<div class="col-md-2"></div>
	
	<div style="border-left: 2px solid #9A86B3; border-bottom:2px solid #9A86B3;" class="col-md-6 ea"><br>
	<input name="amount" style="width:20%; text-align: right;" type="text" placeholder="0">개
	</div>	
	</div>
	
	
	
	<div class="row">
	
	<div class="col-md-2"></div>
	<div class="col-md-2">할인 설정</div>
	<div class="col-md-6">
	<input id="dc"  style="width: 20%; text-align: right;"type="text" placeholder="0">
	<select id="rate">
	<option value="%">%
	<option value="">₩
	</select>
	<span id="ppp" style="display:none;">p</span>
	<input name="dcResult" type="hidden" id="dcResult"> 
	</div>
	<div class="col-md-2"></div>
	
	</div>
	
	<div class="row">
	
	<div class="col-md-2"></div>
	<div class="col-md-2">유효 기간</div>
	<div class="col-md-6">
	<span id="today"></span> ~
	
	<input name="limitDate" id="limitDate" type="date">
	
	
	
	</div>
	<div class="col-md-2"></div>
	
	</div>
	
	<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-3"> </div>
	<div class="col-md-2">
	<input type="submit" value="확인">
	<input type="reset" value="취소">
	</div>
	<div class="col-md-3"></div>
	<div class="col-md-2"></div>
	</div>
	</form>
	</div>
	<script>
	var allChk;
	var date = new Date();
	var day = date.getDate();
	if(day<10){
		day = "0"+day;
	}
	var month = date.getMonth()+1;
	var year = date.getFullYear();
	
	var today = year+"."+month+"."+day+".";
	
	var today1 = year+"-"+month+"-"+day;
	$("#limitDate").prop("min",today1);
	$("#today").html(today);
	
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
		if($("#drop").is(":checked")){
			
		}else{
			$(".ea").slideDown();
			$(this).parent().css("border-bottom","none");
		}
		
	});
	$("#unlimit").click(function(){
		$(".ea").slideUp();
		
			setTimeout(() => {
				$(this).parent().css("border-bottom","2px solid #9A86B3");
			}, 400);
		
		
		
		
		
	});
	
	$("#pointType").click(function(){
		$("#unlimit").click();
		$("#rate").hide();
		$("#ppp").show();
	
	
	});
	$("#limit").click(function(){
		$("#couponType").click();
		if($("#drop").is(":checked")){
			$("#unlimit").click();
		}
		
	});
	
	$("#couponType").click(function(){
		$("#ppp").hide();
		$("#rate").show();
	});
	
	$("#dc").change(function(){
		var dc = $(this).val();
		var rate = $("#rate").val();
		if($("#couponType").is(":checked")){
			if(rate=="%"){
				$("#dcResult").val(dc+"%");
			}else{
				$("#dcResult").val(dc);
			}
			
		}else{
			$("#dcResult").val(dc+"p");
		}
		
		
	});
	var tmp;
	$("#dc").keyup(function(){
		var dc = $("#dc").val();
		var regExp = /^[1-9]\d*$/;
		if(regExp.test(dc)){
			tmp = dc;
		}else{
			$(this).val(tmp);	
		}
	});
	var tmp2;
	$("input[name=amount]").keyup(function(){
		var amount = $(this).val();
		var regExp = /^[1-9]\d*$/;
		if(regExp.test(amount)){
			tmp2 = amount;
		}else{
			$(this).val(tmp2);	
		}
	});
	
	
	$("#drop").click(function(){
		$("#unlimit").click();
	});
	$("input[type=submit]").click(function(){
		if($("#couponNameChk").html()>0 &&$("#dc").val() !=null && $("#limitDate").val()!= ""){
			
		}else{
			return false;
		}
	});
	
	
	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
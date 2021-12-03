<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 
<script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=3034a6bde601c666de71198a328eaa3e"></script>
 -->

<meta charset="UTF-8">
<title>쿠킹클래스 작성</title>
<style>
</style>
    <script>
        $(function(){
            $("#addrSearch").click(function(){
                new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
                    // 예제를 참고하여 다양한 활용법을 확인해 보세요.
                    if (data.userSelectedType === 'R') {
                        $("#classLocation").val(data.roadAddress);
                    } else {
                        $("#classLocation").val(data.jibunAddress);
                    }
                    $("#classLocation2").focus();
                }
                }).open();
            });

            $("#btntest").click(function(){
                let testRes1 = $("#time1").val();
                let testRes2 = $("#time2").val();
                console.log(typeof(testRes1));
                if(testRes1 =='' || testRes2 == ''){
                    alert("공백");
                    return;
                }
                $("#timeHidden").val(testRes1+"부터"+testRes2);
                console.log(testRes1+"부터"+testRes2);
            });

            $("#time1").change(function(){
                let time1 = $("#time1").val();
                let time2 = $("#time2").val();
                if(time1 >= time2){
                    $(".result").eq(1).html("시간을 올바르게 입력해주세요.");
                    $(".result").eq(1).css("color", "red");
                }else{
                    $(".result").eq(1).html("올바르게 입력됐습니다.");
                    $(".result").eq(1).css("color", "blue");                	
                }
            });

            $("#time2").change(function(){
                let time1 = $("#time1").val();
                let time2 = $("#time2").val();
                if(time1 >= time2){
                    $(".result").eq(1).html("시간을 올바르게 입력해주세요.");
                    $(".result").eq(1).css("color", "red");
                }else{
                    $(".result").eq(1).html("올바르게 입력됐습니다.");
                    $(".result").eq(1).css("color", "blue");                    	
                }
            });

            $("#chkHidden").click(function(){
                let testChk = $("#timeHidden").val();
                console.log("체크 : "+testChk);
            });
            
            $("#classPrice").keyup(function(){
            	let price = $(this).val();
            	
            	let pricesub = price.substring(0,1);
            	console.log(pricesub);
            	
            	if(price.substring(0, 1) != 0 && price % 10 == 0){
            		$(".result").eq(0).html("올바르게 입력됐습니다.");
            		$(".result").eq(0).css("color", "blue");            		
            	}else{            		
            		$(".result").eq(0).html("가격을 올바르게 입력해주세요");
            		$(".result").eq(0).css("color", "red");
            	}
            });
            
            $("#classStart").change(function(){
            	let classStart = $(this).val();
            	let classEnd = $("#classEnd").val();
            	
            	var date = new Date();
            	var today = date.getFullYear()+"-"+("0"+(date.getMonth()+1)).slice(-2)+"-"+("0"+date.getDate()).slice(-2);
            	
            	if(classStart <= today){
            		console.log("날짜 오류");
            		$(this).val("");
            	}else if(classStart == "" || classEnd == ""){            		
            		console.log("둘 중 하나가 공백");
            	}else if(classStart >= classEnd){
            		console.log("시작일이 더 큼");
            	}else{
            		console.log("올바르게 입력됨");
            	} 
            	
            });
            
            $("#classEnd").change(function(){
            	let classEnd = $(this).val();
            	let classStart = $("#classStart").val();
            	
            	var date = new Date();
            	var today = date.getFullYear()+"-"+("0"+(date.getMonth()+1)).slice(-2)+"-"+("0"+date.getDate()).slice(-2);
            	
            	if(classEnd <= today){
            		console.log("날짜 오류");
            		$(this).val("");
            	}else if(classStart == "" || classEnd == ""){            		
            		console.log("둘 중 하나가 공백");
            	}else if(classStart >= classEnd){
            		console.log("시작일이 더 큼");
            	}else{
            		console.log("올바르게 입력됨");
            	}
            });
            
            /*
            $("#classStart").datepicker({
            	mindate:0
            });
            
            $("#classEnd").datepicker({
            	mindate:0
            });
            */
            
        });

    </script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="container">
		<div>
			<h1>요리 클래스 등록</h1>
		</div>
		<div>
			<form action="" method="get">
				<h5>강의 제목</h5>
				<input type="text" name="classTitle" id="classTitle" maxlength="33" class="input-group input-group-sm"><br>
				<h5>강의 내용</h5>
				<textarea name="classContent" id="" cols="30" rows="10"></textarea>
				<br>
				<h5>강의 장소(입력 안할시 비대면)</h5>
				<input type="text" name="classLocation" id="classLocation">
				<button type="button" id="addrSearch" class="btn btn-primary">주소검색</button>
				<br> <input type="text" name="" id="classLocation2"><br>
				<h5>강의 가격</h5>
				<input type="text" name="classPrice" id="classPrice" maxlength="10">원<br>
				<span class="result">　</span>
				<h5>강의 시간 23글자임 시간10bytes + 4글자12bytes</h5>
				<h5>오전09:00~오후10:00</h5>
				<h5>강의시간</h5>
				<input type="time" id="time1">부터<input type="time"id="time2"> <input type="hidden" name="classTime" id="timeHidden">
				<button type="button" id="btntest" class="btn-primary btn-sm">시간테스트</button>
				<br>
				<span class="result">　</span><br>
				<h5>클래스 시작일</h5>
				<input type="date" name="classStart" id="classStart"><br><br>
				<h5>클래스 종료일</h5>
				<input type="date" name="classEnd" id="classEnd"><br><br>
				
				<input
					type="submit" value="등록" class="btn btn-danger">
				<button type="button" id="chkHidden" class="btn btn-primary">히든값 확인 버튼</button>
			</form>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
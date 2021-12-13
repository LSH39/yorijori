<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/summernote/summernote-lite.css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- 
<script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=3034a6bde601c666de71198a328eaa3e"></script>
 -->
<!--  -->


<!--  -->
<meta charset="UTF-8">
<title>쿠킹클래스 수정</title>
<style>
</style>

</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<script src="resources/summernote/jquery-3.3.1.js"></script>
	<script src="resources/summernote/summernote-lite.js"></script>
	<script src="resources/summernote/lang/summernote-ko-KR.js"></script>
	<div class="container">
		<div>
			<h1>요리 클래스 등록</h1>
		</div>
		<div>
			<form action="/cookingClsUpdate.do" method="post" enctype="multipart/form-data">
				<!-- 전문가 닉네임 히든값 -->
				<input type="hidden" name="classNo" value="${ccls.classNo }">
				<h5>강의 제목</h5>
				<input type="text" name="classTitle" class="form-control" id="classTitle" maxlength="33" class="input-group input-group-sm" value="${ccls.classTitle }"><br>
				<h5>강의 내용</h5>
				<textarea name="classContent" class="form-control" id="classContent" cols="30" rows="10" >${ccls.classContent }</textarea>
				<br>
				글자수 : <span id="currByte">0</span>/3000bytes)
				<h5>강의 장소(입력 안할시 비대면)</h5>
				<input type="text" name="classLocation1" id="classLocation1" value="${ccls.classLocation1 }" maxlength="100">
				<button type="button" id="addrSearch" class="btn btn-primary">주소검색</button>
				<br> <input type="text" name="classLocation2" id="classLocation2" value="${ccls.classLocation2 }" maxlength="100"><br>
				<h5>강의 가격</h5>
				<input type="text" name="classPrice" id="classPrice" value="${ccls.classPrice }" maxlength="10">원<br>
				<span class="result">　</span>
				<h5>강의 정원</h5>
				<input type="text" name="classNop" id="classNop" value="${ccls.classNop }" maxlength="10">명<br>
				<h5>강의시간</h5>
				<input type="time" name="classStartTime" value="${ccls.classStartTime }" id="time1">부터<input type="time" name="classEndTime" value="${ccls.classEndTime }" id="time2">
				<button type="button" id="btntest" class="btn-primary btn-sm">시간테스트</button>
				<br>
				<span class="result">　</span><br>
				<h5>클래스 시작일</h5>
				<input type="date" name="classStart" value="${ccls.classStart }" id="classStart"><br><br>
				<h5>클래스 종료일</h5>
				<input type="date" name="classEnd" value="${ccls.classEnd }" id="classEnd"><br><br>
				<input
					type="submit" value="수정" class="btn btn-danger">
				<button type="button" id="chkHidden" class="btn btn-primary">히든값 확인 버튼</button>
			</form>
		</div>
	</div>
	<script>
		$(function(){
			
			
    		let classContent = $("#classContent").val();
        	let classContentLen = classContent.length;
			let currByte = 0;

        	console.log(classContent);
			console.log(classContentLen);
			
            for(let i=0; i<classContentLen; i++){
                let charEach = classContent.charAt(i);
                let charUni = escape(charEach) //유니코드 형식으로 변환 u1234 이런식
                if(charUni.length>4){
                    // 한글 : oracle 11xe는 한글이 3Byte
                    currByte += 3;
                }else{
                    // 영문,숫자,특수문자 : 1Byte
                    currByte += 1;
                }
            }
            $("#currByte").html(currByte);
			
			
            $("#addrSearch").click(function(){
                new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
                    // 예제를 참고하여 다양한 활용법을 확인해 보세요.
                    if (data.userSelectedType === 'R') {
                        $("#classLocation1").val(data.roadAddress);
                    } else {
                        $("#classLocation1").val(data.jibunAddress);
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
			
			
            $("#classContent").summernote({
				height : 400,
				lang : "ko-KR",
				callbacks : {
					onImageUpload : function(files){
						//uploadImage(files[0],this);
						
						for(let i = files.length-1 ; i>=0 ; i--){
							uploadImage(files[i], this);
						}
						
					},
					onChange : function(e){
						setTimeout(function(){
		        	    	let maxByte = 3000; //varchar2 3000이니까 3000
        		    		let classContent = $("#classContent").val();
			            	let classContentLen = classContent.length;
            				let currByte = 0;
            	
			            	console.log(classContent);
            				console.log(classContentLen);
            				
                            for(let i=0; i<classContentLen; i++){
                                let charEach = classContent.charAt(i);
                                let charUni = escape(charEach) //유니코드 형식으로 변환 u1234 이런식
                                if(charUni.length>4){
                                    // 한글 : oracle 11xe는 한글이 3Byte
                                    currByte += 3;
                                }else{
                                    // 영문,숫자,특수문자 : 1Byte
                                    currByte += 1;
                                }
                            }
                            
                            if(currByte > maxByte){
                            	$("#currByte").html(currByte);
                            	$("#currByte").css("color", "red");
                            }else{
                            	$("#currByte").html(currByte);
                            	$("#currByte").css("color", "blue");                            	
                            }
							
						}, 200);
					}
				}
            });
            
            function uploadImage(file, el) {
    			data = new FormData();
    			data.append("file", file);
    			$.ajax({
    				data : data,
    				type : "POST",
    				url : "/uploadClsImg.do",
    				contentType : false,
    				enctype : 'multipart/form-data',
    				processData : false,
    				success : function(data) {
    					$(el).summernote('editor.insertImage', data.url);
    				}
    			});
    		}
            
		});
	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
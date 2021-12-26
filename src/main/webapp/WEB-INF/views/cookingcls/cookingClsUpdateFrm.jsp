<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/summernote/summernote-lite.css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<meta charset="UTF-8">
<title>쿠킹클래스 수정</title>
<link rel="stylesheet" href="resources/css/cookingcls/clsWrite.css">
</head>
<body>
	<c:choose>
		<c:when test="${ccls.memberNickname ne sessionScope.m.memberNickname || empty sessionScope.m}">
			<script>
				alert("올바른 접근이 아닙니다!");
				location.href = "/";
			</script>
		</c:when>
		<c:otherwise>
			<jsp:include page="/WEB-INF/views/common/header.jsp" />
			<script src="resources/summernote/jquery-3.3.1.js"></script>
			<script src="resources/summernote/summernote-lite.js"></script>
			<script src="resources/summernote/lang/summernote-ko-KR.js"></script>
			<div class="container">
				<div>
					<h1>요리 클래스 수정</h1>
				</div>
				<div>
					<form action="/cookingClsUpdate.do" method="post" enctype="multipart/form-data">
						<input type="hidden" name="classNo" value="${ccls.classNo }">
						<input type="hidden" name="memberNickname" value="${sessionScope.m.memberNickname }">
						<div class="form-group row mb-4">
							<div class="col-sm-12">
								<label for="classTitle"><h5>클래스 제목</h5></label>
								<input type="text" name="classTitle" class="form-control" id="classTitle" maxlength="300" class="input-group input-group-sm" value="${ccls.classTitle }">
								제목 글자수 테스트용 최종 제출시 이거 지워야함 :<span id="titleByte">0</span>/300bytes
							</div>
						</div>
						<div class="form-group row mb-4">
							<div class="col-sm-6">
								<h5>썸네일 이미지</h5>
								<c:choose>
									<c:when test="${not empty ccls.classThumbnailFilepath }">
										<span class="fileDelete">${ccls.classThumbnailFilepath }</span><button type="button" class="fileDelete btn clsfrm-btn">삭제</button>
										<input type="file" name="thumbFile" class="form-control classThumbnail" style="display:none;" accept=".jpg, .jpeg, .gif, .png">						
										<input type="hidden" name="preFilepath" value="${ccls.classThumbnailFilepath }">
										<input type="hidden" name="preFilename" value="${ccls.classThumbnailFilename }">
										<input type="hidden" name="delFlag" class="prevFileDel" value=0>
									</c:when>
									<c:otherwise>
										<input type="file" name="thumbFile" class="form-control classThumbnail" accept=".gif, .jpg, .jpeg, .png">						
										<input type="hidden" name="delFlag" class="prevFileDel" value=0>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
						<div class="form-group row mb-4">
							<div class="col-sm-12">
								<h5>클래스 내용</h5>
								<textarea name="classContent" class="form-control" id="classContent" cols="30" rows="10">${ccls.classContent }</textarea>
							</div>
						</div>
						<br>
						내용 글자수 테스트용 최종 제출시 이거 지워야함 : <span id="currByte">0</span>/3000bytes
						<div class="form-group row">
							<div class="col-sm-6">
								<h5>클래스 장소(입력 안할시 비대면)</h5>
							</div>
							<div class="col-sm-6">
								<label for="classPrice"><h5>클래스 가격</h5></label>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-sm-4">
								<input type="text" name="classLocation1" id="classLocation1" class="form-control" value="${ccls.classLocation1 }" readonly>					
							</div>
							<div class="col-sm-2">
								<button type="button" id="addrSearch" class="btn clsfrm-btn">주소검색</button>
							</div>
							<div class="col-sm-4">
								<input type="text" name="classPrice" id="classPrice" class="form-control" value="${ccls.classPrice }" maxlength="10">
								
							</div>
							<div class="col-sm-2 time-range"><h4>원</h4></div>
						</div>
						<div class="form-group row">
							<div class="col-sm-6"></div>
							<div class="col-sm-6">
							<span class="result">　</span>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-sm-6"></div>
							<div class="col-sm-6">
								<h5>클래스 정원(최소 10명 이상)</h5>
							</div>
							
						</div>
						<div class="form-group row">
							<div class="col-sm-4">
								<input type="text" name="classLocation2" id="classLocation2" class="form-control" value="${ccls.classLocation2 }" maxlength="100">
							</div>
							<div class="col-sm-2"></div>
							<div class="col-sm-4">
								<input type="text" name="classNop" id="classNop" class="form-control" value="${ccls.classNop }" maxlength="10">
							</div>
							<div class="col-sm-2 time-range"><h4>명</h4></div>
						</div>
						<div class="form-group row">
							<div class="col-sm-6"></div>
							<div class="col-sm-6">
							<span class="result">　</span>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-sm-6">
								<h5>클래스 시간</h5>
							</div>
							<div class="col-sm-6">
								<h5>클래스 날짜</h5>
							</div>
						</div>
						<div class="form-group row mb-2">
							<div class="col-sm-4">
								<input type="time" name="classStartTime" id="time1" class="form-control" value="${ccls.classStartTime }">
							</div>
							<div class="col-sm-2 time-range">
								<h4>부터</h4>
							</div>
							<div class="col-sm-4">
								<input type="date" name="classStart" id="classStart" class="form-control" value="${ccls.classStart }">
							</div>
							<div class="col-sm-2 time-range">
								<h4>부터</h4>
							</div>
						</div>
						<div class="form-group row mb-2">
							<div class="col-sm-4">
								<input type="time" name="classEndTime" id="time2" class="form-control" value="${ccls.classEndTime }">
							</div>
							<div class="col-sm-2 time-range">
								<h4>까지</h4>
							</div>
							<div class="col-sm-4">
								<input type="date" name="classEnd" id="classEnd" class="form-control" value="${ccls.classEnd }">
							</div>
							<div class="col-sm-2 time-range">
								<h4>까지</h4>
							</div>
						</div>
						<div class="form-group row mb-2">
							<div class="col-sm-6">
								<span class="result">　</span>
							</div>
							<div class="col-sm-6">
								<span class="result">　</span>
							</div>
						</div>				
						<div class="row justify-content-md-center">
							<div class="d-grid gap-2 d-md-flex justify-content-md-end">
								<input type="submit" value="등록" class="btn clsfrm-btn col-2" id="classWrite">
							</div>
						</div>
		
						<input type="hidden" id="arrVal">
					</form>
				</div>
			</div>
		</c:otherwise>
	</c:choose>
	<script>
		$(function(){

			//플래그 용도
			var classTitleChk = true;
			var classContentChk = true;
			var classPriceChk = true;
			var classNopChk = true;
			var time1Chk = true;
			var time2Chk = true;
			var classStartChk = true;
			var classEndChk = true;
			var classUpdateChk = true;
 
			//작성 필수 조건 확인
			function chkWrite(){
				var classTitleVal = $("#classTitle").val();
				var classContentVal = $("#classContent").val();
				var classPriceVal = $("#classPrice").val();
				var classNopVal = $("#classNop").val();
				var time1Val = $("#time1").val();
				var time2Val = $("#time2").val();
				var classStartVal = $("#classStart").val();
				var classEndVal = $("#classEnd").val();
				
				if(classTitleVal == "" || classTitleChk == false){
					alert("제목을 올바르게 입력해주세요.");
					return false;
				}else if(classContentVal == "" || classContentChk == false){
					alert("내용을 글자수 제한에 알맞게 입력해주세요.");
					return false;					
				}else if(classPriceVal == "" || classPriceChk == false){
					alert("가격을 올바르게 입력해주세요.");
					return false;					
				}else if(classNopVal == "" || classNopChk == false){
					alert("인원수를 올바르게 입력해주세요.");
					return false;					
				}else if(time1Val == "" || time1Chk == false){
					alert("시작 시간을 올바르게 입력해주세요.");
					return false;					
				}else if(time2Val == "" || time2Chk == false){
					alert("마치는 시간을 올바르게 입력해주세요.");
					return false;					
				}else if(classStartVal == "" || classStartChk == false){
					alert("시작 날짜를 올바르게 입력해주세요.");
					return false;					
				}else if(classEndVal == "" || classEndChk == false){
					alert("종강 날짜를 올바르게 입력해주세요.");
					return false;					
				}else if(classUpdateChk == true){
					return true;
				}else{
					return true;
				}
			}
			
			//이미지 업로드 대체하기
			$(".fileDelete").click(function(){
				$(".fileDelete").hide();
				$(".classThumbnail").css("display", "block");
				$(".prevFileDel").val(1);
			});
			
			
			//클래스 작성 버튼
			$("#classWrite").click(function(){
				return chkWrite();
			});
			
			//썸네일 이미지
			$(".classThumbnail").change(function(){
				var fileVal = $(this).val();
				var pathPoint = fileVal.lastIndexOf('.');
				var filePoint = fileVal.substring(pathPoint+1, this.length);
				var fileType = filePoint.toLowerCase();
				var fileSize = 10 * 1024 * 1024; //10메가
				if(fileType == 'jpg' || fileType == 'png' || fileType == 'jpeg' || fileType == 'gif'){
				var uploadFileSize = this.files[0].size;
					if(uploadFileSize > fileSize){
						alert("이미지 업로드 용량은 10MB 이하로 가능합니다.");
						$(".classThumbnail").val("");
						$(".prevFileDel").val(0);
					}
				}else if(fileVal == ""){
					$(".prevFileDel").val(0);					
				}else if(fileType != 'jpg' || fileType != 'png' || fileType != 'jpeg' || fileType != 'gif'){
					alert("프로필 사진은 이미지 파일만 가능합니다.");
					$(".classThumbnail").val("");
					$(".prevFileDel").val(0);
				}else{
					$(".prevFileDel").val(1);					
				}
			});
			
			//클래스 제목
			$("#classTitle").keyup(function(){
    	    	const titleByte = 300; //varchar2 300이니까 300
	    		let classTitle = $(this).val();
				let currentByte = 0;
            	let classTitleLen = classTitle.length;
				
                for(let i = 0 ; i < classTitleLen ; i++){
                    let titleCharAt = classTitle.charAt(i);
                    let titleUnicode = escape(titleCharAt) //유니코드 형식으로 변환 u1234 이런식
                    if(titleUnicode.length>4){
                        // 한글 : oracle 11xe는 한글이 3Byte
                        currentByte += 3;
                    }else{
                        // 영문,숫자,특수문자 : 1Byte
                        currentByte += 1;
                    }
                }
                
                if(classTitle == ""){
                	classTitleChk = false;
                	classUpdateChk = false;
                }else if(currentByte > titleByte){
                	$("#titleByte").html(currentByte);
                	$("#titleByte").css("color", "red");
                	classTitleChk = false;
                	classUpdateChk = false;
                }else{
                	$("#titleByte").html(currentByte);
                	$("#titleByte").css("color", "blue");
                	classTitleChk = true;
                } 
				
			});
			
			//다음 api 주소 검색
            $("#addrSearch").click(function(){
            	$("#classLocation1").val("");
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
            
			//상세주소 입력
            $("#classLocation2").keyup(function(){
            	let emptyChk = $("#classLocation1").val();
            	if(emptyChk == ""){
            		alert("주소 검색 부터 해주세요!");
            		$(this).val("");
            	}
            });
            
			//클래스 시작 시간
            $("#time1").change(function(){
                let time1 = $("#time1").val();
                let time2 = $("#time2").val();
                if(time1 >= time2){
                    $(".result").eq(2).html("시간을 올바르게 입력해주세요.");
                    $(".result").eq(2).css("color", "red");
                    time1Chk = false;
                	classUpdateChk = false;

                }else{
                    $(".result").eq(2).html("올바르게 입력됐습니다.");
                    $(".result").eq(2).css("color", "blue");                	
                    time1Chk = true;
                }
            });

			//클래스 끝나는 시간
            $("#time2").change(function(){
                let time1 = $("#time1").val();
                let time2 = $("#time2").val();
                if(time1 >= time2){
                    $(".result").eq(2).html("시간을 올바르게 입력해주세요.");
                    $(".result").eq(2).css("color", "red");
                    time2Chk = false;
                	classUpdateChk = false;

                }else{
                    $(".result").eq(2).html("올바르게 입력됐습니다.");
                    $(".result").eq(2).css("color", "blue");
                    time1Chk = true;
                    time2Chk = true;
                }
            });
            
			//클래스 가격
            $("#classPrice").keyup(function(){
            	let price = $(this).val();
            	
            	let pricesub = price.substring(0,1);
            	console.log(pricesub);
            	
            	if(price.substring(0, 1) != 0 && price % 10 == 0 && price > 0){
            		$(".result").eq(0).html("올바르게 입력됐습니다.");
            		$(".result").eq(0).css("color", "blue");
            		classPriceChk = true;
            	}else{            		
            		$(".result").eq(0).html("가격을 올바르게 입력해주세요.");
            		$(".result").eq(0).css("color", "red");
            		classPriceChk = false;
                	classUpdateChk = false;

            	}
            });
            
			//클래스 인원수
            $("#classNop").keyup(function(){
            	let nop = $(this).val();
            	if(nop.substring(0, 1) != 0 && nop >= 10){
            		$(".result").eq(1).html("올바르게 입력됐습니다.");
            		$(".result").eq(1).css("color", "blue");
            		classNopChk = true;
            	}else{
            		$(".result").eq(1).html("인원수를 올바르게 입력해주세요.");
            		$(".result").eq(1).css("color", "red");
            		classNopChk = false;
                	classUpdateChk = false;

            	}
            });
            
			//클래스 시작 날짜
            $("#classStart").change(function(){
            	let classStart = $(this).val();
            	let classEnd = $("#classEnd").val();
            	
            	var date = new Date();
            	var today = date.getFullYear()+"-"+("0"+(date.getMonth()+1)).slice(-2)+"-"+("0"+date.getDate()).slice(-2);
            	
            	if(classStart <= today+1){
            		console.log("날짜 오류");
            		$(this).val("");
            		classStartChk = false;
                	classUpdateChk = false;

            	}else if(classStart == "" || classEnd == ""){            		
            		console.log("둘 중 하나가 공백");
            		classStartChk = false;
                	classUpdateChk = false;

            	}else if(classStart >= classEnd){
            		console.log("시작일이 더 큼");
            		classStartChk = false;
                	classUpdateChk = false;

            	}else{
            		console.log("올바르게 입력됨");
            		classStartChk = true;
            	} 
            });
            
			//클래스 종강 날짜
            $("#classEnd").change(function(){
            	let classEnd = $(this).val();
            	let classStart = $("#classStart").val();
            	
            	var date = new Date();
            	var today = date.getFullYear()+"-"+("0"+(date.getMonth()+1)).slice(-2)+"-"+("0"+date.getDate()).slice(-2);
            	
            	if(classEnd <= today+2){
            		console.log("날짜 오류");
            		$(this).val("");
            		classEndChk = false;
                	classUpdateChk = false;

            	}else if(classStart == "" || classEnd == ""){            		
            		console.log("둘 중 하나가 공백");
            		classEndChk = false;
                	classUpdateChk = false;

            	}else if(classStart >= classEnd){
            		console.log("시작일이 더 큼");
            		classEndChk = false;
                	classUpdateChk = false;

            	}else{
            		console.log("올바르게 입력됨");
            		classStartChk = true;
            		classEndChk = true;
            	}
            });
			
			//클래스 내용
            $("#classContent").summernote({
				height : 400,
				lang : "ko-KR",
				callbacks : {
					onImageUpload : function(files){						
						for(let i = files.length-1 ; i>=0 ; i--){
							uploadImage(files[i], this);
						}
					},
					onChange : function(e){
						setTimeout(function(){
		        	    	const contentByte = 3000; //varchar2 3000이니까 3000
        		    		let classContent = $("#classContent").val();
			            	let classContentLen = classContent.length;
            				let currentByte = 0;
            				
                            for(let i=0 ; i < classContentLen ; i++){
                                let contentCharAt = classContent.charAt(i);
                                let contentUnicode = escape(contentCharAt) //유니코드 형식으로 변환 u1234 이런식
                                if(contentUnicode.length>4){
                                    // 한글 : oracle 11xe는 한글이 3Byte
                                    currentByte += 3;
                                }else{
                                    // 영문,숫자,특수문자 : 1Byte
                                    currentByte += 1;
                                }
                            }
                            
                            if(currentByte > contentByte){
                            	$("#currByte").html(currentByte);
                            	$("#currByte").css("color", "red");
                            	classContentChk = false;
                            	classUpdateChk = false;

                            }else{
                            	$("#currByte").html(currentByte);
                            	$("#currByte").css("color", "blue");
                            	classContentChk = true;
                            }                            
							
						}, 200);
					}
				}
            });
            
			var arr = new Array();
			
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
    					
    					console.log(data.filename+" "+data.filepath);
    					arr.push({filename:data.filename, filepath:data.filepath});
    					console.log(arr);
    					
    					let a = $("#arrVal").val(arr);
    					console.log(a);
    				}
    			});
    				
    		}
            
		});	
	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
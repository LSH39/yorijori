<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.3.1.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="main">
		<h1>레시피 등록</h1>
		<form action="/recipeFrm.do" method="post"
			enctype="multipart/form-data">
			<input type="hidden" value="${sessionScope.m.memberNo }">
			<div class="recipeFrm">
				<label for="recipeTitle">레시피 제목 </label>
				<input type="text" id="recipeTitle" name="recipeTitle" placeholder="예) 맛있는 소고기 미역국 끓이기 ">
			</div>
			<div class="recipeFrm">
				<label for="subhead">요리 한줄설명</label> 
				<input type="text" id="subhead" name="subhead" placeholder="레시피를 소개할 수 있는 한줄 설명을 입력해주세요">
			</div>
			<div class="recipeFrm">
				<label for="uploadImg">대표이미지</label> 
				<input type="file" id="uploadImg" name="uploadImg" onchange="loadImg(this);"
					accept=".jpg,.jpeg,.png,.gif" style="display: none;" id="uploadImg">
				<button id="uploadBtn">
					<img src="/resources/img/recipe/image.png" id="img" width="300px">
				</button>
			</div>
			<div class="recipeFrm">
				<label for="recipeVideo">동영상 링크</label>
				<input type="text" name="recipeVideo" placeholder="동영상이 있으면 온라인 링크만 걸어주세요(생략가능)">
			</div>
			<div class="recipeFrm">
				<p>음식정보</p>
				<div id="recipeFrm1">
					<label for="foodName">음식이름</label>
					<input type="text" id="foodName" name="foodName" placeholder="음식명을 입력하세요">
					 <input type="text" id="recipeTime" name="recipeTime"
						placeholder="조리시간 예) 60분">소요
				</div>
				<div id="recipeFrm2">
					<p>재료정보</p>
					<div class="materialBox">
						<input type="text"  name="mNameList"placeholder="예) 고추장"> 
						<input type="text"	name="mAmountList" placeholder="예) 2T">
					</div>
					<div class="materialBox">
						<input type="text" name="mNameList" placeholder="예) 양파"> 
						<input type="text" name="mAmountList" placeholder="예) 1/2개">
					</div>
					<div class="materialBox">
						<input type="text" name="mNameList" placeholder="예) 닭가슴살">
						<input type="text" name="mAmountList" placeholder="예) 300g">
					</div>
					<div id="newInput"></div>
					<p id="plusBtn">재료추가</p>
				</div>
			</div>
			<div class="recipeFrm">
				<p>카테고리</p>
				<select name="situation" id="situation">
					<option selected>상황별</option>
					<option value="1">술안주</option>
					<option value="2">다이어트</option>
					<option value="3">손님초대</option>
					<option value="4">혼밥/자취</option>
					<option value="5">간식</option>
					<option value="6">유아식</option>
					<option value="7">비건/채식</option>
					<option value="8">기타</option>
				</select> <select name="material" id="material">
					<option selected>재료별</option>
					<option value="1">육류</option>
					<option value="2">채소류</option>
					<option value="3">해산물</option>
					<option value="4">달걀/유제품</option>
					<option value="5">면/만두</option>
					<option value="6">콩/두부</option>
					<option value="7">과일</option>
					<option value="8">기타</option>
				</select> <select name="recipeLevel" id="recipeLevel">
					<option selected>난이도별</option>
					<option value="1">상</option>
					<option value="2">중</option>
					<option value="3">하</option>
				</select>
			</div>
			<div class="recipeFrm">
				<div class="cookOrder">
					<p>STEP1</p>
					<textarea name="rContentList"></textarea>
					<input type="file" name="files" accept=".jpg,.jpeg,.png,.gif"
						multiple> <img class="recipeImg">
				</div>
				<div class="newContent"></div>
				<p id="plusBtn2">순서추가</p>
			</div>
			<input type="submit" value="등록하기" onclick="return subBtn()">
		</form>
	</div>
	<script>
		function loadImg(obj) {
		  var files = obj.files;
		  console.log(files);
		  if(files.length != 0){
			  var reader = new FileReader();
			  reader.readAsDataURL(files[0]);
			  reader.onload = function(e) {
				$("#img").attr("src",e.target.result);
				$("#img").css("height","300px");
				$("#uploadImg").css("display","none");
			}
		  }
		}
		
		
		function subBtn() {
			var mName = $("input[name='mNameList']").length;
			var rContent = $("textarea[name='rContentList']").length;
			
			for(i=0; i<rContent; i++){
				if($("textarea[name='rContentList']").eq(i).val()=="" || $("input[name='files']").eq(i).val()==""){
					alert("조리순서를 빈칸없이 작성해주세요");
					return false;
				}
			}
			
			for(i=0; i<mName;i++){
				if($("input[name='mNameList']").eq(i).val()==""){
					alert("재료이름를 빈칸없이 작성해주세요");
					return false;
				}
			}	
			
		 	if($("#recipeTitle").val()=="" || $("#subhead").val()=="" || $("#uploadImg").val()=="" || $("#foodname").val()=="" || $("#situation").val()=="" || $("#material").val()=="" || $("#recipeLevel").val()=="" ){
					 alert("빈칸없이 작성해주세요"); 
					 return false;
				}
			}
			
		$(function() {
			$("#uploadBtn").click(function(e) {
				e.preventDefault();
				$("#uploadImg").click();
			});	
			
			$("#plusBtn").click(function() {
				var mHTML = "<div class='materialBox'>"
				+ "<input type='text' name='mNameList'>" 
				+ " <input type='text'  name='mAmountList' > </div>";
				$("#newInput").append(mHTML);
			});
			
				var orderNum = 1;
			$("#plusBtn2").click(function() {
				var contentHTML = "<div class='cookOrder'> <p>STEP"+(++orderNum)+"</p>"
					+ "<textarea name='rContentList' '></textarea >"
					+ " <input type='file' name='files' accept='.jpg,.jpeg,.png,.gif' multiple>"
					+ "<img class='recipeImg'></div>";
				$(".newContent").append(contentHTML);
				
		});
			
		});
	</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
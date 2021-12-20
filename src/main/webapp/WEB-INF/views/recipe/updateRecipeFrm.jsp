<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<div class="main">
		<form action="/updateRecipeFrm.do" method="post"	enctype="multipart/form-data">
			<input type="hidden" value="${sessionScope.m.memberNo }">
			<div class="recipeFrm">
				<label for="recipeTitle">레시피 제목 </label>
				<input type="text" id="recipeTitle" name="recipeTitle" value="${rb.recipeTitle }">
			</div>
			<div class="recipeFrm">
				<label for="subhead">요리 한줄설명</label> 
				<input type="text" id="subhead" name="subhead" value="${rb.subhead }">
			</div>
			<div class="recipeFrm">
				<label for="uploadImg">대표이미지</label> 
				<input type="hidden" name="filepath" value="${rb.filepath }">
				<img id="img" src="/resources/upload/recipe/${rb.filepath }"  width="150px">
				<span id="imgName">${rb.filepath }</span>
				<input type="file" id="uploadImg" name="uploadImg" onchange="loadImg(this);" 
					accept=".jpg,.jpeg,.png,.gif" > 
					
			</div>
			<div class="recipeFrm">
				<label for="recipeVideo">동영상 링크</label>
				<input type="text" name="recipeVideo" value="${rb.recipeVideo }">
			</div>
			<div class="recipeFrm">
				<p>음식정보</p>
				<div id="recipeFrm1">
					<label for="foodName">음식이름</label>
					<input type="text" id="foodName" name="foodName" value="${rb.foodName }">
					 <input type="text" id="recipeTime" name="recipeTime"
						value="${rb.recipeTime }">소요
				</div>
				<div id="recipeFrm2">
					<p>재료정보</p>
					<c:forEach items="${rb.MList }" var="m">
					<div class="materialBox">
						<input type="text"  name="mNameList" value="${m.materialName }"> 
						<input type="text"	name="mAmountList" value="${m.MAmount }">
					</div>
					</c:forEach>
					<div id="newInput"></div>
					<p id="plusBtn">재료추가</p>
				</div>
			</div>
			<div class="recipeFrm">
				<p>카테고리</p>
				<select name="situation" id="situation">
					<option selected value="">상황별</option>
					<option value="1">술안주</option>
					<option value="2">다이어트</option>
					<option value="3">손님초대</option>
					<option value="4">혼밥/자취</option>
					<option value="5">간식</option>
					<option value="6">유아식</option>
					<option value="7">비건/채식</option>
					<option value="8">기타</option>
				</select> <select name="material" id="material">
					<option selected value="">재료별</option>
					<option value="1">육류</option>
					<option value="2">채소류</option>
					<option value="3">해산물</option>
					<option value="4">달걀/유제품</option>
					<option value="5">면/만두</option>
					<option value="6">콩/두부</option>
					<option value="7">과일</option>
					<option value="8">기타</option>
				</select> <select name="recipeLevel" id="recipeLevel">
					<option selected value="">난이도별</option>
					<option value="1">상</option>
					<option value="2">중</option>
					<option value="3">하</option>
				</select>
			</div>
			<div class="recipeFrm">
			
			<c:forEach items="${rb.RList }" var="rc" varStatus="i">
				<div class="cookOrder">		
				<c:set var="num" value="${num+1 }"></c:set>			
					<p>STEP${i.count }</p>
					<textarea name="rContentList" >${rc.recipeContent}</textarea>
					<img src="/resources/upload/recipeContent/${rc.filepath }" width="150px">
					<input type="file" name="files" class="contentImg" accept=".jpg,.jpeg,.png,.gif"
						multiple >						
				</div>
			</c:forEach>
				<div class="newContent"></div>
				<p id="plusBtn2">순서추가</p>
			</div>
			<input type="submit" value="등록하기" onclick="return subBtn()">
		</form>
		</div>
		<script>
		function loadImg(obj) {
			  var files = obj.files;
			  if(files.length != 0){
				  var reader = new FileReader();
				  reader.readAsDataURL(files[0]);
				  reader.onload = function(e) {
					$("#img").attr("src",e.target.result);
					$("#img").css("height","200px");
					$("#img").css("width","200px");
				}
			  }
			}
		function uploadImg(obj) {
			  var files = obj.files;
			  if(files.length != 0){
				  var reader = new FileReader();
				  reader.readAsDataURL(files[0]);
				  reader.onload = function(e) {
					$(".recipeImg0").attr("src",e.target.result);
					$("#img").css("height","200px");
					$("#img").css("width","200px");
				}
			  }
			}
		function subBtn() {
			var mName = $("input[name='mNameList']").length;
			var rContent = $("textarea[name='rContentList']").length;
			
			for(i=0; i<rContent; i++){
				if($("textarea[name='rContentList']").eq(i).val()==""){
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
			
		 	if($("#recipeTitle").val()=="" || $("#subhead").val()=="" ||  $("#foodname").val()=="" ){
		 		     alert("빈칸없이 작성해주세요"); 
					 return false;
				}else if( $("#situation").val()=="" || $("#material").val()=="" || $("#recipeLevel").val()=="" ){
					var situation = $("#situation").val();	 
			 		console.log(situation);
			 		     alert("카테고리를 선택해주세요"); 
						 return false;
				}
			}
			
		$(function() {
			$("#plusBtn").click(function() {
				var mHTML = "<div class='materialBox'>"
				+ "<input type='text' name='mNameList'>" 
				+ " <input type='text'  name='mAmountList' > </div>";
				$("#newInput").append(mHTML);
			});
			
			var orderNum = ${num};
			$("#plusBtn2").click(function() {
				var contentHTML = "<div class='cookOrder'> <p>STEP"+(++orderNum)+"</p>"
					+ "<textarea name='rContentList' '></textarea >"
					+ " <input type='file' name='files' accept='.jpg,.jpeg,.png,.gif' multiple>"
					+ "<img class='recipeImg'></div>";
				$(".newContent").append(contentHTML);
				
		});
			$("#uploadImg").change(function() {
				$("#imgName").css("display","none");
			});
			
			$(".contentImg").change(function() {
				 $(this).prev().css("display","none");
			});
		});
		</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
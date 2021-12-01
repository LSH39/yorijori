<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
</head>
<body>
	<div class="main">
		<h1>레시피 등록</h1>
		<form action="/recipeFrm.do" method="post" enctype="multipart/form-data">
		<input type="hidden" value="${sessionScope.m.memberNo }">
		<div class="recipeFrm">
		<label for="recipeTitle">레시피 제목 </label><input type="text" name="recipeTitle" placeholder="예) 맛있는 소고기 미역국 끓이기 ">
		</div>
		<div class="recipeFrm">
		<label for="subhead">요리 한줄설명</label> <input type="text" name="subhead" placeholder="레시피를 소개할 수 있는 한줄 설명을 입력해주세요">
		</div>
		<div class="recipeFrm">
		<label for="uploadImg">대표이미지</label><input type="file" name="uploadImg"onchange="loadImg(this);" accept=".jpg,.jpeg,.png,.gif" >
		<img id="previewImg">
		</div>
		<div class="recipeFrm">
		<label for="recipeVideo">동영상 링크</label><input type="text" name="recipeVideo" placeholder="동영상이 있으면 온라인 링크만 걸어주세요(선택사항)">
		</div>
		<div class="recipeFrm">
		<p>음식정보</p>
		<div id="recipeFrm1">
		<label for="foodName">음식이름</label><input type="text" name="foodName" placeholder="음식명을 입력하세요">
		<input type="text" name="recipeTime" placeholder="조리시간 예)60분">소요
		</div>
		<div id="recipeFrm2">
		<p>재료정보</p>
		<div class="materialBox">
		<input type="text" name="mNameList[]" placeholder="예) 고추장"> 
		<input type="text" name="mAmountList[]" placeholder="예) 2T">
		</div>
		<div class="materialBox">
		<input type="text" name="mNameList[]" placeholder="예) 양파"> 
		<input type="text" name="mAmountList[]" placeholder="예) 1/2개">
		</div>
		<div class="materialBox">
		<input type="text" name="mNameList[]" placeholder="예) 닭가슴살"> 
		<input type="text" name="mAmountList[]" placeholder="예) 300g">
		</div>
		<button id="plusBtn">재료추가</button>
		</div>
		</div>
		<div class="recipeFrm">
		<p>카테고리</p> 
		<select name="situation">
		<option selected>상황별</option>
		<option value="술안주">술안주</option>
		<option value="다이어트">다이어트</option>
		<option value="손님초대">손님초대</option>
		<option value="혼밥">혼밥</option>
		<option value="간식">간식</option>
		<option value="어린이용">어린이용</option>
		<option value="VEGAN">VEGAN</option>
		<option value="기타">기타</option>
		</select>
		<select name="material">
		<option selected>재료별</option>
		<option value="육류">육류</option>
		<option value="채소류">채소류</option>
		<option value="해물류">해물류</option>
		<option value="기타">기타</option>
		</select>
		<select name="recipeLevel">
		<option selected>난이도별</option>
		<option value="상">상</option>
		<option value="중">중</option>
		<option value="하">하</option>
		</select>
		</div>
		<div class="recipeFrm">
		<div class="cookOrder">
		<p>STEP<span id="num">1</span></p>
		<textarea name="recipeContent"></textarea>
		<input type="file" name="contentImg" accept=".jpg,.jpeg,.png,.gif">
		</div>
		<button id="plusBtn2" >순서추가</button>>
		</div>
		<input type="submit" value="등록하기">
		</form>
	</div>
	<script ></script>
</body>
</html>
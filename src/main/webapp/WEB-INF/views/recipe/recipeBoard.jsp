<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
      <script>
         $(function(){
         
        $(".item").click(function(){
            var item = $(this).html();
            $.ajax({
            	url: "/rCategoty1.do",
            	data : {item:item},
            	type: "post",
            	success(function(data) {
					$(".recipeList").empty();
					for(var i=0;i<data.length;i++){
						var rb = data[i];
						var html = "";
						html += "<div class='recipe'>";
						html += "<a href='/recipeView.do?recipeNo="+rb.recipeNo+"'>"+rb.filepath+"</a>";
						html += "<a href='/recipeView.do?recipeNo="+rb.recipeNo+"'>"+rb.recipeTitle+"</a>";
						html += rb.recipeWriter
					}
				})
            });
        });
        $(".item2").click(function(){
            var item2 = $(this).html();
            console.log(item2);
        });
        $(".item3").click(function(){
            var item3 = $(this).html();
            console.log(item3);
        });
    });
    </script>
</head>

<body>
    <h1>레시피</h1>
<div class="category">
    <ul>
        <li class="top-title"><a href="#">상황별</a>
            <ul class="sub">
            <li class="item" >술안주</li>
            <li class="item" >다이어트</li>
            <li class="item" >손님초대</li>
            <li class="item" >혼밥/자취</li>
            <li class="item" >간식</li>
            <li class="item" >유아식</li>
            <li class="item" >비건/채식</li>
            <li class="item" >기타</li>
            </ul>
        </li >
        <li class="top-title"><a href="#">재료별</a>
            <ul class="sub">
            <li class="item2">육류</li>
            <li class="item2">채소류</li>
            <li class="item2">해산물</li>
            <li class="item2">달걀/유제품</li>
            <li class="item2">면/만두</li>
            <li class="item2">콩/두부</li>
            <li class="item2">과일</li> 
            <li class="item2">기타</li>
            </ul>
        <li class="top-title"><a href="#">난이도별</a>
            <ul class="sub">
            <li class="item3" value="상">상</li>
            <li class="item3" value="중">중</li>
            <li class="item3" value="하">하</li>
            </ul>
    </ul>
</div>
	<div id="recipeList">
		<c:forEach items="${list }" var="rb" varStatus="i">
		<a href="/recipeView.do?recipeNo=${recipeNo }"><img src="/resources/upload/recipe/${rb.filepath }"></a>
	    <a href="/recipeView.do?recipeNo=${recipeNo }">${rb.recipeTitle }</a>
		${rb.readCount }
		${rb.recipeTime }
		${rb.recipeLevel }
		</c:forEach>
	</div>		
</body>
</html>
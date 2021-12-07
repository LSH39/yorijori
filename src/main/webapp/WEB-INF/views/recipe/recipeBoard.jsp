<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
     
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
		<a href="/recipeView.do?recipeNo=${rb.recipeNo }"><img src="/resources/upload/recipe/${rb.filepath }"></a>
	    <a href="/recipeView.do?recipeNo=${rb.recipeNo }">${rb.recipeTitle }</a>
		${rb.readCount }
		${rb.nickname }
		${rb.recipeTime }
		${rb.recipeLevel }
		</c:forEach>
	</div>		
	 <script>
         $(function(){
         
        $(".item").click(function(){
            var item = $(this).html();
            $.ajax({
            	url: "/rCategory1.do",
            	data : {item:item},
            	dataType : "json",
            	type: "post",
            	success: function(data) {
					$("#recipeList").empty();
					for(var i=0;i<data.length;i++){
						var rb = data[i];
						var html = "";
						html += "<div class='recipe'>";
						html += "<a href='/recipeView.do?recipeNo="+data[i].recipeNo+"'>"+data[i].filepath+"</a>";
						html += "<a href='/recipeView.do?recipeNo="+data[i].recipeNo+"'>"+data[i].recipeTitle+"</a>";
						html += data[i].readCount;
						html += data[i].nickname;
						html += data[i].recipeTime;
						html += data[i].recipeLevel;
						html += "</div>";
						$("#recipeList").append(html);
					}
				}
            });
        });
        $(".item2").click(function(){
            var item2 = $(this).html();
            $.ajax({
            	url: "/rCategory2.do",
            	data : {item2:item2},
            	dataType :"json",
            	type: "post",
            	success : function(data) {
            		$("#recipeList").empty();
					for(var i=0;i<data.length;i++){
						var rb = data[i];
						var html = "";
						html += "<div class='recipe'>";
						html += "<a href='/recipeView.do?recipeNo="+data[i].recipeNo+"'>"+data[i].filepath+"</a>";
						html += "<a href='/recipeView.do?recipeNo="+data[i].recipeNo+"'>"+data[i].recipeTitle+"</a>";
						html += data[i].readCount;
						html += data[i].nickname;
						html += data[i].recipeTime;
						html += data[i].recipeLevel;
						html += "</div>";
						$("#recipeList").append(html);
					}
				}
            });
        });
        $(".item3").click(function(){
            var item3 = $(this).html();
            $.ajax({
            	url: "/rCategory3.do",
            	data : {item3:item3},
            	dataType :"json",
            	type: "post",
            	success : function(data) {
            		$("#recipeList").empty();
					for(var i=0;i<data.length;i++){
						var rb = data[i];
						var html = "";
						html += "<div class='recipe'>";
						html += "<a href='/recipeView.do?recipeNo="+data[i].recipeNo+"'>"+data[i].filepath+"</a>";
						html += "<a href='/recipeView.do?recipeNo="+data[i].recipeNo+"'>"+data[i].recipeTitle+"</a>";
						html += data[i].readCount;
						html += data[i].nickname;
						html += data[i].recipeTime;
						html += data[i].recipeLevel;
						html += "</div>";
						$("#recipeList").append(html);
					}
				}
            });
        });
    });
    </script>
</body>
</html>
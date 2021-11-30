<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
      <script>
         $(function(){
        $(".item").click(function(){
            
            var item = $(this).attr("value");
            console.log(item);
        });
        $(".item2").click(function(){
            var item2 = $(this).attr("value");
            console.log(item2);
        });
        $(".item3").click(function(){
            var item3 = $(this).attr("value");
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
            <li class="item" value="1">술안주</li>
            <li class="item" value="다이어트">다이어트</li>
            <li class="item" value="손님초대" >손님초대</li>
            <li class="item" value="혼밥">혼밥</li>
            <li class="item" value="간식">간식</li>
            <li class="item" value="어린이용">어린이용</li>
            <li class="item" value="vegan">VEGAN</li>
            <li class="item" value="기타">기타</li>
            </ul>
        </li >
        <li class="top-title"><a href="#">재료별</a>
            <ul class="sub">
            <li class="item2" value="육류">육류</li>
            <li class="item2" value="채소류">채소류</li>
            <li class="item2" value="해물류">해물류</li>
            <li class="item2" value="기타">기타</li>
            </ul>
        <li class="top-title"><a href="#">난이도별</a>
            <ul class="sub">
            <li class="item3" value="상">상</li>
            <li class="item3" value="중">중</li>
            <li class="item3" value="하">하</li>
            </ul>
    </ul>
</div>
	<div id="recipe-list">
	
	</div>
	
</body>
</html>
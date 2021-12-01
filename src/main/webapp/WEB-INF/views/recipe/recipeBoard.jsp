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
            
            var item = $(this).html();
            console.log(item);
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
            <li class="item" >혼밥</li>
            <li class="item" >간식</li>
            <li class="item" >어린이용</li>
            <li class="item" >VEGAN</li>
            <li class="item" >기타</li>
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
	<div id="recipe-list"></div>
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link href="/resources/css/chat/Chat.css" rel="stylesheet" type="text/css">
<link href="/resources/css/chat/ChatAdmin.css" rel="stylesheet" type="text/css">

<a class="chat" id="chatUser">1:1문의(유저)</a>
<a class="chat" id="chatAdmin">1:1문의(관리자)</a>


<div class="chatFrm shadow" id="chatFrmAdmin">
    <div class="chatTop"><p>요리조리 1:1 문의 목록</p></div>
    <div class="chatMain">
        <table id="chatHome">
            <colgroup>
                <col style="width:80%"/>
                <col style="width:20%" />
            </colgroup>
            <tr class="chatHomeTr"><td colspan="2" id="chatId">user01</td></tr>
            <tr><td class="chatText">내용내용내용문의문의</td><td><span>10:20</span></td></tr>
            <tr class="chatHomeTr"><td colspan="2" id="chatId">user02</td></tr>
            <tr><td class="chatText">내용내용내용문의문의</td><td><span>10:20</span></td></tr>
            <tr class="chatHomeTr"><td colspan="2" id="chatId">user03</td></tr>
            <tr><td class="chatText">내용내용내용문의문의</td><td><span>10:20</span></td></tr>
            <tr class="chatHomeTr"><td colspan="2" id="chatId">user04</td></tr>
            <tr><td class="chatText">내용내용내용문의문의</td><td><span>10:20</span></td></tr>
            <tr class="chatHomeTr"><td colspan="2" id="chatId">user05</td></tr>
            <tr><td class="chatText">내용내용내용문의문의내용내용내용문의문의내용내용내용문의문의</td><td><span>10:20</span></td></tr>
            <tr class="chatHomeTr"><td colspan="2" id="chatId">user01</td></tr>
            <tr><td class="chatText">내용내용내용문의문의</td><td><span>10:20</span></td></tr>
            <tr class="chatHomeTr"><td colspan="2" id="chatId">user02</td></tr>
            <tr><td class="chatText">내용내용내용문의문의</td><td><span>10:20</span></td></tr>
            <tr class="chatHomeTr"><td colspan="2" id="chatId">user03</td></tr>
            <tr><td class="chatText">내용내용내용문의문의</td><td><span>10:20</span></td></tr>
            <tr class="chatHomeTr"><td colspan="2" id="chatId">user04</td></tr>
            <tr><td class="chatText">내용내용내용문의문의</td><td><span>10:20</span></td></tr>
            <tr class="chatHomeTr"><td colspan="2" id="chatId">user05</td></tr>
            <tr><td class="chatText">내용내용내용문의문의내용내용내용문의문의내용내용내용문의문의</td><td><span>10:20</span></td></tr>
        </table>

    </div>
    <div class="chatBottom">
        <br>
    </div>
</div>

<script>
    var selectUser;
    $(function(){
        $("#chatFrmAdmin").css("display","none").prop("on",false);
    });

    $("#chatAdmin").click(function(){
        if($("#chatFrmAdmin").prop("on") == false){
            $("#chatFrmAdmin").css("display","block").prop("on",true);
        }else{
            $("#chatFrmAdmin").css("display","none").prop("on",false);
        }

    });

    // css
    $(".chatHomeTr").hover(function(){
        $(this).css("background-color","#E0DBEF").css("cursor","pointer");
        $(this).next().css("background-color","#E0DBEF");
    },function(){
        $("#chatHome tr").css("background-color","#FFFFFF");
    });
    $(".chatHomeTr+").hover(function(){
        $(this).css("background-color","#E0DBEF").css("cursor","pointer");
        $(this).prev().css("background-color","#E0DBEF");
    },function(){
        $("#chatHome tr").css("background-color","#FFFFFF");
    });

    // user이름 갖고옴. ajax로 채팅 데이터 가져오기, 웹소켓 연동
    $(".chatHomeTr").click(function(){
        selectUser = $(this).children().text();
        console.log(selectUser);
    });
    $(".chatText").click(function(){
        selectUser = $(this).parent().prev().children().text();
        console.log(selectUser);
    });

    

</script>
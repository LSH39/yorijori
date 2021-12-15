<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="/resources/css/chat/Chat.css" rel="stylesheet" type="text/css">
<link href="/resources/css/chat/ChatAdmin.css" rel="stylesheet" type="text/css">

<!-- adminHome -->
<div class="chatFrm shadow" id="chatFrmAdminHome">
    <div class="chatTop"><p>요리조리 1:1 문의 목록</p></div>
    <div class="chatMain">
        <table id="chatAdminHomeTbl">
            <colgroup>
                <col style="width:80%"/>
                <col style="width:20%" />
            </colgroup>
            <!-- ajax로 추가 -->
        </table>

    </div>
    <div class="chatBottom">
        <br>
    </div>
</div>

<!-- admin -->
<div class="chatFrm shadow" id="chatFrmAdmin">
    <div class="chatTop"><p>요리조리 1:1 문의</p></div>
    <div class="chatMain">
        <table id="chatAdminTbl">
            <!-- ajax로 추가 -->
        </table>
    </div>
    <div class="chatBottom">
        <textarea id="chatText"></textarea>
        <button id="chatEnter"></button>
    </div>
</div>

<script>
	var sessionMemberNo = ${sessionScope.m.memberNo};
    $(function(){
        $("#chatFrmAdminHome").css("display","none").prop("on",false);
        $("#chatFrmAdmin").css("display","none").prop("on",false);
    });

    $("#chatAdmin").click(function(){
    	//$("#chatFrmAdmin").css("display","none").prop("on",false);
        //$("#chatAdminTbl").children().remove();
        if($("#chatFrmAdminHome").prop("on") == false){
            $("#chatFrmAdminHome").css("display","block").prop("on",true);
            $.ajax({
                type: "post",
                url: "/chatAdminHomeFrm.do",
                success: function (data) {
                    if(data != null){
                    	var appendMsg = "";
                    	appendMsg += "<tbody>";
                    	for(var i=0; i<data.length;i++){
	                    	var chatList = data;
	                    	var chatSenderNickname = chatList[i].memberNickname;
	                    	var chatContent = chatList[i].chatContent;
	                    	var chatDate = chatList[i].strDate;
	                    	
	                    	appendMsg += "<tr class='chatHomeTr'><td colspan='2' class='chatId'>"+chatSenderNickname+"</td></tr>";
	                    	appendMsg += "<tr><td class='chatText'><div>"+chatContent+"</div></td><td><span>"+chatDate+"</span></td></tr>";
                    	}
                    	appendMsg += "</tbody>";
						$("#chatAdminHomeTbl").append(appendMsg);
                	}else{
                		alert("로그인 후 이용가능합니다.");
                		location.href="/loginFrm.do";
                	}
            	}
	        });
        }else{
        	$("#chatFrmAdminHome").css("display","none").prop("on",false);
            $("#chatAdminHomeTbl").children().remove();
            $("#chatFrmAdmin").css("display","none").prop("on",false);
            $("#chatAdminTbl").children().remove();
        }
    });
	
    // ajax로 불러온 새로운 데이터에 function을 적용하려면, $(document).on() 사용
    $(document).on("mouseenter",".chatHomeTr",function(){
    	$(this).css("background-color","#E0DBEF").css("cursor","pointer");
        $(this).next().css("background-color","#E0DBEF");
    }).on("mouseleave",".chatHomeTr",function(){
    	$("#chatAdminHomeTbl tr").css("background-color","#FFFFFF");
    }).on("mouseenter",".chatHomeTr+",function(){
    	$(this).css("background-color","#E0DBEF").css("cursor","pointer");
        $(this).prev().css("background-color","#E0DBEF");
    }).on("mouseleave",".chatHomeTr+",function(){
    	$("#chatAdminHomeTbl tr").css("background-color","#FFFFFF");
    });
	
 	// user이름 갖고옴. ajax로 채팅 데이터 가져오기, 웹소켓 연동
    $(document).on("click",".chatHomeTr",function(){
    	selectUser = $(this).children().text();
    	chatAdmin(selectUser);
    }).on("click",".chatHomeTr+",function(){
    	selectUser = $(this).prev().children().text();
    	chatAdmin(selectUser);
    });
    
 	function chatAdmin(selectUser){
        $("#chatFrmAdmin").css("display","block").prop("on",true);
        $.ajax({
               type: "post",
               url: "/chatAdminFrm.do",
               data: {selectUser:selectUser, sessionMemberNo:sessionMemberNo},
               success: function (data) {
                   if(data != null){
                   	var receiveDate;
                   	var sendDate;
                   	for(var i=0; i<data.length;i++){
                    	var chatList = data;
                    	var chatNo = chatList[i].chatNo;
                    	var chatSend = chatList[i].chatSend;
                    	var chatReceive = chatList[i].chatReceive;
                    	var chatContent = chatList[i].chatContent;
                    	var chatDate = chatList[i].strDate;
                    	var chatSendMemberNickname = chatList[i].memberNickname;
                    	var appendMsg = "";
                    	if(chatReceive == sessionMemberNo){
                    		if(chatDate == receiveDate){
                    			appendMsg += "<tr><td class='receiveText'><div>"+chatContent+"</div></td></tr>";
                    		}else{
	                    		appendMsg += "<tr><th class='receive'><p class='userId'>"+chatSendMemberNickname+"</p><span>10:20</span></th></tr>";
		    					appendMsg += "<tr><td class='receiveText'><div>"+chatContent+"</div></td></tr>";		                    			
                    		}
                    		receiveDate = chatDate;
                    	}else{
                    		if(chatDate == sendDate){
                    			appendMsg += "<tr><td class='sendText'><div>"+chatContent+"</div></td></tr>";
                    		}else{
	                    		appendMsg += "<tr><th class='send'><div><span>"+chatDate+"</span></div></th></tr>";
								appendMsg += "<tr><td class='sendText'><div>"+chatContent+"</div></td></tr>";		                    			
                    		}
                    		sendDate = chatDate;
                    	}
						$("#chatAdminTbl").append(appendMsg);
                   	}
                   	$(".chatMain").scrollTop($(".chatMain")[0].scrollHeight);  // div scroll bottom으로
               	}else{
               		alert("로그인 후 이용가능합니다.");
               		location.href="/loginFrm.do";
               	}
           	}
        });
	    
 	}
 	
 	/*
    $("#chatAdmin").click(function(){
        if($("#chatFrmAdmin").prop("on") == false){
            $("#chatFrmAdmin").css("display","block").prop("on",true);
        }else{
            $("#chatFrmAdmin").css("display","none").prop("on",false);
        }

    });

    $("#chatEnter").click(function(){
        var sendMsg = $("#chatText").val();
        console.log(sendMsg);
    });
	*/ 

</script>
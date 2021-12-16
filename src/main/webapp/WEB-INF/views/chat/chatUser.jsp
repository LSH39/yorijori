<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="/resources/css/chat/Chat.css" rel="stylesheet" type="text/css">

    <div class="chatFrm shadow" id="chatFrmUser">
        <div class="chatTop"><p>요리조리 1:1 문의</p></div>
        <div class="chatMain">
            <table id="chatUserTbl">
				<!-- ajax로 추가 -->
            </table>
            <button id="qnaBtn">자주묻는질문</button>
            <div id="blank"></div>
        </div>
        <div class="chatBottom">
            <textarea id="chatText"></textarea>
            <button id="chatEnter"></button>
        </div>
    </div>
    
	<script>
		var sessionMemberNo = ${sessionScope.m.memberNo};
		$(function(){
		    $("#chatFrmUser").css("display","none").prop("on",false);
		    
		});
		
		$("#chatUser").click(function(){
		    if($("#chatFrmUser").prop("on") == false){
		        $("#chatFrmUser").css("display","block").prop("on",true);
		        $.ajax({
	                type: "post",
	                url: "/chatUserFrm.do",
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
		                    	var appendMsg = "";
		                    	if(chatReceive == sessionMemberNo){
		                    		if(chatDate == receiveDate){
		                    			appendMsg += "<tr><td class='receiveText'><div>"+chatContent+"</div></td></tr>";
		                    		}else{
			                    		appendMsg += "<tr><th class='receive'><div><img src='/resources/img/about/logo_header.png'><span>"+chatDate+"</span></div></th></tr>";
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
								$("#chatUserTbl").append(appendMsg);
	                    	}
	                    	$(".chatMain").scrollTop($(".chatMain")[0].scrollHeight);  // div scroll bottom으로
	                	}else{
	                		alert("로그인 후 이용가능합니다.");
	                		location.href="/loginFrm.do";
	                	}
	            	}
		        });
		    }else{
		        $("#chatFrmUser").css("display","none").prop("on",false);
		        $("#chatUserTbl").children().remove();
		    }
		});
		
		$("#chatEnter").click(function(){
		    var sendMsg = $("#chatText").val();
		    console.log(sendMsg);
		    // sender : ${sessionScope.m.memberNo}
		    // receiver : 86 // 관리자 번호
		    
		});
		
		$("#qnaBtn").click(function(){
		// chatbot 기본list 출력
		// keyward : start1, start2
		});
	
	
	</script>

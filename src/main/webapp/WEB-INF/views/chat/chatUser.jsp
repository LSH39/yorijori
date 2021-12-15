<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="/resources/css/chat/Chat.css" rel="stylesheet" type="text/css">

<a class="chat" id="chatUser">1:1문의(유저)</a>
       <a class="chat" id="chatAdmin">1:1문의(관리자)</a>


       <div class="chatFrm shadow" id="chatFrmUser">
           <div class="chatTop"><p>요리조리 1:1 문의</p></div>
           <div class="chatMain">
               <table>
                   <tr><th class="receive"><div><img src="/resources/img/about/logo_header.png"><span>10:20</span></div></th></tr>
                   <tr><td class="receiveText"><div>안녕하세요. 요리조리입니다. <br>무엇을 도와드릴까요</div></td></tr>
                   <tr><td class="receiveText"><div>안녕하세요. 요리조리입니다. <br>무엇을 도와드릴까요</div></td></tr>
                   <tr><th class="send"><div><span>10:22</span></div></th></tr>
                   <tr><td class="sendText"><div>문의사항이 있습니다.</div></td></tr>
                   <tr><td class="sendText"><div>문의있다구요!!!</div></td></tr>
                   <tr><th class="receive"><div><img src="/resources/img/about/logo_header.png"><span>10:20</span></div></th></tr>
                   <tr><td class="receiveText"><div>안녕하세요. 요리조리입니다. <br>무엇을 도와드릴까요<br>자주묻는질문<br>1. 포인트 적립문의<br>2. 구독권 가격 문의<br>3. 경연대회 문의<br>4. 해외배송문의</div></td></tr>
               </table>
           </div>
           <div class="chatBottom">
               <textarea id="chatText"></textarea>
               <button id="chatEnter"></button>
           </div>
       </div>
       
       <script>
       $(function(){
           $("#chatFrmUser").css("display","none").prop("on",false);
       });

       $("#chatUser").click(function(){
           if($("#chatFrmUser").prop("on") == false){
               $("#chatFrmUser").css("display","block").prop("on",true);
           }else{
               $("#chatFrmUser").css("display","none").prop("on",false);
           }
       });

       $("#chatEnter").click(function(){
           var sendMsg = $("#chatText").val();
           console.log(sendMsg);
       });

   </script>

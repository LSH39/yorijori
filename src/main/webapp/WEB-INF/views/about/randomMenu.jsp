<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RandomMenu</title>
<link href="/resources/css/member/LoginCommon.css" rel="stylesheet" type="text/css">
<link href="/resources/css/about/RandomMenu.css" rel="stylesheet" type="text/css">
<link href="/resources/css/about/RandomWheel.css" rel="stylesheet" type="text/css">
<script src="/resources/js/about/Winwheel.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/gsap/latest/TweenMax.min.js"></script>
</head>
<body>
	<%@include file = "/WEB-INF/views/common/header.jsp" %>
	
	 <div class="container" id="container">
	    <p class="top_txt">랜덤 메뉴 추천</p>
	    <div class="wrap">
	        <div class="content">
	            <div class="top">
	                <select name="food_category">
	                    <option value="전체" selected>전체</option>
	                    <option value="구이류">구이류</option>
	                    <option value="국 및 탕류">국 및 탕류</option>
	                    <option value="면 및 만두류">면 및 만두류</option>
	                    <option value="밥류">밥류</option>
	                    <option value="볶음류">볶음류</option>
	                    <option value="빵류">빵류</option>
	                    <option value="조림류">조림류</option>
	                    <option value="찌개 및 전골류">찌개 및 전골류</option>
	                    <option value="찜류">찜류</option>
	                    <option value="튀김류">튀김류</option>
	                    <option value="기타">기타</option>
	                </select>
	                <button id="cate_select" class="purple_btn">추천 받기</button>
	            </div>
	            <div class="center">
	            	<p id="p_text">추천 받기 클릭 ▲</p>
	            	<!-- ajax로 추가 -->
	            </div>
	        </div>
			<hr>
			<div class="bottom">
	            <table id="wheelTbl" style="border:0">
	                <tr>
	                    <td width="438" height="582" class="the_wheel" text-align="center" valign="center">
	                        <canvas id="canvas" width="434" height="434">
	                            <p style="color: white;" text-align="center">Sorry, your browser doesn't support canvas. Please try another.</p>
	                        </canvas>
	                    </td>
	                    <td>
	                        <div class="power_controls" id="power_controls">
	                            <span class="less"></span><span id="num"></span><span class="more"></span><br><br>
	                            <button id="spin_button" class="purple_btn" alt="Spin" onClick="startSpin();">START</button><br>
	                            <button id="reset_button" class="gray_btn" onClick="resetWheel(); return false;">Play Again</button>
	                        </div>
	                    </td>
	                    <td>
	                        <input type="text" class="textInput input_txt" maxlength="7" value="01"><br>
	                        <input type="text" class="textInput input_txt" maxlength="7" value="02"><br>
	                        <input type="text" class="textInput input_txt" maxlength="7" value="03"><br>
	                        <input type="text" class="textInput input_txt" maxlength="7" value="04"><br>
	                        <input type="text" class="textInput input_txt" maxlength="7" value="05"><br>
	                        <input type="text" class="textInput input_txt" maxlength="7" value="06"><br>
	                        <input type="text" class="textInput input_txt" maxlength="7" value="07"><br>
	                        <input type="text" class="textInput input_txt" maxlength="7" value="08">
	                    </td>
	                </tr>
	            </table>
	
	            <!-- modal -->
	            <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	                <div class="modal-dialog modal-dialog-centered" role="document">
	                    <div class="modal-content">
	                        <div class="modal-body" id="modal-body">
	                            <p id="modal_text"></p>
	                        </div>
	                        <div class="modal-footer">
	                            <button type="button" class="btn btn-secondary" data-dismiss="modal" id="close_btn">닫기</button>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
			
	    </div>
	</div>
	
	<script>
	var theWheel;
    let wheelPower    = 0;
    let wheelSpinning = false;
    var text01; var text02; var text03; var text04; var text05; var text06; var text07; var text08;
    var number;
    $(function(){
        text01="01"; text02="02"; text03="03"; text04="04";
        text05="05"; text06="06"; text07="07"; text08="08";
        number = 6;
        $("#num").text(number);
        for(var i=0; i<8-number; i++){
            $(".textInput").eq(number+i).css("display","none");
        }
        wheelDraw();
    });
    
	$("#cate_select").click(function(){
		var food_category = $("[name='food_category']").val();
		$(".center").children().remove();
		$(".center").append("<div class='spinner-border m-5' role='status'></div>");
		$.ajax({
	        type: "post",
	        url: "/randomMenu.do",
	        data: {foodCategory:food_category},
	        success: function (data) {
	        	$(".center").children().remove();
	        	var appendStr = "";
	        	for(var i=0; i<data.length; i++){
	        		console.log(data[i].imgSrc);
	        		appendStr += "<div class='food_list'>";
	        		appendStr += "<img class='food_img' src='"+data[i].imgSrc+"'></img>";
	        		appendStr += "<p class='food_name'>"+data[i].foodName+"</p>";
	        		appendStr += "</div>";
	        	}
	        	$(".center").append(appendStr);
	        	var appendComment = "<p id='comment'>이미지 출처 : GOOGLE</p>";
	        	$(".center").append(appendComment);
	        	
	        	text01=data[0].foodName; text02=data[1].foodName; text03=data[2].foodName; text04=data[3].foodName;
	        	for(var j=0; j<4; j++){
	        		$(".textInput").eq(j).val(data[j].foodName);
	        	}
	        	wheelDraw();
	        }
	    });
	});
	
	function wheelDraw(){
        theWheel = new Winwheel({
            'numSegments'  : number,
            'outerRadius'  : 212,
            'textFontSize' : 28,
            'segments'     :
            [   
                {'fillStyle' : '#F79D96', 'text' : text01},
                {'fillStyle' : '#FAD44C', 'text' : text02},
                {'fillStyle' : '#EBA448', 'text' : text03},
                {'fillStyle' : '#B4DA67', 'text' : text04},
                {'fillStyle' : '#A0C3E9', 'text' : text05},
                {'fillStyle' : '#5C7B9C', 'text' : text06},
                {'fillStyle' : '#BFA0D4', 'text' : text07},
                {'fillStyle' : '#9C867B', 'text' : text08},
            ],
            'animation' :
            {
                'type'     : 'spinToStop',
                'duration' : 5,
                'spins'    : 8,
                'callbackFinished' : alertPrize
            }
        });
    }

    $(".textInput").on("keyup change", function(){
        text01 = $(".textInput").eq(0).val();
        text02 = $(".textInput").eq(1).val();
        text03 = $(".textInput").eq(2).val();
        text04 = $(".textInput").eq(3).val();
        text05 = $(".textInput").eq(4).val();
        text06 = $(".textInput").eq(5).val();
        text07 = $(".textInput").eq(6).val();
        text08 = $(".textInput").eq(7).val();
        wheelDraw();
    });

    function startSpin(){
        wheelPower = 2;
        if (wheelSpinning == false) {
            theWheel.animation.spins = 8;
            theWheel.startAnimation();
            wheelSpinning = true;
        }
    }

    function resetWheel(){
        theWheel.stopAnimation(false);
        theWheel.rotationAngle = 0;
        theWheel.draw();
        wheelSpinning = false;
    }
    function alertPrize(indicatedSegment){
        $("#modal_text").text("Result : "+indicatedSegment.text);
        $('#exampleModalCenter').modal({backdrop: 'static', keyboard: false}).modal('show');
    }
    $("#close_btn").click(function(){
        $('#exampleModalCenter').modal('hide');
    });

    $(".less").click(function(){
        if(number==2){
            return;
        }else if(number>2){
            number -= 1;
            $("#num").text(number);
            $(".textInput").eq(number).css("display","none");
            wheelDraw();
        }
    });

    $(".more").click(function(){
        if(number==8){
            return;
        }else if(number<8){
            number += 1;
            $("#num").text(number);
            $(".textInput").eq(number).css("display","block");
            wheelDraw();
        }
    });
	
	</script>
	
	<%@include file = "/WEB-INF/views/common/footer.jsp" %>
</body>
</html>
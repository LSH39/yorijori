<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
var selectTotal=0;
var selectbox = $("input[type='checkbox']");
$(function(){
    selectbox.eq(0).prop("checked", true);
    checkAll();
    countPrice();
    totalPrice();
});
function checkAll(){
    if(selectbox.eq(0).is(":checked") == true){
        for(var i=0; i<selectbox.length; i++){
            selectbox.eq(i).prop("checked", true);
            $("#select").text(selectbox.length-1);
        }
    }else{
        for(var i=0; i<selectbox.length; i++){
            selectbox.eq(i).prop("checked", false);
            $("#select").text("0");
        }
    }
}
// 상품별 금액 total
function countPrice(){
    for(var i=0; i<selectbox.length;i++){
        var price = $(".infoTd").eq(i).children().next().next().children().text();
        var count = $(".count").eq(i).text();
        var total = Number(price)*Number(count);
        $(".infoTd").eq(i).next().next().children().text(total);
    }
}
// checkbox
$(".check").click(function(){
    // css
    var selectCss = true;
    for(var i=1; i<selectbox.length; i++){
        selectCss = selectCss && selectbox.eq(i).prop("checked");
        if(selectCss){
            selectbox.eq(0).prop("checked", true);
        }else{
            selectbox.eq(0).prop("checked", false);
        }
    }
    totalPrice();
});
// total
function totalPrice(){
    selectTotal = 0;
    var selectCount = 0;
    for(var i=1; i<selectbox.length; i++){
        if(selectbox.eq(i).is(":checked") == true){
            var price = selectbox.eq(i).parent().parent().next().next().next().next().children().text();
            selectTotal += Number(price);
            selectCount += 1;
        }
    }
    $("#select").text(selectCount);
    $("#selectTotal").text(selectTotal);
    $("#total").text(selectTotal);
}
// less&more
$(".less").click(function(){
    var amount = Number($(this).next().text());
    if(amount!=1){
        amount -= 1;
        $(this).next().text(amount);
    }
    var reTotal = Number($(this).parent().prev().children().next().next().children().text());
    $(this).parent().next().children().text(reTotal*amount);
    totalPrice();
});
$(".more").click(function(){
    var amount = Number($(this).prev().text());
    if(amount!=10){
        amount += 1;
        $(this).prev().text(amount);
    }
    var reTotal = Number($(this).parent().prev().children().next().next().children().text());
    $(this).parent().next().children().text(reTotal*amount);
    totalPrice();
});
// 변경
$(".changeCart").click(function(){
    var cartNo = $(this).next().text();
    var reCount = $(this).prev().prev().text();
    var reTotal = $(this).parent().next().children().text();
    $.ajax({
        type: "post",
        url: "/changeCart.do",
        data: {cartNo:cartNo, productAmount:reCount, productPrice:reTotal},
        success: function (data) {
        	if(data == "1"){
        		location.reload();
        	}else{
            	alert("error");
            }
        }
    });
});
// 삭제
$("#deleteCart").click(function(){
    var arr = [];
    for(var i=1; i<selectbox.length; i++){
        if(selectbox.eq(i).is(":checked") == true){
            var cartNo = selectbox.eq(i).parent().next().text();
            arr.push(Number(cartNo));
        }
    }
    if(arr.length != 0){
	    $.ajax({
	        type: "post",
	        url: "/deleteCart.do",
	        data: {arr:arr},
	        traditional : true,  // 배열값 넘기려면 사용
	        success: function (data) {
	        	if(data == "1"){
	        		location.reload();
	        	}else{
	            	alert("error");
	            }
	        }
	    });
    }else{
    	alert("선택된 상품이 없습니다.");
    }
});
// 결제
$("#payBtn").click(function(){
    var arr = [];
    for(var i=1; i<selectbox.length; i++){
        if(selectbox.eq(i).is(":checked") == true){
        	var cartNo = selectbox.eq(i).parent().next().text();
            arr.push(cartNo);
        }else{
        	$("#checkA").prop("disabled", true);
        	selectbox.eq(i).prop("disabled", true);
        }
    }
    if(arr.length != 0){
    	$("#paymentFrm").submit();
    }else{
    	alert("선택된 상품이 없습니다.");
    	$("#checkA").prop("disabled", false);
    	for(var i=1; i<selectbox.length; i++){
            selectbox.eq(i).prop("disabled", false);
        }
    }
});
</script>
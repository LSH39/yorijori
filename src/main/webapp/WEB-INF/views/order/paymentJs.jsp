<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
var orderPrice; var couponUse; var pointUse; var totalPrice;
var f;
$(function(){
    $("#memberAddr").click();
    $("#couponPrice").text("0");
    $("#usePoint").val("0");
    orderPrice=0; couponUse=0; pointUse=0; totalPrice=0;
    for(var i=0; i<$(".product-table-container").length; i++){
        orderPrice += Number($(".product-table-container").eq(i).children().next().next().next().children().text());
    }
    $("#orderPrice").text(orderPrice);
    $("#couponUse").text(couponUse);
    $("#pointUse").text(pointUse);
    $("#totalPrice").text(orderPrice);
    totalChange();
});
// addr
$("#memberAddr").click(function(){
    $("[name='orderPostcode']").val("${m.postcode}");
    $("[name='orderAddrRoad']").val("${m.addressRoad}");
    $("[name='orderAddrDetail']").val("${m.addressDetail}").prop("readonly",true);
});
$("#newAddr").click(function(){
    $("#orderAddrDetail").prop("readonly",true);
    new daum.Postcode({
        oncomplete: function(data) {
            $("[name='orderPostcode']").val(data.zonecode);
            $("[name='orderAddrRoad']").val(data.roadAddress);
            $("[name='orderAddrDetail']").val("").prop("readonly",false).focus();
        }
    }).open();
});
// coupon
$("[name='couponList']").change(function(){
    $("#usePoint").val("0").change();
    var selectVal = $(this).val();  // 쿠폰번호
    var couponDiscount="";
    couponUse = 0;
    if(selectVal == "no"){
        $("#couponPrice").text("0");
        $("#couponUse").text("0");
        pointZero();
    }else{
    	<c:forEach items="${couponList }" var="coupon" varStatus="i">
    		var couponListNo = "${coupon.couponListNo}";
    		if(couponListNo == selectVal){
    			couponDiscount = "${coupon.couponDiscount}";
    		}
    	</c:forEach>
        var dcCode = couponDiscount.slice(-1);
        orderPrice=0;
        for(var i=0; i<$(".product-table-container").length; i++){
            orderPrice += Number($(".product-table-container").eq(i).children().next().next().next().children().text());
        }
        if(dcCode == "%"){
            var dcPrice = couponDiscount.slice(0,-1);
            couponUse = orderPrice*(dcPrice*0.01);
        }else{
            var dcPrice = couponDiscount;
            couponUse = dcPrice;
        }
        $("#couponPrice").text(couponUse);
        $("#couponUse").text(couponUse);
    }
    totalChange();
});
$("#usePoint").change(function(){
    var usePoint = $(this).val();
    var pointPrice = $("#pointPrice").text();
    var uPointNum = Number(usePoint);
    var pPriceNum = Number(pointPrice);
    pointUse = 0;
    
    if(usePoint!="0"){
    	if(/^[0-9]+[0]{2}$/.test(uPointNum) == true){
    		if(uPointNum>0 && uPointNum <= pPriceNum && uPointNum <= ($("#totalPrice").text()-100)){
    			$("#pointUse").text(uPointNum);
    			pointUse = uPointNum;
    		}else if(uPointNum > ($("#totalPrice").text()-100)){
    			alert("최종 결제금액이 100원이상이어야 합니다. 다시 입력해주세요.");
    			pointZero();
    		}else{
    			alert("포인트를 다시 입력해주세요.");
    			pointZero();
    		}
    	}else{
    		alert("포인트는 100원단위로 사용 가능합니다.");
    		pointZero();
    	}
    }else{
    	pointZero();
    }
	totalChange();
});

function pointZero(){
	$("#usePoint").val("0");
	$("#pointUse").text("0");
	pointUse = 0;
}

function totalChange(){
    totalPrice = Number(orderPrice)-couponUse-pointUse;
    $("#totalPrice").text(totalPrice);
}

$("#submitBtn").click(function(){
	$("[name='orderPrice']").val(orderPrice);
	$("[name='orderSale']").val(Number(couponUse)+pointUse);
	$("[name='orderPayment']").val(totalPrice);
	
	var orderOption = $("[name='orderPayOption']:checked").val();  // radio 체크된 값 : checked로 가져오기
	// impUid (결제id)
	var postcode = $("[name='orderPostcode']").val();
	var d = new Date();
	var date = d.getFullYear()+""+(d.getMonth()+1)+""+d.getDate()+""+d.getHours()+""+d.getMinutes()+""+d.getSeconds();
	var impUid = postcode+"_"+date;
	$("[name='impUid']").val(impUid)
	// 결제
	if(orderOption == 1){  // import;
		IMP.init("imp73163939");  // 결제 API 사용을 위해 가맹점 식별코드 입력
		IMP.request_pay({
			merchant_uid : impUid,
			name : "YORIJORI 결제",
			amount : totalPrice,
			buyer_email : "${m.memberEmail }",
			buyer_name : "${m.memberName }",
			buyer_phone : "${m.memberPhone }",
		}, function(rsp){
				if(rsp.success){
					$("#order").submit();
				}else{
					alert("결제실패");
				}
		});		
	}else if(orderOption == 2){  // toss
		var form = $("#order").serialize();
		var clientKey = 'test_ck_D5GePWvyJnrK0W0k6q8gLzN97Eoq';
		var tossPayments = TossPayments(clientKey);
		tossPayments.requestPayment('카드', {
			  amount: totalPrice,
			  orderId: impUid,
			  orderName: 'YORIJORI 결제',
			  customerName: "${m.memberName}",
			  successUrl: "http://khdsa1.iptime.org:18080/order.do?"+form,
			  failUrl: "http://khdsa1.iptime.org:18080/tossFail.do"
		});
	}
	
});

</script>
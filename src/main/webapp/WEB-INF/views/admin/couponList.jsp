<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.allmember{
text-align: center;}

</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/admin/sidenavi.jsp" />
    <div class="container">
    
    <div class="row">
    <div class="col-md-1"></div>
    <div class="col-md-10">
    
    
        <h2>쿠폰 리스트</h2>
    
    
    <div style="background-color: #F7F7E5; ">
        <div style="padding: 15px;">
            
        <label>쿠폰검색</label>
        <select name="" id="searchtype">
            <option value="1">쿠폰번호</option>
            <option value="2">할인금액</option>
            <option value="3">마감일</option>
            
        </select>
        <input id="searchtext" type="text" >
        <button class="searchbtn1">검색</button>
        
        </div>
		
        
        </div>
        
    

    <span>조회 된 쿠폰 수</span> <span class="amount">${totalCount }</span>

    <hr>
    
   	<div>
   	
    <div style="float: left;">
        <span>선택 쿠폰을</span>
        
        <button class="deleteCoupon">삭제</button>
        
    </div>
    
    
    
    </div>
    <br><br>
    
    <div style="">
    <table class="table table-hover allmember">
    <tr>
    <th><input class="allCheck" type="checkbox"></th>
    <th style="width: 300px;">쿠폰이름</th>
    <th>상세보기</th>
    <th>할인금액</th>
    <th>남은 쿠폰 수량</th>
    <th>발급일</th>
    <th>마감일</th>
    
    </tr>
    <c:forEach items="${list }" var="c" varStatus="i">
    <tr>
    <td><input class="chkbox" type="checkbox"><input type="hidden" value="${c.couponNo }"></td>
    <td>${c.couponName }</td>
    <td><button class="showDetailBtn" value="${i.index }">상세보기</button></td>
    <td>
   	${c.couponDiscount }
    
    </td>
    <td><c:choose>
    <c:when test="${c.couponAmount eq 2147483645 }">
   	무제한
    </c:when>
    <c:otherwise>
    ${c.couponAmount }
    </c:otherwise>
    </c:choose></td>
    <td>
    ${c.couponStart }
    </td>
    <td>${c.couponEnd }</td>
    </tr>
    <tr class="showDetail${i.index } showDetail" style=""><td colspan="7">
    <div class="row">
    <div class="col-md-3">총 발급 수량 : ${c.useCount+c.noUseCount }</div>
    <div class="col-md-3">사용 한 쿠폰 : ${c.useCount }</div>
    <div class="col-md-3">사용하지 않은 쿠폰 : ${c.noUseCount }</div>
    
    <div class="col-md-3"></div>
    
    </div>
    
  	
    </td></tr>
    </c:forEach>
    
    </table>
    
    </div>
    
    <div class="pagenation" style="">
    ${pageNavi }
    </div>
    
    </div>
    <div class="col-md-1"></div>
    </div>
    
    </div>
    
    <script>
    $(function(){
    	$(".showDetailBtn").click(function(){
    		var index = $(this).val();
    		
    		
    		
    		
    		
    		$(".showDetail"+index).fadeToggle();
    	});
    	
    	$(".detailbtn").click(function(){
    		$(".detail").slideToggle();
    	});
    	
    	$("input[name=searchdetail]").change(function(){
    		$(".detail1").show();
    		$(".detail2").hide();
    		$("#space").html($(this).next().html());
    		if($(this).val()==5){
    			$(".detail2").show();
        		$(".detail1").hide();	
    		}
    	});
    	$(".allCheck").click(function(){
				
    		
    		for(var i =0; i<$(".amount").html();i++){
    			
    			
    			if($(".chkbox").eq(i).is(":checked")==false){
    				for(var j = 0; j<$(".amount").html();j++){
    					$(".chkbox").eq(j).prop("checked",false);
    					
    				}
    				break;
    			}
    			break;
    		}
    		
    		
    		$(".chkbox").click();
    		
    		
    	});
    	$(".chkbox").click(function(){
    		var a=false;
    		if($(".allCheck").is(":checked")){
    			$(".allCheck").prop("checked",false);
    		}
    		for(var i =0; i<$(".amount").html();i++){
    			
    			a= $(".chkbox").eq(i).is(":checked")
    			if(a==false){
    				break;
    			}
    		}
    		$(".allCheck").prop("checked",a);
    	});
    	$(".period").change(function(){
    		if($(this).val()==2){
    			var date = new Date();
    			var year = date.getFullYear();
    			var month = date.getMonth();
    			var start = year+"-"+month+"-00";
    			var end = year+"-"+month+"-31";
    			
    			$("#recentonemonth").html(year+"."+month+"."+"01.~"+year+"."+month+"."+"31.")
    			$(".recentmonthstart").val(start);
    			$(".recentmonthend").val(end);
    		}else{
    			$("#recentonemonth").html("");
    		}
    	});

    	$(".searchbtn1").click(function(){
    		
    		var searchType= $("#searchtype").val();
    		var detail = 1;
    		var searchText = $("#searchtext").val();
    		var align = $(".align").val();
    		$.ajax({
    			url:"permissionJoin.do?reqPage=1",
    			type:"post",
    			data : {searchType:searchType,searchText:searchText,detail:detail,align:align,memberLevel:"4"},
    			success: function(data){
    				$("body").html(data);
    				if(searchType =="memberNickname"){
    					
    					$("#ff").prop("selected",true);
    					
    				}else if(searchType=="memberPhone"){
    					$("#ff").next().prop("selected",true);
    				}else{
    					$("#ff").prev().prop("selected",true);
    				}
    				$("#searchtext").val(searchText);
    				$(".align").val(align);
    			},
    			error:function(){
    				console.log("err");
    			}
    			
    			
    		});
    	});
    	
			
			
			$(".memberLevel").change(function(){
				var memberLevel = $(".memberLevel").val();
				var align = $(".align").val();
				$.ajax({
	    			url:"permissionJoin.do?reqPage=1",
	    			type:"post",
	    			data : {memberLevel:memberLevel,align:align},
	    			success: function(data){
	    				
	    				$("body").html(data);
	    				$(".memberLevel").val(memberLevel);
	    				$(".align").val(align);
	    			},
	    			error:function(){
	    				console.log("err");
	    			}
	    			
	    			
	    		});
				
			});
			
			$(".addJori").click(function(){
				var memberNo;
				
				for(var i =0; i<$(".amount").html();i++){
					if($(".chkbox").eq(i).is(":checked")){
						if(memberNo==null){
							memberNo = $(".chkbox").eq(i).next().val();	
						}else{
							memberNo = memberNo+","+$(".chkbox").eq(i).next().val();	
						}
						
						
					}
				}
				
				
				$.ajax({
	    			url:"addJori.do",
	    			type:"post",
	    			data : {memberNo:memberNo},
	    			success: function(data){
	    				location.href="permissionJoin.do?reqPage=1";
	    				
	    			},
	    			error:function(){
	    				console.log("err");
	    				
	    			}
	    			
	    			
	    		});
				
			});
			$(".deleteCoupon").click(function(){
				var couponNo;
				
				for(var i =0; i<$(".amount").html();i++){
					if($(".chkbox").eq(i).is(":checked")){
						if(couponNo==null){
							couponNo = $(".chkbox").eq(i).next().val();	
						}else{
							couponNo = couponNo+","+$(".chkbox").eq(i).next().val();	
						}
						
						
					}
				}
				
				
				$.ajax({
	    			url:"adminDeleteCoupon.do",
	    			type:"post",
	    			data : {couponNo:couponNo},
	    			success: function(data){
	    				location.href="couponList.do?reqPage=1";
	    				
	    			},
	    			error:function(){
	    				console.log("err");
	    				
	    			}
	    			
	    			
	    		});
				
			});
    	
    	

    });
    </script>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    
</body>
</html>
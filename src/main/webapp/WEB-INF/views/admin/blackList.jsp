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
    
    <h2>블랙리스트 회원 조회</h2>
    
    
    <div style="background-color: #F7F7E5; ">
        <div style="padding: 15px;">
            
        <label>회원검색</label>
        <select name="" id="searchtype">
            <option value="memberId">아이디</option>
            <option value="memberNickname">닉네임</option>
            <option value="memberPhone">전화번호</option>
            
        </select>
        <input id="searchtext" type="text" >
        <button class="searchbtn1">검색</button>
        
        </div>
		
        <div class="detail" style="padding: 15px; display: none;">

            <input type="radio" checked value="1" id="postspace" name="searchdetail"><label for="postspace">게시글 수</label>
            <input type="radio" value="2" id="recipespace" name="searchdetail"><label for="recipespace">레시피 수</label>
            <input type="radio" value="3" id="commentspace" name="searchdetail"><label for="commentspace">댓글 수</label>
            <input type="radio" value="4" id="visitspace" name="searchdetail"><label for="visitspace">방문 수</label>
            <input type="radio" value="5" id="signdate" name="searchdetail"><label for="signdate">가입일</label>
            <hr>
            <div class="detail1">
            <select class="period">
                <option value="1">전체기간</option>
                <option value="2">최근 1개월</option>
            </select>
            <span id="recentonemonth"></span><input class="recentmonthstart" type="hidden"><input class="recentmonthend" type="hidden">
            <span>동안</span>
            <span id="space">게시글 수</span>
            <input class="searchText2" type="text" placeholder="0" style="width: 70px;">
            <span>개</span>
            <select class="moreless">
                <option value="1">이상</option>
                <option value="2">이하</option>
                
            </select>
            <span>인 회원</span>
            <button class="searchbtn2">검색</button>
            </div>
            <div class="detail2" style="display:none;">
            <input class="date1" type="date"> 부터
            <input class="date2" type="date"> 까지
            가입한 회원
            <button class="searchbtn2">검색</button>
            </div>
                
            


        </div>
        </div>
        
    

    <span>조회 된 회원 수</span> <span class="amount">${totalCount }</span>

    <hr>
    
   	<div>
   	
    <div style="float: left;">
        <span>선택 회원을</span>
        <button class="addNormal">일반회원으로 변경</button>
        <button>강제 탈퇴</button>
        <button>쪽지</button>
        <button class="showAllDetail">전체 상세 보기</button>
    </div>
    
    <div style="float: right;">
    <select class="memberLevel">
        <option value="0">전체회원</option>
        <option value="1">요리꾼</option>
        <option value="2">조리꾼</option>
    </select>
    <select class="align">
    <option value="10">10명 정렬</option>
        <option value="30">30명 정렬</option>
        <option value="50">50명 정렬</option>
        <option value="100">100명 정렬</option>
    </select>
    
    </div>
    
    </div>
    <br><br>
    
    <div style="">
    <table class="table table-hover allmember">
    <tr>
    <th><input class="allCheck" type="checkbox"></th>
    <th style="width: 300px;">별명(아이디)</th>
    <th>상세보기</th>
    <th>구분(요리꾼/조리꾼)</th>
    <th>가입일</th>
    <th>레시피 수</th>
    <th>게시글 수</th>
    
    </tr>
    <c:forEach items="${list }" var="m" varStatus="i">
    <tr>
    <td><input class="chkbox" type="checkbox"><input type="hidden" value="${m.memberNo }"></td>
    <td>${m.memberNickname }(${m.memberId })</td>
    <td><button class="showDetailBtn" value="${i.index }">상세보기</button></td>
    <td>
    <c:choose >
    <c:when test="${m.memberLevel eq 1}">
   	요리꾼
    
    </c:when>
    <c:otherwise>
    조리꾼
    </c:otherwise>
    </c:choose>
    </td>
    <td>${m.enrollDate }</td>
    <td>${m.recipeCount }</td>
    <td>${m.boardCount }</td>
    </tr>
    <tr class="showDetail${i.index } showDetail" style=""><td colspan="7">
    <div class="row">
    <div class="col-md-3">이름 : ${m.memberName }</div>
    <div class="col-md-3">전화번호 : ${m.memberPhone }</div>
    <div class="col-md-3">도로명 주소 : ${m.addressRoad }</div>
    <div class="col-md-3">상세주소 : ${m.addressDetail }</div>
    
    </div>
    <div class="row">
    <div class="col-md-3">자기소개 : ${m.profileIntro }</div>
    <div class="col-md-3">포인트 : ${m.memberPoint }</div>
    <div class="col-md-3">사유 : </div>
    <div class="col-md-3"><button class="pointReset">포인트 초기화</button><input type="hidden" value="${m.memberNo }"></div>
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
    			url:"blackList.do?reqPage=1",
    			type:"post",
    			data : {searchType:searchType,searchText:searchText,detail:detail,align:align},
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
    	
			$(".searchbtn2").click(function(){
    		var detail = 2;
    		var searchDetail= $("input[name=searchdetail]").val();
    		var period = $(".period").val();
    		var start = $(".recentmonthstart").val();
    		var end = $(".recentmonthend").val();
    		var moreless = $(".moreless").val();
    		var searchText2 = $(".searchText2").val();
    		var joinStart = $(".date1").val();
    		var joinEnd = $(".date2").val();
    		var align = $(".align").val();
    		var memberLevel = $(".memberLevel").val();
    		$.ajax({
    			url:"allmember.do?reqPage=1",
    			type:"post",
    			data : {searchDetail:searchDetail,period:period,start:start,end:end,moreless:moreless,
    				searchText2:searchText2,joinStart:joinStart,joinEnd:joinEnd,detail:detail,align:align,memberLevel:memberLevel},
    			success: function(data){
    				console.log("1");
    				$("body").html(data);
    				$(".detail").show();
    				$("#searchText2").val(searchText2);
    				$(".align").val(align);
    				$(".memberLevel").val(memberLevel);
    			},
    			error:function(){
    				console.log("err");
    			}
    			
    			
    		});
    	});
			$(".align").change(function(){
				var align = $(".align").val();
				$.ajax({
	    			url:"blackList.do?reqPage=1",
	    			type:"post",
	    			data : {align:align},
	    			success: function(data){
	    				console.log("1");
	    				$("body").html(data);
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
	    			url:"blackList.do?reqPage=1",
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
			
			$(".addNormal").click(function(){
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
	    			url:"addNormalMember.do",
	    			type:"post",
	    			data : {memberNo:memberNo},
	    			success: function(data){
	    				location.href="blackList.do?reqPage=1";
	    				
	    			},
	    			error:function(){
	    				console.log("err");
	    				
	    			}
	    			
	    			
	    		});
				
			});
			$(".deleteMember").click(function(){
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
	    			url:"adminDeleteMember.do",
	    			type:"post",
	    			data : {memberNo:memberNo},
	    			success: function(data){
	    				location.href="blackList.do?reqPage=1";
	    				
	    			},
	    			error:function(){
	    				console.log("err");
	    				
	    			}
	    			
	    			
	    		});
				
			});
			
			$(".pointReset").click(function(){
				var memberNo = $(this).next().val();
				$.ajax({
	    			url:"pointReset.do",
	    			type:"post",
	    			data : {memberNo:memberNo},
	    			success: function(data){
	    				location.href="blackList.do?reqPage=1";
	    				
	    			},
	    			error:function(){
	    				console.log("err");
	    				
	    			}
	    			
	    			
	    		});
			});
    	
    	

    });
    $(".showAllDetail").click(function(){
    	$(".showDetailBtn").click();
    });
    
    
    </script>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    
</body>
</html>
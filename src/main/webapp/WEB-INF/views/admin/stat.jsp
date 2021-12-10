<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<style>
.angle{
cursor: pointer;
 }
 .disabled{
 cursor: auto;
 color:gray;
 }
 .start>div:nth-child(2),.start>div:nth-child(3),.start>div:nth-child(4) {
 border-left : 1px solid darkcyan;
 border-top : 1px solid darkcyan;
 border-bottom : 1px solid darkcyan;
 padding-left: 50px;
 padding-top: 30px;
 padding-bottom:30px;
 }
 .start>div:nth-child(4){
border-right: 1px solid darkcyan;
 }
 .start span{
 font-size: xx-large;
 }
 
 path {
    stroke:#9F90CF;
    
    fill:none;
}
circle{
fill:#9F90CF;
}
rect{
fill:none;}
</style>
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);
      var totoday = new Date();
      var toyear = totoday.getFullYear();
      var tomonth = totoday.getMonth();
      var todate = totoday.getDate();
      var prev1 = new Date(toyear,tomonth,todate);
  	  var prev2 =	new Date(toyear,tomonth,todate);
  	  var prev3=new Date(toyear,tomonth,todate);
  	  var prev4 =new Date(toyear,tomonth,todate);
  	  var prev5=new Date(toyear,tomonth,todate);
  	  var prev6=new Date(toyear,tomonth,todate);
  	prev1.setDate(prev1.getDate()-1);
  	prev2.setDate(prev1.getDate()-2);
  	prev3.setDate(prev1.getDate()-3);
  	prev4.setDate(prev1.getDate()-4);
  	prev5.setDate(prev1.getDate()-5);
  	prev6.setDate(prev1.getDate()-6);
  	
  	
  	var prev1month = prev1.getMonth()+1;
  	if(prev1month==0){
  		prev1month =12;
  	}
  	var prev2month = prev2.getMonth()+1;
  	if(prev2month==0){
  		prev2month =12;
  	}
  	var prev3month = prev3.getMonth()+1;
  	if(prev3month==0){
  		prev3month =12;
  	}
  	var prev4month = prev4.getMonth()+1;
  	if(prev4month==0){
  		prev4month =12;
  	}
  	var prev5month = prev5.getMonth()+1;
  	if(prev5month==0){
  		prev5month =12;
  	}
  	var prev6month = prev6.getMonth()+1;
  	if(prev6month==0){
  		prev6month =12;
  	}
  	
  	
  	
  	
  	
  	var prev1day = prev1.getFullYear()+"-"+prev1month+"-"+prev1.getDate();
  	var prev2day = prev2.getFullYear()+"-"+prev2month+"-"+prev2.getDate();
  	var prev3day = prev3.getFullYear()+"-"+prev3month+"-"+prev3.getDate();
  	var prev4day = prev4.getFullYear()+"-"+prev4month+"-"+prev4.getDate();
  	var prev5day = prev5.getFullYear()+"-"+prev5month+"-"+prev5.getDate();
  	var prev6day = prev6.getFullYear()+"-"+prev6month+"-"+prev6.getDate();
  	
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['날짜',  '게시글'],
          [prev6day,       ${p.prev7}],
          [prev5day,       ${p.prev6}],
          [prev4day,       ${p.prev5}],
          [prev3day,       ${p.prev4}],
          [prev3day,       ${p.prev3}],
          [prev2day,       ${p.prev2}],
          [prev1day,       ${p.prev1}],
          [today2,       ${p.today}]
        ]);

        var options = {
          
          hAxis: {title: '게시글 수',  titleTextStyle: {color: '#9F90CF'}},
          vAxis: {minValue: 0}
          
          
        };

        var chart = new google.visualization.AreaChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    </script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/admin/sidenavi.jsp" />
	<div class="container">
	
	<div class="row">
	
	<div class="col-md-2"></div>
	<div class="col-md-8"><h2>일간 현황</h2></div>
	<div class="col-md-2"></div>
	</div>
	<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-8" style="text-align: center;"> <i  class="xi-angle-left angle"></i> <label for="date" id="dateTxt"></label> <i style="cursor: pointer;" class="xi-calendar"></i> <input id="date" style="width: 0; height: 0; border: none; padding: 0;" type="date"><i class="xi-angle-right angle"></i> </div>
	<div class="col-md-2"></div>
	</div>
	
	<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-8"><hr></div>
	<div class="col-md-2"></div>
	</div>
	<div class="row start">
	<div class="col-md-2"></div>
	<div class="col-md-3" >오늘 작성 게시글 수<br>
	<span id="todayBoard">${freeCount }</span>
	</div>
	<div class="col-md-2" >오늘 가입 회원 수
	<br>
	<span id="todayJoin">${joinCount }</span>
	</div>
	<div class="col-md-3" >오늘 작성 레시피 수
	<br>
	<span id="todayRecipe">${recipeCount }</span>
	</div>
	<div class="col-md-2"></div>
	</div>
	<br>
	<div class="row">
	<div class="col-md-1"></div>
	<div class="col-md-10"><div id="chart_div" style="width: 100%; height: 500px;"></div></div>
	
	<div class="col-md-1"></div>
	</div>
	
	
	</div>
	<script type="text/javascript">
	var date = new Date();
	var day = date.getDate();
	if(day<10){
		day = "0"+day;
	}
	var month = date.getMonth()+1;
	var year = date.getFullYear();
	
	
	var today = year+"."+month+"."+day+".";
	
	var today1 = year+"-"+month+"-"+day;
	var today2= today1;
	$("#dateTxt").html(today1);
	$("#date").prop("max",today1);
	$("#date").val(today1);
	$("#date").change(function(){
		
		$("#dateTxt").html($(this).val());
		today2 =$(this).val();
	});
	$(".xi-calendar").click(function(){
		$("#date").click();
		$("#date").focus();
	});
	$(".xi-angle-left").click(function(){
		var d = $("#date").val();
		
		var curryear = d.substr(0,4);
		var currmonth =d.substr(5,2);
		var currday = d.substr(8,2);
		
		
		if(currday ==1){
			if(currmonth==1){
				curryear = curryear-1;
				console.log(curryear);
				currmonth = 12;
				currday = 31;
			}else{
				currmonth = currmonth-1;
				if(currmonth ==2 || currmonth==4 || currmonth==6 || currmonth==9 ||currmonth ==11){
					currday = 30;
				}else{
					currday=31;
				}
			}
			
			
		}else{
			currday = currday-1;	
		}
		
		
		
		
		
		
		
		currmonth =currmonth-1+1;
		if(currmonth<10){
			currmonth ="0"+currmonth;
		}
		if(currday<10){
			currday = "0"+currday;
		}
		var dd = curryear+"-"+currmonth+"-"+currday;
		$("#dateTxt").html(dd);
		$("#date").val(dd);
	});
	
	
	
	
	$(".xi-angle-right").click(function(){
		var d = $("#date").val();
		if(d == today1){
			
			return false;
		}
		
		var curryear = d.substr(0,4);
		var currmonth =d.substr(5,2);
		var currday = d.substr(8,2);
		
		if(currmonth ==2 || currmonth==4 || currmonth==6 || currmonth==9 ||currmonth ==11){
			if(currday ==30){
				if(currmonth==12){
					curryear = curryear-1+2;
					
					currmonth = 1;
				}else{
					currmonth = currmonth-1+2;
				}
				currday = 1;
				
			}else{
				currday= currday-1+2;
			}
			
		}else{
			if(currday ==31){
				if(currmonth==12){
					curryear = curryear-1+2;
					
					currmonth = 1;
				}else{
					currmonth = currmonth-1+2;
				}
				currday = 1;
				
			}else{
				currday=currday-1+2;
			}
			
		}
		
		
		currmonth =currmonth-1+1;
		if(currmonth<10){
			currmonth ="0"+currmonth;
		}
		if(currday<10){
			currday = "0"+currday;
		}
		var dd = curryear+"-"+currmonth+"-"+currday;
		$("#dateTxt").html(dd);
		$("#date").val(dd);
	});
	
	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
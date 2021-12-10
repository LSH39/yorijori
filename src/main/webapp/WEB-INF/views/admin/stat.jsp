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

.selected{
cursor:pointer;
text-align:center;
border: 1px solid #9f90cf;
background-color: #9f90cf;
color:#fff;
font-weight: bold;



}
.unselect{


border: 1px solid #e0d8ef;
cursor:pointer;
text-align:center;
background-color: #E0D8EF;
color:#9f90cf;

}
svg{


}

</style>
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

  	
  	
  	
  	
  	
  	
  	
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['날짜',  '게시글'],
          [prev7day,       ${p.prev7}],
          [prev6day,       ${p.prev6}],
          [prev5day,       ${p.prev5}],
          [prev4day,       ${p.prev4}],
          [prev3day,       ${p.prev3}],
          [prev2day,       ${p.prev2}],
          [prev1day,       ${p.prev1}],
          [today,       ${p.today}]
        ]);
        
        var data2 = google.visualization.arrayToDataTable([
            ['날짜',  '레시피'],
            [prev7day,       ${r.prev7}],
            [prev6day,       ${r.prev6}],
            [prev5day,       ${r.prev5}],
            [prev4day,       ${r.prev4}],
            [prev3day,       ${r.prev3}],
            [prev2day,       ${r.prev2}],
            [prev1day,       ${r.prev1}],
            [today,       ${r.today}]
          ]);
        var data3 = google.visualization.arrayToDataTable([
            ['날짜',  '회원가입'],
            [prev7day,       ${j.prev7}],
            [prev6day,       ${j.prev6}],
            [prev5day,       ${j.prev5}],
            [prev4day,       ${j.prev4}],
            [prev3day,       ${j.prev3}],
            [prev2day,       ${j.prev2}],
            [prev1day,       ${j.prev1}],
            [today,       ${j.today}]
          ]);

        var options = {
          
          
          vAxis: {minValue: 0}
          
          
        };

        var chart = new google.visualization.AreaChart(document.getElementById('freeChart'));
        var chart2 = new google.visualization.AreaChart(document.getElementById('recipeChart'));
        var chart3 = new google.visualization.AreaChart(document.getElementById('joinChart'));
        chart.draw(data, options);
        chart2.draw(data2, options);
        chart3.draw(data3, options);
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
	<div class="col-md-2"></div>
	<div  class="col-md-2 selected grBtn" >게시글</div><input type="hidden" value="1">
	<div  class="col-md-2 unselect grBtn" >레시피</div><input type="hidden" value="2">
	<div  class="col-md-2 unselect grBtn" >회원가입</div><input type="hidden" value="3">
	<div class="col-md-2" style="border-bottom: 1px solid #9f90cf;"></div>
	<div class="col-md-2"></div>
	</div>
	<br>
	<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-8"><h2 id="chartName">게시글 그래프</h2></div>
	
	<div class="col-md-2"></div>
	</div>
	
	<div class="row freeChart chart">
	<div class="col-md-1"></div>
	<div class="col-md-10">
	
	<div id="freeChart" style="width: 100%; height: 500px;"></div></div>
	
	<div class="col-md-1"></div>
	</div>
	
	<div class="row joinChart chart" style="">
	<div class="col-md-1"></div>
	<div class="col-md-10">
	
	<div id="joinChart" style=" width: 100%; height: 500px;"></div></div>
	
	<div class="col-md-1"></div>
	</div>
	
	
	
	<div class="row recipeChart chart" style="">
	<div class="col-md-1"></div>
	<div class="col-md-10">
	
	<div id="recipeChart" style="width: 100%; height: 500px;"></div></div>
	
	<div class="col-md-1"></div>
	</div>
	
	<input id="f" type="hidden" value="${today }">
	<input id="today" type="hidden" value="${day.today }">
	<input id="prev1day" type="hidden" value="${day.prev1day }">
	<input id="prev2day" type="hidden" value="${day.prev2day }">
	<input id="prev3day" type="hidden" value="${day.prev3day }">
	<input id="prev4day" type="hidden" value="${day.prev4day }">
	<input id="prev5day" type="hidden" value="${day.prev5day }">
	<input id="prev6day" type="hidden" value="${day.prev6day }">
	<input id="prev7day" type="hidden" value="${day.prev7day }">
	</div>
	
	<script type="text/javascript">
	var today = $("#today").val();
	var prev1day = $("#prev1day").val();
  	var prev2day = $("#prev2day").val();
  	var prev3day = $("#prev3day").val();
  	var prev4day = $("#prev4day").val();
  	var prev5day = $("#prev5day").val();
  	var prev6day = $("#prev6day").val();
  	var prev7day = $("#prev7day").val();
	
	var date = new Date();
	var day = date.getDate();
	if(day<10){
		day = "0"+day;
	}
	var month = date.getMonth()+1;
	var year = date.getFullYear();
	
	
	
	
	var today1 = year+"-"+month+"-"+day;
	var today2= today1;
	
	$("#date").prop("max",today1);
	
		$("#date").val($("#f").val());
		$("#dateTxt").html($("#f").val());
	
	//	$("#dateTxt").html(today1);
	//	$("#date").val(today1);
	
	
	$("#date").change(function(){
		today2 =$(this).val();
		
		
		$.ajax({
			url:"stat.do",
			type:"post",
			data : {today:today2},
			success: function(data){
				
				$("body").html(data);
				today1 = today2;
				
			
			},
			error:function(){
				console.log("err");
			}
			
			
		});
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

		today2 =$("#date").val();
				
				
				$.ajax({
					url:"stat.do",
					type:"post",
					data : {today:today2},
					success: function(data){
						
						$("body").html(data);
						today1 = today2;
						
					
					},
					error:function(){
						console.log("err");
					}
					
					
				});
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
		
		

		today2 =$("#date").val();
				
				console.log(today2);
				$.ajax({
					url:"stat.do",
					type:"post",
					data : {today:today2},
					success: function(data){
						$("body").html(data);
						today1 = today2;
						
						
					
					},
					error:function(){
						console.log("err");
					}
					
					
				});
	});
	
	setTimeout(() => {
		$(".recipeChart").hide();
		$(".joinChart").hide();
	}, 100);
	
	
	
	$(".grBtn").click(function(){
		$(".grBtn").addClass("unselect");
		$(this).removeClass("unselect");
		$(this).addClass("selected");
		$(".chart").hide();
		console.log($(this).next().val());
		switch($(this).next().val()){
		case "1" : $(".freeChart").show();
			break;
		case "2" : $(".recipeChart").show();
			break;
		case "3" :$(".joinChart").show();
			break;
		}
		$("#chartName").html($(this).html()+" 그래프");
		
	});
	
	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3034a6bde601c666de71198a328eaa3e&libraries=services"></script>
<script>
	$(function(){
		
		$('#v-pills-tab button').click(function(e) {
			e.preventDefault();
			$(this).tab('show');
			setInterval(function(){
				map2.relayout();
				map2.setCenter(new daum.maps.LatLng(37.612650, 126.730985));
				
				map3.relayout();
				map3.setCenter(new daum.maps.LatLng(37.503807, 126.722011));
				
				map4.relayout();
				map4.setCenter(new daum.maps.LatLng(36.793700, 127.124624));
				
				map5.relayout();
				map5.setCenter(new daum.maps.LatLng(35.158078, 129.060529));
				}, 0);  
			
			});
		
		
    	var mapContainer1 = document.getElementById('v-pills-seoul'),
        mapOption1 = {  
            center: new kakao.maps.LatLng(37.502402, 127.040696),
            level: 3
        };
    	var map1 = new kakao.maps.Map(mapContainer1, mapOption1);
    	var markerPosition1  = new kakao.maps.LatLng(37.502402, 127.040696); 
    	var marker1 = new kakao.maps.Marker({
        	position: markerPosition1
    	});
    	marker1.setMap(map1);
    	
    	
    	var mapContainer2 = document.getElementById('v-pills-kyeonggi'),
        mapOption2 = { 
            center: new kakao.maps.LatLng(37.612650, 126.730985),
            level: 3
        };
    	var map2 = new kakao.maps.Map(mapContainer2, mapOption2);
    	var markerPosition2  = new kakao.maps.LatLng(37.612650, 126.730985); 
    	var marker2 = new kakao.maps.Marker({
        	position: markerPosition2
    	});
    	marker2.setMap(map2);
    	
    	var mapContainer3 = document.getElementById('v-pills-incheon'),
        mapOption3 = { 
            center: new kakao.maps.LatLng(37.503807, 126.722011),
            level: 3
        };
    	var map3 = new kakao.maps.Map(mapContainer3, mapOption3);
    	var markerPosition3  = new kakao.maps.LatLng(37.503807, 126.722011); 
    	var marker3 = new kakao.maps.Marker({
        	position: markerPosition3
    	});
    	marker3.setMap(map3);
    	
    	var mapContainer4 = document.getElementById('v-pills-chungnam'),
        mapOption4 = { 
            center: new kakao.maps.LatLng(36.793700, 127.124624),
            level: 3
        };
    	var map4 = new kakao.maps.Map(mapContainer4, mapOption4);
    	var markerPosition4  = new kakao.maps.LatLng(36.793700, 127.124624); 
    	var marker4 = new kakao.maps.Marker({
        	position: markerPosition4
    	});
    	marker4.setMap(map4);
    	
    	var mapContainer5 = document.getElementById('v-pills-busan'),
        mapOption5 = { 
            center: new kakao.maps.LatLng(35.158078, 129.060529),
            level: 3
        };
    	var map5 = new kakao.maps.Map(mapContainer5, mapOption5);
    	var markerPosition5  = new kakao.maps.LatLng(35.158078, 129.060529); 
    	var marker5 = new kakao.maps.Marker({
        	position: markerPosition5
    	});
    	marker5.setMap(map5);
		
		});
</script>
<style>
	.store-wrap{
		min-width:1280px;
		margin: 0 auto;
		text-align:center;
		margin-top:40px;
		margin-bottom:40px;
	}
	
	#mapdiv{
		display:flex;
		justify-content: center;
	}
	.map-section{
		width:800px;
		height:500px;
	}
	

</style>
<meta charset="UTF-8">

<title>ì¤íë¼ì¸ ë§¤ì¥</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="store-wrap">
		<div>
			<img src="./resources/img/store/storeMain.jpg">
		</div>

		<h1>ì§ì  ëª©ë¡</h1>
		<div id="mapdiv">
		<!-- 
    	<div id="map" style="width:300px;height:300px;margin-top:10px;"></div>
		 -->
			<div class="d-flex align-items-start">
				<div class="nav flex-column nav-pills me-3" id="v-pills-tab" role="tablist" aria-orientation="vertical">
					<button class="nav-link active" id="v-pills-seoul-tab" data-bs-toggle="pill" data-bs-target="#v-pills-seoul" type="button" role="tab" aria-controls="v-pills-seoul" aria-selected="true">ìì¸</button>
    				<button class="nav-link" id="v-pills-kyeonggi-tab" data-bs-toggle="pill" data-bs-target="#v-pills-kyeonggi" type="button" role="tab" aria-controls="v-pills-kyeonggi" aria-selected="false">ê²½ê¸°</button>
    				<button class="nav-link" id="v-pills-incheon-tab" data-bs-toggle="pill" data-bs-target="#v-pills-incheon" type="button" role="tab" aria-controls="v-pills-incheon" aria-selected="false">ì¸ì²</button>
	    			<button class="nav-link" id="v-pills-chungnam-tab" data-bs-toggle="pill" data-bs-target="#v-pills-chungnam" type="button" role="tab" aria-controls="v-pills-chungnam" aria-selected="false">ì¶©ë¨</button>
	    			<button class="nav-link" id="v-pills-busan-tab" data-bs-toggle="pill" data-bs-target="#v-pills-busan" type="button" role="tab" aria-controls="v-pills-busan" aria-selected="false">ë¶ì°</button>
  				</div>
  				<div class="tab-content" id="v-pills-tabContent">
    				<div class="tab-pane fade show active map-section" id="v-pills-seoul" role="tabpanel" aria-labelledby="v-pills-seoul">
    				</div>
    				<div class="tab-pane fade map-section" id="v-pills-kyeonggi" role="tabpanel" aria-labelledby="v-pills-kyeonggi">
    				</div>
	    			<div class="tab-pane fade map-section" id="v-pills-incheon" role="tabpanel" aria-labelledby="v-pills-incheon">
	    			</div>
    				<div class="tab-pane fade map-section" id="v-pills-chungnam" role="tabpanel" aria-labelledby="v-pills-chungnam">
    				</div>
       				<div class="tab-pane fade map-section" id="v-pills-busan" role="tabpanel" aria-labelledby="v-pills-busan">
    				</div>
  				</div>
			</div>	
		</div>
	</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />	
</body>
</html>
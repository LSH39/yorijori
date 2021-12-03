<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<!-- 별칭 ccls -->
<meta charset="UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<title>쿠킹클래스 뷰</title>
<style>
	.left{
		width: 66.6666%;
		position:static;
		padding-right: 12px;
		padding-left: 12px;
		box-sizing: border-box;
	}
	
	.right{
		width:33.3333%;
		position: static;
		padding-right: 12px;
		padding-left: 12px;
		box-sizing: border-box;
	}
	
	.right-stick{
		display: inline-block;
		position: sticky;
		position: -webkit-sticky;
		top:100px;
		padding-right: 4px;
		padding-left: 4px;
		overflow: auto;
	}
	
	.right-stick-content{
		padding: 24px;
    	border-radius: 3px;
    	box-shadow: rgb(41 42 43 / 16%) 0px 2px 6px -2px;
    	border: 1px solid rgb(255, 255, 255);
	}
	
	.class-wrap{
		display:flex;
	}
	
	#payBtn{
		background-color:#8E44AD;
		border-color:#8E44AD;
	}
	
	#payBtn:focus{
		box-shadow: 0 0 0 0.25rem rgb(224 216 239 / 25%);
	}
	
</style>
<script>
	$(function(){
		$("#reviewWrite").click(function(){
			alert("리뷰 작성 됐다고 가정");
		});
		
		$("#payBtn").click(function(){
			let classPrice = $(".classPrice").html(); //실제 가격
			let date = new Date();
			let fullDate = date.getFullYear()+""+(date.getMonth()+1)+""+date.getDate()+""+date.getHours()+""+date.getMinutes()+""+date.getSeconds(); 
		
			IMP.init("imp42282461"); //요리조리 가맹점
			IMP.request_pay({ //결제할 떄 필요한 정보(객체)
				merchant_uid : "상품명_"+date, //거래 아이디
				name : "결제 테스트", //결제 이름 설정함
				amount : 100, //결제 금액 테스트용이니까 100원
				buyer_email : "forestwowch@gmail.com", //구매자 이메일
				buyer_name : "성승민",
				buyer_phone : "010-5104-4638", //구매자 핸드폰 번호
				buyer_addr : "인천광역시", //구매자 주소
				buyer_postcode : "99999" //구매자 우편번호
			},function(rsp){
				if(rsp.success){
					alert("결제 성공성공");
					//성공시 로직(db결제정보 insert -> 사용자 화면 처리)
					console.log("카드 승인 번호 "+rsp.apply_num);
				}else{
					alert("결제 실패실패");
					console.log(fullDate);
					//실패시 로직(장바구니에 저장 -> 사용자 화면 처리)
				}
			});
		});
	});
</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="container">
		<div>
		<h1>쿠킹클래스 뷰</h1>
			<div class="class-wrap">
				<div class="left position-static">
					<img src="./resources/img/cookingcls/classtest.jpg">
					<h5>클래스 번호는 ${ccls.classNo }</h5>
					<h5>클래스 등록한사람의 회원번호는 ${ccls.memberNo }</h5>			
					<h5>당신의 내용은 ${ccls.classContent }</h5>
					<h5>당신의 시작일은 ${ccls.classStart }</h5>
					<h5>당신의 종료일은 ${ccls.classEnd }</h5>
					<h5>당신의 평점은 ${ccls.classRate }</h5>
					<h5>당신의 총인원수는 ${ccls.classNop }</h5>
					<h5>당신의 현재인원수는 ${ccls.classCurrNop }</h5>
					<h5>당신의 상태는 ${ccls.classStatus }</h5>
					<h5>당신의 등록일은 ${ccls.classRegDate }</h5>
					<hr>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur posuere ante sapien, eu blandit massa ullamcorper nec. Mauris laoreet congue nibh at sagittis. Phasellus tincidunt, tellus eget aliquet tristique, metus ex dignissim odio, sed tristique ligula justo in enim. Vivamus ante magna, bibendum at molestie non, tempor sed odio. Integer ultrices quis lorem non mattis. Aliquam volutpat, justo eget suscipit feugiat, purus lectus pharetra sem, vitae feugiat dui sapien elementum elit. Phasellus aliquet accumsan ex ultrices molestie. Duis consectetur ex ut ante tincidunt tincidunt. Proin quis tellus a ligula blandit porta a ut ex. Morbi at neque eu sapien pharetra porta sit amet ut arcu.

Proin lobortis nisi nec lectus tempor ultricies. Curabitur id mauris ornare, pharetra turpis sed, dictum est. Mauris viverra turpis ullamcorper sapien aliquam luctus. Vivamus sit amet metus et elit congue elementum. Cras viverra iaculis libero, nec pharetra eros dignissim et. Donec non urna ac mi tristique porttitor. Sed tristique ligula a diam aliquam, placerat posuere tortor ultrices. Donec sit amet pulvinar nunc. Aliquam massa massa, vehicula quis magna a, imperdiet volutpat diam. Nunc aliquet, leo sed rutrum rhoncus, augue massa porttitor ipsum, sit amet pulvinar risus arcu at sapien. Proin purus arcu, posuere a sem in, condimentum gravida massa. Nullam pretium, massa ut posuere lobortis, erat lectus consectetur odio, ac faucibus tortor eros in ex. In finibus, erat a egestas pellentesque, ex lacus congue velit, ut mollis est ante non enim. Pellentesque vitae eros eget diam laoreet tempus et et tortor. Nam dui purus, mattis quis libero id, blandit ornare dolor.

Proin in lacus nunc. Suspendisse viverra luctus scelerisque. Integer nec auctor velit. Etiam at varius orci, ut ultrices nunc. Ut id magna ac tortor venenatis aliquet. Cras ac vestibulum elit, vel facilisis ligula. Fusce viverra, nibh eget ultrices pharetra, ipsum dui porttitor nisi, quis pellentesque felis nisi vitae risus. Maecenas et mollis libero, id mattis orci. Pellentesque diam magna, condimentum non nunc eget, ullamcorper convallis mi. Praesent a dignissim dui, sit amet tempor purus. Ut sed magna maximus, maximus massa nec, tempus justo. Sed eu nunc eu lorem condimentum hendrerit vitae in magna. Phasellus in congue massa, eget condimentum sem. Proin vehicula ex eget risus sodales scelerisque. Praesent gravida mollis lacus, id dapibus lectus.

Sed vel odio diam. Fusce volutpat lacus eget nulla blandit, in tincidunt nibh vestibulum. Phasellus vitae molestie ipsum. Aenean non odio et nulla tempus dictum. Sed posuere libero sed nibh convallis condimentum. Sed at eros volutpat, vulputate sapien eu, fermentum ante. Nunc venenatis sed tortor in venenatis. Mauris vulputate diam non ex scelerisque lacinia. Nam iaculis, odio non commodo congue, orci ligula lobortis tellus, non finibus neque lorem et magna. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse potenti. Donec nunc turpis, porta a mauris vestibulum, condimentum volutpat nibh. Ut convallis eros id ornare dignissim. Quisque rhoncus id sem sed sollicitudin. Fusce pretium, justo a mollis laoreet, turpis tellus placerat erat, id condimentum lacus nunc ac metus.

Sed in dignissim nisi. Vestibulum sit amet nunc libero. Proin id elementum justo, consectetur imperdiet turpis. Nullam placerat imperdiet metus, ullamcorper semper turpis luctus vitae. Donec fermentum dui sed aliquam congue. Sed facilisis purus lorem, sit amet aliquet leo gravida vitae. Duis ut tellus lobortis, pharetra ligula ut, ultrices dolor.

Proin quis fermentum mi. Nam elit sem, tristique ac fermentum id, vestibulum ac arcu. Phasellus nec felis in turpis consequat consequat. Aenean accumsan ligula vulputate eros dignissim, vel consectetur tortor posuere. Ut euismod consectetur luctus. Etiam nec sodales lacus. Aliquam pellentesque, urna non tempus consectetur, est magna scelerisque velit, et pellentesque metus diam non nibh. Morbi dignissim, nunc eget malesuada condimentum, risus purus scelerisque quam, quis eleifend augue massa non lorem. Cras ut molestie turpis. Quisque at erat porttitor, viverra ipsum nec, tristique velit. Curabitur ac scelerisque enim. Nulla lacus nunc, laoreet et aliquet sed, molestie a nulla. Nulla ut pharetra nisi. Sed sit amet vulputate sapien.

Fusce tempor, lacus ac varius molestie, justo elit porttitor lorem, et cursus lorem orci eu leo. Fusce fringilla maximus lectus, vel imperdiet lorem viverra a. Suspendisse dui libero, viverra sit amet odio ac, dapibus viverra mi. In sapien nisi, porttitor a ullamcorper non, faucibus pulvinar nibh. Vestibulum faucibus gravida enim, ac venenatis risus luctus non. Quisque malesuada non magna ac bibendum. Morbi lacinia pulvinar ornare. Donec sed felis consectetur, volutpat nisi ut, semper massa. Integer nisi tellus, mattis at sodales ut, molestie et risus. Suspendisse molestie urna sed sapien blandit interdum. Nulla tempor orci lectus, vitae hendrerit quam suscipit ac. Suspendisse potenti. Donec a elementum mauris. Aenean quis viverra leo.

Etiam id tortor consectetur, interdum turpis non, sodales elit. Aenean at elit sed enim condimentum ornare a et dui. Integer ac metus purus. Nam dapibus dolor purus, ut luctus neque luctus et. In et lacinia lorem. Curabitur imperdiet dapibus purus, et volutpat ex condimentum faucibus. Etiam rhoncus ullamcorper imperdiet. In hac habitasse platea dictumst. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Integer porta hendrerit tellus, sed dignissim nulla. Nulla ut aliquet lacus, in dapibus nisi. Etiam laoreet sodales sodales. Donec vulputate felis a libero suscipit, quis tristique mi feugiat. Pellentesque vel elementum libero, sit amet mollis purus. Maecenas feugiat, eros ut fringilla vestibulum, mauris risus blandit elit, vitae vestibulum dui mi in nisi. Donec venenatis gravida elit eget blandit.

Phasellus quis lorem a erat porttitor imperdiet quis eu lectus. Sed dictum euismod condimentum. Ut iaculis scelerisque justo ac vestibulum. Curabitur ut rutrum urna, vel sollicitudin risus. Nam lectus magna, facilisis sed mi vel, maximus commodo purus. Ut lacinia semper quam nec lacinia. Sed aliquet eu erat at tincidunt. Vestibulum sem ante, auctor aliquet dolor et, facilisis semper ipsum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Suspendisse nibh enim, hendrerit eu urna sed, porttitor suscipit neque.

Vestibulum pulvinar finibus commodo. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum venenatis urna neque, nec ultrices libero convallis non. Quisque nec purus a orci maximus scelerisque ut id magna. Nulla nunc risus, finibus vitae purus sit amet, auctor viverra nibh. Proin vel porta mauris. Vestibulum suscipit commodo sagittis.

In hac habitasse platea dictumst. Sed suscipit imperdiet lacus, a blandit ipsum elementum eget. Nunc aliquet interdum mauris vestibulum pulvinar. Donec maximus convallis libero in accumsan. Ut pretium rhoncus tincidunt. Praesent sem nulla, porttitor at ante in, pharetra dictum urna. Integer nec elementum quam, at consectetur libero. Ut dignissim, neque id imperdiet interdum, eros arcu blandit nunc, interdum pulvinar mi eros non dui. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Pellentesque aliquam mollis nisi, ac porttitor mi. Cras a eleifend purus. Etiam sodales enim nibh, a lacinia ligula rhoncus non. Proin vel magna nulla. Sed eget neque sit amet ligula molestie commodo pretium eget mi. Nulla ullamcorper tellus a felis bibendum, eget efficitur nunc fermentum. Suspendisse sem dolor, condimentum non gravida non, feugiat quis sem.

Ut sed ante congue, finibus neque nec, condimentum velit. Mauris ac magna in orci rhoncus feugiat in sed arcu. Mauris vitae semper diam. Morbi vestibulum tempus maximus. Sed orci tellus, vehicula quis felis eu, posuere tempor nisl. Etiam mollis vel sem id tristique. Vestibulum condimentum, nisi sit amet posuere hendrerit, enim magna ornare neque, et aliquet orci eros a lorem. Pellentesque vitae efficitur sem, eget sollicitudin lorem. Integer porta eget velit ut faucibus. Mauris ut tellus tincidunt diam varius elementum vel nec quam. Fusce venenatis finibus ante sit amet suscipit. Aliquam cursus lacus sit amet justo fermentum, at pharetra ipsum facilisis. Duis vitae odio sodales, sollicitudin turpis eu, tempus quam. Etiam elit dui, elementum eu hendrerit et, ultricies sit amet lacus.

Fusce non pharetra elit. Fusce nibh diam, euismod sed neque sed, interdum aliquet augue. Suspendisse placerat in purus eu volutpat. Mauris auctor orci hendrerit ligula iaculis vehicula. Nunc at sem viverra, laoreet ex quis, vulputate neque. Sed tristique, augue ut placerat auctor, est velit accumsan lacus, vehicula rhoncus dui nisi id dolor. Suspendisse potenti. Pellentesque pellentesque, velit vel blandit dapibus, lorem enim fringilla eros, molestie accumsan neque sapien vitae libero. Donec et massa ut elit maximus commodo. Vestibulum vel massa efficitur, sagittis diam a, lacinia enim. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nunc a rutrum orci. In vestibulum ante mauris, in pellentesque turpis pulvinar non. Proin tincidunt ut ligula vel dignissim. Nullam egestas ipsum ex, nec fringilla turpis placerat in. Aliquam erat volutpat.

Nullam massa velit, gravida quis metus id, bibendum dictum ligula. Nam eu elit lobortis nisi placerat consectetur. Etiam luctus egestas risus non egestas. Etiam luctus eleifend elementum. Proin interdum elit a orci cursus dapibus. Cras semper dui laoreet erat cursus, quis consequat leo elementum. Pellentesque ac ex ac nisl porttitor laoreet. Suspendisse sit amet nulla libero. Maecenas sit amet sem fermentum, vehicula tellus et, interdum turpis. Integer in felis facilisis ligula volutpat finibus at id urna. Curabitur aliquam magna augue, sed cursus orci condimentum in. Nulla ante arcu, consequat vel iaculis et, pretium efficitur felis. Duis ullamcorper, lorem sit amet aliquam fringilla, velit quam mollis turpis, finibus condimentum neque tellus a felis.

Donec eros turpis, bibendum in congue nec, pulvinar in est. Phasellus congue urna ac purus viverra, vel porta erat pulvinar. Praesent at fringilla nisi. In dapibus at metus at condimentum. In hac habitasse platea dictumst. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris laoreet nisl vehicula arcu dictum, dignissim sagittis mi facilisis. Sed ac purus eu orci egestas finibus. Nunc imperdiet faucibus lobortis.

Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Etiam viverra vehicula diam, et convallis odio ornare eu. Cras ac sagittis purus, placerat feugiat sapien. Aliquam sit amet turpis enim. Maecenas tellus neque, viverra a aliquam eu, accumsan nec lectus. Quisque gravida et neque eu condimentum. Proin ultricies convallis feugiat. Nullam sollicitudin est eget auctor vulputate. Etiam blandit quam eget neque molestie pulvinar. Cras pulvinar, libero sit amet consequat pretium, mi sem mattis nulla, vel faucibus purus velit id orci. Pellentesque volutpat dolor nibh, id ultrices orci cursus et.

Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Praesent eu eros molestie, laoreet est eu, sagittis arcu. Pellentesque sollicitudin eros ex, sed lacinia est condimentum a. Donec vitae luctus urna. Sed nec risus tortor. Aliquam congue nulla at enim iaculis mattis. Nam aliquet consequat magna ac auctor. Integer ante diam, efficitur at interdum vitae, dignissim quis nibh. Sed id varius justo.

Donec ac orci risus. Mauris nec metus tempor, mattis justo in, tristique magna. Morbi ullamcorper porttitor velit eu condimentum. Maecenas imperdiet tempor neque, vitae malesuada felis blandit et. Nunc volutpat, elit sed tincidunt malesuada, orci nulla blandit ante, ut dapibus urna ante quis urna. Suspendisse euismod, risus eu vestibulum maximus, nisl enim porta urna, in varius mi dui at metus. Cras laoreet ligula augue, ac aliquam orci suscipit sit amet.

Duis et iaculis lectus. Nulla facilisi. Sed ut arcu porta, consequat velit sed, placerat massa. Aliquam est lacus, fermentum eu tortor non, viverra consectetur tellus. Etiam non fringilla felis. In ut ligula nisi. Quisque a magna ornare eros hendrerit cursus ut pharetra odio. Maecenas a augue porta, ornare nibh id, fermentum urna. Donec posuere, purus sit amet vestibulum sodales, diam massa ultricies sapien, quis luctus est odio et lacus. Pellentesque accumsan ante ac justo cursus tristique. Interdum et malesuada fames ac ante ipsum primis in faucibus. Praesent iaculis orci eu mauris mattis, vel varius massa dignissim. Aenean varius eu nulla sit amet congue. Etiam malesuada gravida nisi, vitae rutrum orci. Quisque tincidunt elit a urna posuere, ac suscipit mauris maximus.

Quisque ut quam eleifend odio semper dictum vehicula a erat. Quisque sit amet tincidunt justo. Vestibulum egestas aliquam nibh, commodo imperdiet magna facilisis accumsan. Donec at risus at lacus maximus ornare. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur vitae facilisis turpis. Etiam et mollis neque, eu viverra augue. Curabitur eget venenatis leo. Vestibulum aliquet, mi sed ullamcorper ultrices, mi turpis euismod sapien, eu ullamcorper lorem lacus vel quam. In vitae quam leo. Sed vestibulum interdum convallis. Aenean facilisis sollicitudin sapien, vel cursus ante faucibus a. Donec luctus viverra tempor. Phasellus a elementum nisl. Maecenas ut volutpat tellus, ut molestie nibh. Donec eu sollicitudin nulla.</p>

					<hr>
					<img src="./resources/img/cookingcls/classtest.jpg">
					<h3>리뷰 부분</h3>
					<h5>당신의 평점은 ${ccls.classRate }</h5>
					<div class="table">
						<table class="table">
							<tr>
								<th>번호</th>
								<th>아이디</th>
								<th>내용</th>
								<th>평점</th>
							</tr>
							<tr>
								<td>1</td>
								<td>myaccount</td>
								<td>싫어요</td>
								<td>★★★★☆</td>
							</tr>
							<tr>								
								<td>2</td>
								<td>myaccount1</td>
								<td>싫어요</td>
								<td>★★★★☆</td>
							</tr>
							<tr>								
								<td>3</td>
								<td>myaccount2</td>
								<td>싫어요</td>
								<td>★★★★☆</td>
							</tr>
							<tr>								
								<td>4</td>
								<td>myaccount3</td>
								<td>싫어요</td>
								<td>★★★★☆</td>
							</tr>
							<tr>
								<td colspan="2">
									<input type="text" name="blah" id="blah" class="input-group">
								</td>							
								<td>
									<select class="form-select">
										<option value="1">★☆☆☆☆</option>
										<option value="2">★★☆☆☆</option>
										<option value="3">★★★☆☆</option>
										<option value="4">★★★★☆</option>
										<option value="5">★★★★★</option>
									</select>
								</td>							
								<td>
									<div class="d-grid gap-2">
									<button type="button" id="reviewWrite" class="btn btn-danger btn-md">작성</button>
									</div>
								</td>							
							</tr>
							
						</table>
					</div>
				</div>
				<div class="right">
					<div class="right-stick">
						<div class="right-stick-content">
							<h5>제목 : ${ccls.classTitle }</h5>
							<h5>가격 : <span class="classPrice">${ccls.classPrice }</span>원</h5>
							<h5>강의시간 : ${ccls.classTime }</h5>
							<h5>장소 : ${ccls.classLocation }</h5>
							<div class="d-grid gap-2">
								<button type="button" id="payBtn" class="btn btn-primary btn-lg" >결제하기</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
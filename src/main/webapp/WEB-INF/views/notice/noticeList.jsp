<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 - 공지사항</title>
<!-- 공통 CSS-->
<link rel="stylesheet" href="resources/css/mainpage/common.css">
<link rel="stylesheet" href="resources/css/freeboard/BoardList.css">
<!-- 페이지 전용 CSS -->
<link rel="stylesheet" href="resources/css/notice/noticeList.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
  <main id="main">
    <section class="inner-page">
      <div class="container">
      	<div class="row">
	      	<div class="col sidemenu">
				<h1>커뮤니티</h1>
				<div class="sidemenubox">
					<ul class="nav flex-column">
						<li class="nav-item active"><a href="#">공지사항 <span> &gt;</span></a></li>
						<li class="nav-item"><a href="#">자유게시판 <span> &gt;</span></a></li>
						<li class="nav-item"><a href="#">추천메뉴 <span> &gt;</span></a></li>
					</ul>
				</div>
	      	</div>
	      	<div class="col-10 main-content">
	      		<div class="main-content-title">
	      			<h2>공지게시판 <span> 요리조리의 새로운 소식들과 유용한 정보들을 한 곳에서 확인하세요.</span></h2>
	      			<a href="noticeWriteFrm.do"><button class="btn-main">글 작성하기</button></a>
	      		</div>
	      		<div class="freeboard-table">
	      			<div class="freeboard-count">
	      				<h5>총 게시물 : <span style="color: rgb(159, 144, 207);">${totalCount }</span>개</h5>
	      			</div>
	      			<table class="table table-hover">
	      				<thead>
	      					<tr>
	      						<th scope="col">번호</th>
	      						<th scope="col">제목</th>
	      						<th scope="col">작성자</th>
	      						<th scope="col">작성일</th>
	      						<th scope="col">조회</th>
	      					</tr>
	      				</thead>
	      				<tbody>
	      				</tbody>
	      			</table>
					<div class="pagi">
						${pageNavi }
					</div>
					<form action="/noticeSearch.do" method="get">
					<div class="board-search row">
						<div class="col-9">
							검색어 
								<input type="radio" id="searchtype-1" name="searchtype" class="searchtype" value="title">
								<label for="searchtype-1">제목</label>
								<input type="radio" id="searchtype-2" name="searchtype" class="searchtype" value="content">
								<label for="searchtype-1">내용</label>
								<input type="radio" id="searchtype-3" name="searchtype" class="searchtype" value="writerId">
								<label for="searchtype-1">작성자(ID)</label>
								<input type="radio" id="searchtype-4" name="searchtype" class="searchtype" value="writerNickname">
								<label for="searchtype-1">작성자(닉네임)</label>
						</div>
						<div class="col">
							<input type="search" class="tk-search" name="searchword">
							<button class="btn-main btn-search my-2 my-sm-0" type="submit"><img src="resources/img/mainpage/search_icon_w.png" style="width: 25px; height: 25px;"></button>
						</div>
					</div>
					</form>
	      		</div>
	      	</div>
	      </div>
      </div>
    </section>

  </main><!-- End #main -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
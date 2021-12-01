<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/admin/sidenavi.jsp" />
    <div class="container">
        <h2>전체 회원 조회</h2>
    
    
    <div style="background-color: #F7F7E5; height: 200px;">
        <div style="padding: 15px;">
            
        <label>회원검색</label>
        <select name="" id="">
            <option value="1">아이디</option>
            <option value="2">닉네임</option>
            <option value="3">전화번호</option>
            
        </select>
        <input type="text" >
        <button>검색</button>
        <button>상세검색</button>
        </div>

        <div class="detail" style="padding: 15px;">

            <input type="radio" value="1" id="postspace" name="searchdetail"><label for="postspace">게시글 수</label>
            <input type="radio" value="2" id="commentspace" name="searchdetail"><label for="commentspace">댓글 수</label>
            <input type="radio" value="3" id="visitspace" name="searchdetail"><label for="visitspace">방문 수</label>
            <input type="radio" value="4" id="signdate" name="searchdetail"><label for="signdate">가입일</label>
            <hr>
            <select>
                <option value="1">전체기간</option>
                <option value="2">최근 1개월</option>
            </select>
            <span id="recentonemonth"></span>
            <span>동안</span>
            <span id="space"></span>
            <input type="text" placeholder="0" style="width: 70px;">
            <span>개</span>
            <select>
                <option value="1">이상</option>
                <option value="2">이하</option>
                
            </select>
            <span>인 회원</span>
                <button>검색</button>
            


        </div>
        
    </div>
    <span>전체 회원 수</span> <span>555</span>
    <hr>
    <div style="float: left;">
        <span>선택 회원을</span>
        <button>블랙리스트 추가</button>
        <button>삭제</button>
        <button>쪽지</button>
    </div>
    <div style="float: right;">
    <select>
        <option value="0">전체회원</option>
        <option value="1">요리꾼</option>
        <option value="2">조리꾼</option>
    </select>
    <select>
        <option value="0">30명 정렬</option>
        <option value="1">50명 정렬</option>
        <option value="2">100명 정렬</option>
    </select>
    
    </div>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
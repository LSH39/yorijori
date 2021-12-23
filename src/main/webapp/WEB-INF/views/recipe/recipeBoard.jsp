<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/recipe/recipeBoard.css"> 
   <script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
     

</head>

<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="main">
    <h1>레시피</h1>
	<div id="recipeList">
		<c:forEach items="${list }" var="rb" varStatus="i">	 
	     <div class="recipe">
	     <c:if test="${sessionScope.m.memberNo != null }">
            <a href="/recipeView.do?recipeNo=${rb.recipeNo }&memberNo=${sessionScope.m.memberNo}">
         </c:if>
         <c:if test="${sessionScope.m.memberNo == null }">
         	 <a href="/recipeView.do?recipeNo=${rb.recipeNo }&memberNo=0">
         </c:if>
             <img src="/resources/upload/recipe/${rb.filepath }">
             
             <p class="name">${rb.nickname }</p>
            <p class="title">${rb.recipeTitle }</p>  
            
            <div class="info">
            <div>
            <p class="infoText">조회수</p>
            <p>${rb.readCount }회</p>  
            </div> 
            <div >
             <p class="infoText">조리시간</p>
            <p>${rb.recipeTime }</p>  
            </div>
            <div>
             <p class="infoText">난이도</p>
             <c:if test="${rb.recipeLevel eq 1}">
            <p>상</p>  
            </c:if>
             <c:if test="${rb.recipeLevel eq 2}">
              <p >중</p>  
              </c:if>
                <c:if test="${rb.recipeLevel eq 3}">
              <p>히</p>  
              </c:if>
            </div>
        </div>
      </a>
      </a>
    </div>
		</c:forEach>
		<div id="moreRecipe"></div>
		</div>
		<div class="btnWrap" ><button currentCount="6" totalCount="${totalCount }" value="7" id="more">리워드 프로젝트 더보기</button></div>
	</div>		
	<script>
	 $("#more").click(function(){
		 	var start = $(this).val();
			$.ajax({
				url : "/moreRecipe.do",
				data : {start:start
						},
				type : "post",
				success : function(data){			
					for(var i=0;i<data.length;i++){
						var price = data[i].milkitPrice.toLocaleString('ko-KR')
						var html ="";		
						$("#moreRecipe").append(html);	
					}

					$("#more").val(Number(start)+3);
					var curr = Number($("#more").attr("currentCount"));
					$("#more").attr("currentCount", curr + data.length);
					var totalCount = $("#more").attr("totalCount");
					var currCount = $("#more").attr("currentCount");
					if(curr == totalCount){				
						$("#more").prop("disabled",false);
						alert("마지막 페이지 입니다.")
					}
				}
			});
		});
	</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
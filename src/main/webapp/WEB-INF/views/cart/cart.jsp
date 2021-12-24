<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart</title>
<link href="/resources/css/member/LoginCommon.css" rel="stylesheet">
<link href="/resources/css/cart/Cart.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%@include file = "/WEB-INF/views/common/header.jsp" %>
		<div class="container">
		       <div class="wrap">
		           <div class="content">
		               <p class="top_txt">장바구니</p>
		               <form action="/paymentFrm.do" method="post" id="paymentFrm">
		               		<input type="hidden" name="memberNo" value="${sessionScope.m.memberNo }">
			               	<div class="center">
			                   <div id="top">
			                       <label><input type="checkbox" class="check" onclick="checkAll();" id="checkA"><span></span> 전체 선택 (<span id="select"></span>/${list.size() })</label>
			                    <button type="button" class="light_btn" id="deleteCart">선택삭제</button>
			                	</div>
			                	<table id="cart">
				                    <tr>
				                        <th colspan="3">상품정보</th>
				                        <th>수량</th>
				                        <th>상품금액</th>
				                    </tr>
				                    
				                    <c:choose>
				                    	<c:when test="${list.size() == 0 }">
					                    	<tr>
					                    		<td colspan="5" style="height: 200px;">장바구니에 담긴 상품이 없습니다.</td>
					                    	</tr>
				                    	</c:when>
				                    	<c:when test="${list.size() != 0 }">
					                    	<c:forEach items="${list }" var="c" varStatus="i">
					                    		<tr>
							                    	<td>
												       	<label><input type="checkbox" class="check" name="checkNo" value="${c.cartNo }"><span></span></label>
												       	<span class="none">${c.cartNo }</span>
												   	</td>
												   	<td><img src="/resources/upload/product/${c.productFilepath }"></td>
												   	<td class="infoTd"><a href="/milkitView.do?productNo=${c.productNo }&recipeNo=${c.recipeNo }" class="milkit_a">
												       	<p>[ ${c.sellerNickname } ]</p>
												       	<p>${c.milkitName }</p>
												       	<p><span>${c.milkitPrice }</span>원</p></a>
												   	</td>
												   	<td>
												       	<span class="less"></span><span class="count">${c.productAmount }</span><span class="more"></span>
												       	<button type="button" class="gray_btn changeCart">수량변경</button>
												       	<span class="none">${c.cartNo }</span>
												   	</td>
												   	<td><span></span>원</td>
												</tr>
						                    </c:forEach>
				                    	</c:when>
				                    	
				                    </c:choose>
			                    
			                	</table>
			            	</div>
			            	<div class="bottom">
				                <table id="bottomTbl">
				                    <tr>
				                        <td>총 상품 금액</td>
				                        <td></td>
				                        <td>할인예정금액</td>
				                        <td></td>
				                        <td>배송비</td>
				                        <td>총 결제금액</td>
				                    </tr>
				                    <tr>
				                        <td><span id="selectTotal"></span>원</td>
				                        <td><img src="/resources/img/cart/cart_minus.png"></td>
				                        <td>0원</td>
				                        <td><img src="/resources/img/cart/cart_plus.png"></td>
				                        <td>전 상품 무료배송</td>
				                        <td><span id="total"></span>원</td>
				                    </tr>
				                </table>
				                <button type="button" id="payBtn" class="purple_btn">구매하기</button>
			            	</div>
			            </form>
		        	</div>
		    	</div>
			</div>
		<%@include file = "/WEB-INF/views/cart/cartJs.jsp" %>
	
	<%@include file = "/WEB-INF/views/common/footer.jsp" %>

</body>
</html>
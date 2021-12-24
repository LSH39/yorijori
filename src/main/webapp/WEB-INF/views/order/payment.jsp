<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Payment</title>
<link href="/resources/css/member/LoginCommon.css" rel="stylesheet">
<link href="/resources/css/order/Payment.css" rel="stylesheet" type="text/css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="https://js.tosspayments.com/v1"></script>
</head>
<body>
	<%@include file = "/WEB-INF/views/common/header.jsp" %>
	<div class="container">
        <p class="top_txt">주문서</p>
        <form action="/order.do" id="order" method="post">
            <table id="order">
                <caption class="caption">주문상품</caption>
                <tr class="product-table-title">
                    <th colspan="2">상품정보</th>
                    <th>수량</th>
                    <th>상품금액</th>
                </tr>
                
                <c:forEach items="${cartList }" var="c" varStatus="i">
					<tr class="product-table-container">
                    <td><img src="/resources/upload/product/${c.productFilepath }"></td>
                    <td>
                    	<input type="hidden" name="cartNoList" value="${c.cartNo }">
                        <p>[ ${c.sellerNickname } ]</p>
                        <p>${c.milkitName }</p>
                    </td>
                    <td>${c.productAmount } 개</td>
                    <td><span>${c.productPrice }</span>원</td>
                </tr>
				</c:forEach>
                
            </table>
            <table id="delivery">
                <caption class="caption">주문자 및 배송정보<span id="nojusoupdate">기본 배송지 변경은 마이페이지에서 가능합니다.</span></caption>
                <tr>
                    <th>주문자명</th>
                    <td colspan="3"><input type="text" class="input_txt none_txt" name="orderName" value="${m.memberName }" readonly></td>
                </tr>
                <tr>
                    <th>휴대폰</th>
                    <td colspan="3"><input type="text" class="input_txt none_txt" name="orderPhone" value="${m.memberPhone }" readonly></td>
                </tr>
                <tr>
                    <th>이메일</th>
                    <td colspan="3"><input type="text" class="input_txt none_txt" name="orderEmail" value="${m.memberEmail }" readonly></td>
                </tr>
                <tr>
                    <th rowspan="2">배송지</th>
                    <td colspan="3">
                        <button type="button" class="light_btn" id="memberAddr">기본 배송지</button>
                        <button type="button" class="light_btn" id="newAddr">새 배송지 검색</button>
                    </td>
                </tr>
                <tr>
                    <td><input type="text" class="input_txt" name="orderPostcode" readonly></td>
                    <td><input type="text" class="input_txt" name="orderAddrRoad" readonly></td>
                    <td><input type="text" class="input_txt" name="orderAddrDetail" maxlength="30" readonly></td>
                </tr>
                <tr>
                    <th>요청사항</th>
                    <td colspan="3"><input type="text" class="input_txt" name="orderRequest" maxlength="30" placeholder="배송시 요청사항을 입력해주세요"></td>
                </tr>
            </table>
            <table id="coupon">
                <caption class="caption">쿠폰 사용</caption>
                <tr>
                    <th>보유 쿠폰</th>
                    <td>
                        <select name="couponList">
                            <option value="no" selected>쿠폰 적용 안함</option>
                            <c:if test="${couponList.size() != 0 }">
	                            <c:forEach items="${couponList }" var="coupon" varStatus="i">
	                            	<option value="${coupon.couponListNo }">${coupon.couponName } [
	                            	<c:set var = "length" value = "${fn:length(coupon.couponDiscount)}"/>
	                            	${coupon.couponDiscount}<c:if test="${fn:substring(coupon.couponDiscount,length-1,length) != '%'}">원</c:if>
	                            	할인 ]</option>
	                            </c:forEach>
	                        </c:if>
	                        
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>할인 금액 : </th>
                    <td><span id="couponPrice"></span> 원</td>
                </tr>
            </table>
            <table id="point">
                <caption class="caption">포인트 사용</caption>
                <tr>
                    <th>사용가능 포인트 : </th>
                    <td><span id="pointPrice">${m.memberPoint }</span> 점</td>
                </tr>
                <tr>
                    <th>사용 포인트 : </th>
                    <td><input type="text" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" id="usePoint" name="point"> 점</td>
                </tr>
            </table>
            <table id="pay">
                <tr>
                    <td>    
                        <table id="pay-left-top">
                            <caption class="caption">결제</caption>
                            <tr>
                                <th>결제방법</th>
                                <td>
                                    <input type="radio" name="orderPayOption" value="1" id="card1" checked><label class="light_btn radioLabel" for="card1">신용카드</label>
                                    <input type="radio" name="orderPayOption" value="2" id="card2"><label class="toss_light_btn radioLabel" id="toss_light_btn_id" for="card2">TOSS</label>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td rowspan="2">
                        <table id="pay-right">
                            <caption class="caption">결제 금액</caption>
                            <tr>
                                <td>주문금액</td>
                                <td><span id="orderPrice"></span> 원</td>
                            </tr>
                            <tr>
                                <td>쿠폰 사용</td>
                                <td>- <span id="couponUse"></span> 원</td>
                            </tr>
                            <tr>
                                <td>포인트 사용</td>
                                <td>- <span id="pointUse"></span> 원</td>
                            </tr>
                            <tr>
                                <td>최종결제금액</td>
                                <td><span id="totalPrice"></span>원</td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table id="pay-left-bottom">
                            <caption class="caption">개인정보 수집/제공</caption>
                            <tr>
                                <th>개인정보 제공 동의</th>
                            </tr>
                            <tr>
                                <td>
                                    <textarea readonly>
필수 개인정보 제공 동의(판매자)
YORIJORI에서 제공하는 상품 및 서비스를 구매하고자 할 경우, YORIJORI은 거래 당사자간 원활한 의사소통 및 배송, 상담 등 거래이행을 위하여 필요한 최소한의 개인정보를 아래와 같이 제공하고 있습니다.
1. 개인정보를 제공받는 자 : 상품 및 서비스 판매자
2. 제공하는 개인정보 항목 : 이름, 닉네임, (휴대)전화번호, 상품 구매정보, 결제수단, 상품 수령인 정보(배송상품:수령인명, 주소, (휴대)전화번호)
3. 개인정보를 제공받는 자의 이용목적 : 판매자와 구매자의 원활한 거래 진행, 본인의사의 확인, 고객상담 및 불만처리/부정이용 방지 등의 고객관리, 물품배송, 새로운 상품/서비스 정보와 고지사항의 안내, 상품/서비스 구매에 따른 혜택 제공
4. 개인정보를 제공받는 자의 개인정보 보유 및 이용기간 : 개인정보 이용목적 달성 시까지 보존합니다. 단, 관계 법령의 규정에 의하여 일정 기간 보존이 필요한 경우에는 해당 기간만큼 보관 후 삭제합니다.
위 개인정보 제공 동의를 거부할 권리가 있으나, 거부 시 YORIJORI을 이용한 상품 구매가 불가능합니다. 그 밖의 내용은 YORIJORI의 자체 이용약관 및 개인정보처리방침에 따릅니다.</textarea>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <div id="bottom">
                <p id="p_txt">주문 내용을 확인하였으며, 정보 제공 등에 동의합니다.</p>
                <button type="button" id="submitBtn" class="purple_btn">결제하기</button>
            </div>
            <input type="hidden" name="memberNo" style="display: none;" value="${m.memberNo}">
            <input type="hidden" name="orderPrice" style="display: none;">
            <input type="hidden" name="orderSale" style="display: none;">
            <input type="hidden" name="orderPayment" style="display: none;">
            <input type="hidden" name="impUid" style="display: none;">
        </form>
    </div>

	<%@include file = "/WEB-INF/views/order/paymentJs.jsp" %>
	<%@include file = "/WEB-INF/views/common/footer.jsp" %>
</body>
</html>
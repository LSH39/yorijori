package kr.or.mypage.model.vo;

import lombok.Data;

@Data
public class Mysell {
	private int orderNo;
	private int memberNo;
	private String orderName;
	private String orderEmail;
	private String orderPhone;
	private String orderPostcode;
	private String orderAddrRoad;
	private String orderAddrDetail;
	private String orderRequest;
	private int orderPayOption;
	private int orderPrice;
	private int orderSale;
	private int orderPayment;
	private String impUid;
	private int orderStatus;
	//밀키트
	private int productNo;
	private int recipeNo;
	private int milkitWriter;
	private String milkitName;
	private int milkitPrice;
	private String milkitComment;
	private String filepath;
	private String milkitContent;
	private String milkitDate;
	private int milkitStock;
	private int milkitDelete;
	//주문옵션
	private int orderOptionNo;
	private int orderOptionAmount;
	
	public String getCard(){
		if(orderPayOption == 1) {
			return "신용카드";
		}else if(orderPayOption == 2) {
			return "무통장입금";
	
		}else {
			return null;
		}
	}
	
	public String getStatus(){
		if(orderStatus == 0) {
			return "주문취소";
		}else if(orderStatus == 1) {
			return "주문완료";
		}else if(orderStatus == 2) {
			return "배송준비중";
		}else if(orderStatus == 3) {
			return "배송중";
		}else if(orderStatus == 4) {
			return "배송완료";
		}else {
			return null;
		}
	}
}

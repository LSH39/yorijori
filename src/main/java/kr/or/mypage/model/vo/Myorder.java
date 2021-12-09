package kr.or.mypage.model.vo;

import lombok.Data;

@Data
public class Myorder {
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
}

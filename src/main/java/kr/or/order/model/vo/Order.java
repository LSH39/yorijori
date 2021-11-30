package kr.or.order.model.vo;

import lombok.Data;

@Data
public class Order {
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
}

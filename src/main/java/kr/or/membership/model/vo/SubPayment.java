package kr.or.membership.model.vo;

import lombok.Data;

@Data
public class SubPayment {
	private int paymentNo;
	private int memberNo;
	private int membershipNo;
	private int payAmount;
	private String payDate;
	private String membershipEnd;
	private String impNo;
	private String memberName;
	private String memberPhone;
	private String postcode;
	private String addressRoad;
	private String addressDetail;

	
	
}

package kr.or.coupon.model.vo;

import lombok.Data;

@Data
public class Coupon {
	private int couponNo;
	private String couponName;
	private String couponStart;
	private String couponEnd;
	private String couponDiscount;
	private int couponAmount;	
	private String couponDate;
	private int noUseCount;
	private int useCount;
}

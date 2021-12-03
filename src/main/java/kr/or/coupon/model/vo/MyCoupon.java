package kr.or.coupon.model.vo;

import lombok.Data;

@Data
public class MyCoupon {
	private int couponNo;
	private String couponName;
	private String couponStart;
	private String couponEnd;
	private String couponDiscount;
	private int couponUse;
	private int memberNo;
}

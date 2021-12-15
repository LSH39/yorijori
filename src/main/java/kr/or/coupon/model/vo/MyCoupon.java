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
	

public String getUseCoupon(){
	if(couponUse == 0) {
		return "미사용";
	}else if(couponUse == 1) {
		return "사용완료";
	}else {
		return null;
	}
}
}
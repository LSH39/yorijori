package kr.or.coupon.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class MyCouponPageData {
	private ArrayList<MyCoupon> list;
	private String pageNavi;
	private int start;
	private int totalCount;
	
	
	public MyCouponPageData(ArrayList<MyCoupon> list, String pageNavi, int start, int totalCount) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
		this.start = start;
		this.totalCount = totalCount;
	}


	public MyCouponPageData() {
		super();
	
	}
}

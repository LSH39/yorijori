package kr.or.mypage.controller;

import java.util.ArrayList;

import kr.or.coupon.model.vo.MyCoupon;
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
		// TODO Auto-generated constructor stub
	}
}

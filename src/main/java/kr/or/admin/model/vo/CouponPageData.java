package kr.or.admin.model.vo;

import java.util.ArrayList;

import kr.or.coupon.model.vo.Coupon;

public class CouponPageData {
	private ArrayList<Coupon> list;
	private String pageNavi;
	private int start;
	
	public CouponPageData() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CouponPageData(ArrayList<Coupon> list, String pageNavi, int start) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
		this.start = start;
	}

	public ArrayList<Coupon> getList() {
		return list;
	}

	public void setList(ArrayList<Coupon> list) {
		this.list = list;
	}

	public String getPageNavi() {
		return pageNavi;
	}

	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}
	
}

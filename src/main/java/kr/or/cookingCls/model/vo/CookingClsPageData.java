package kr.or.cookingCls.model.vo;

import java.util.ArrayList;

public class CookingClsPageData {
	private ArrayList<CookingCls> list;
	private String pageNavi;
	private int start;
	public CookingClsPageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CookingClsPageData(ArrayList<CookingCls> list, String pageNavi, int start) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
		this.start = start;
	}
	public ArrayList<CookingCls> getList() {
		return list;
	}
	public void setList(ArrayList<CookingCls> list) {
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

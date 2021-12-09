package kr.or.admin.model.vo;

import java.util.ArrayList;

import lombok.Data;


public class MemberPageData {
	private ArrayList<Member2> list;
	private String pageNavi;
	private int totalCount;
	
	public ArrayList<Member2> getList() {
		return list;
	}

	public void setList(ArrayList<Member2> list) {
		this.list = list;
	}

	public String getPageNavi() {
		return pageNavi;
	}

	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public MemberPageData(ArrayList<Member2> list, String pageNavi, int totalCount) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
		this.totalCount = totalCount;
	}

	public MemberPageData() {
		super();
		// TODO Auto-generated constructor stub
	}
}


package kr.or.admin.model.vo;

import java.util.ArrayList;

import lombok.Data;


public class MemberPageData {
	private ArrayList<Member2> list;
	private String pageNavi;
	private int start;
	
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

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public MemberPageData(ArrayList<Member2> list, String pageNavi, int start) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
		this.start = start;
	}

	public MemberPageData() {
		super();
		// TODO Auto-generated constructor stub
	}
}


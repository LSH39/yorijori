package kr.or.mypage.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class MyorderPageData {
	private ArrayList<Myorder> list;
	private String pageNavi;
	private int start;
	private int totalCount;
	
	
	public MyorderPageData(ArrayList<Myorder> list, String pageNavi, int start, int totalCount) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
		this.start = start;
		this.totalCount = totalCount;
	}


	public MyorderPageData() {
		super();
		// TODO Auto-generated constructor stub
	}
}

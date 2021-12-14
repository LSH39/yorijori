package kr.or.mypage.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class MycontestPagedata {
	private ArrayList<MyContest> list;
	private String pageNavi;
	private int start;
	private int totalCount;
	
	
	public MycontestPagedata(ArrayList<MyContest> list, String pageNavi, int start, int totalCount) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
		this.start = start;
		this.totalCount = totalCount;
	}


	public MycontestPagedata() {
		super();
		// TODO Auto-generated constructor stub
	}
}

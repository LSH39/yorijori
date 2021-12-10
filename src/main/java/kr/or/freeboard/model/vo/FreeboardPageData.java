package kr.or.freeboard.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class FreeboardPageData {
	private ArrayList<Freeboard> list;
	private String pageNavi;
	private int start;
	private int totalCount;
	
	public FreeboardPageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FreeboardPageData(ArrayList<Freeboard> list, String pageNavi, int start, int totalCount) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
		this.start = start;
		this.totalCount = totalCount;
	}
	
}

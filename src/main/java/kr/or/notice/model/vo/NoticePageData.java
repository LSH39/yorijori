package kr.or.notice.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class NoticePageData {
	private ArrayList<Notice> list;
	private String pageNavi;
	private int start;
	private int totalCount;
	
	public NoticePageData(ArrayList<Notice> list, String pageNavi, int start, int totalCount) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
		this.start = start;
		this.totalCount = totalCount;
	}
	
	public NoticePageData() {
		super();
		// TODO Auto-generated constructor stub
	}
}

package kr.or.mypage.model.vo;

import java.util.ArrayList;
import lombok.Data;

@Data
public class MymembershipPageData {
	private ArrayList<Mymembership> list;
	private String pageNavi;
	private int start;
	private int totalCount;
	
	
	public MymembershipPageData(ArrayList<Mymembership> list, String pageNavi, int start, int totalCount) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
		this.start = start;
		this.totalCount = totalCount;
	}


	public MymembershipPageData() {
		super();
		// TODO Auto-generated constructor stub
	}
}

package kr.or.mypage.model.vo;

import java.util.ArrayList;

import kr.or.freeboard.model.vo.Freeboard;
import lombok.Data;

@Data
public class MySellPageData {
	private ArrayList<Mysell> list;
	private String pageNavi;
	private int start;
	private int totalCount;
	
	
	public MySellPageData(ArrayList<Mysell> list, String pageNavi, int start, int totalCount) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
		this.start = start;
		this.totalCount = totalCount;
	}


	public MySellPageData() {
		super();
		// TODO Auto-generated constructor stub
	}
}

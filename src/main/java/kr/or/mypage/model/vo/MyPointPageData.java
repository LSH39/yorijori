package kr.or.mypage.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class MyPointPageData {
	private ArrayList<Mypoint> list;
	private String pageNavi;
	private int start;
	private int totalCount; //적립된 총개수
	private int totalPoint; //총금액
	private int usePoint; //사용한 금액
	public MyPointPageData(ArrayList<Mypoint> list, String pageNavi, int start, int totalCount,int totalPoint,int usePoint) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
		this.start = start;
		this.totalCount = totalCount;
		this.totalPoint = totalPoint;
		this.usePoint = usePoint;
	}
	public MyPointPageData() {
		super();
		// TODO Auto-generated constructor stub
	}
}

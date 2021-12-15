package kr.or.mypage.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class followCount {
	private ArrayList<FollowList> list;

	private int totalCount;
	
	
	public followCount(ArrayList<FollowList> list, int totalCount) {
		super();
		this.list = list;
		this.totalCount = totalCount;
	}


	public followCount() {
		super();
		// TODO Auto-generated constructor stub
	}
}

package kr.or.mypage.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class ReadDm {
	private ArrayList<Mydm> list;

	private int totalCount;
	
	
	public ReadDm(ArrayList<Mydm> list, int totalCount) {
		super();
		this.list = list;
		this.totalCount = totalCount;
	}


	public ReadDm() {
		super();
		// TODO Auto-generated constructor stub
	}
}

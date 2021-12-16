package kr.or.mypage.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class ReadDm {
	private ArrayList<Mydm> list;

	private int dmCount;
	
	
	public ReadDm(ArrayList<Mydm> list, int dmCount) {
		super();
		this.list = list;
		this.dmCount = dmCount;
	}


	public ReadDm() {
		super();
		// TODO Auto-generated constructor stub
	}
}

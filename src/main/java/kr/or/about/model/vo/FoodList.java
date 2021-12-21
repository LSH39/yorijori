package kr.or.about.model.vo;

import lombok.Data;

@Data
public class FoodList {
	private int foodNo;
	private String foodName;
	private String foodCategory;
	// 추가
	private int rNum;
	private String imgSrc;
	
}

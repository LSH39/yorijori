package kr.or.mypage.model.vo;

import lombok.Data;

@Data
public class MyContest {
	
	private int contestNo;
	private String contestMonth;
	private String enterDate;
	private int contestResult;
	private int recipeWriter;
	private String recipeTitle;
}

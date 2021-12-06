package kr.or.mypage.model.vo;

import lombok.Data;

@Data
public class LikeRecipe {
	private int likeNo;
	private int memberNo;
	private int recipeWriter;
	private int recipeNo;
	private String recipeTitle;
	private String filepath;
	private int readCount;
	private String recipeLevel;
	private String subhead;
	private String recipeDate;
}

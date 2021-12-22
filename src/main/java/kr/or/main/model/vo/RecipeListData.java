package kr.or.main.model.vo;

import lombok.Data;

@Data
public class RecipeListData {
	private int recipeNo;
	private String recipeTitle;
	private String foodName;
	private String recipeContent;
	private int recipeWriterNo;
	private String memberId;
	private String memberNickname;
	private String recipeTime;	//조리시간
	private String recipeLevel;	//난이도
	private String situation;	//상황별
	private String ingredient;	//재료별
	private String recipePath;
	private int readCount;
	private int likeCount;
}

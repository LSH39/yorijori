package kr.or.recipe.model.vo;

import lombok.Data;

@Data
public class RecipeBoard {
	private int recipeNo;
	private int recipeWriter;
	private String recipeTitle;
	private String filepath;
	private int readCount;
	private String recipeDate;
	private String subhead;
	private String recipeVideo;
	private String recipeTime;
	private String foodName;
	private String recipeLevel;
	private String situation;
	private String material;
}

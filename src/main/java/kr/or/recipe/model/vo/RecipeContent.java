package kr.or.recipe.model.vo;

import lombok.Data;

@Data
public class RecipeContent {
	private int rFileNo;
	private int recipeNo;
	private String filename;
	private String filepath;
	private String recipeContent;
	
	private String[] rContentList;

	public String getrContentBr() {
		return recipeContent.replaceAll("\r\n", "<br>");
	}
	
}

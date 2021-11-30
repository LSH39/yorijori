package kr.or.recipe.model.vo;

import lombok.Data;

@Data
public class RecipeReport {
	private int reportNo;
	private int recipeNo;
	private int memberNo;
	private String reportComment;
}

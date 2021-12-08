package kr.or.recipe.model.vo;

import lombok.Data;

@Data
public class RecipeComment {
	private int rCommentNo;
	private int recipeNo;
	private int memberNo;
	private String rcContent;
	private String rcDate;
	private String nickname;
	
	public String getRcContentBr() {
		return rcContent.replaceAll("\r\n", "<br>");
	}
}

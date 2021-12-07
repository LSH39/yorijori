package kr.or.recipecontest.model.vo;

import lombok.Data;

@Data
public class RecipeContest {
	private int contestNo;
	private int recipeNo;
	private String memberNickname;
	private String enterDate;
	private int contestResult;
	private String contestMonth;
	private int recipeDelete;
	private int voteCount;
}

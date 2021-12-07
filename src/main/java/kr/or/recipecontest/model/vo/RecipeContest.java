package kr.or.recipecontest.model.vo;

import lombok.Data;

@Data
public class RecipeContest {
	private int contestNo;
	private int recipeNo;
	private String enterDate;
	private int contestWinner;
	private String contestMonth;
	private int recipeDelete;
}

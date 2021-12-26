package kr.or.recipecontest.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class ContestWinnerData {
	private ArrayList<RecipeContest> oneTwoThree;
	private ArrayList<RecipeContest> special;
}

package kr.or.recipecontest.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class ContestPageData {
	private ArrayList<RecipeContest> list;
	private String pageNavi;
	private int start;
	private int totalCount;
	
	
	public ContestPageData(ArrayList<RecipeContest> list, String pageNavi, int start, int totalCount) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
		this.start = start;
		this.totalCount = totalCount;
	}
	public ContestPageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}

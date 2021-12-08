package kr.or.recipecontest.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class ContestPageData {
	private ArrayList<RecipeContest> list;
	private String pageNavi;
	private int start;
	private int totalCount;
	private int orderIndex;
	
	
	public ContestPageData(ArrayList<RecipeContest> list, String pageNavi, int start, int totalCount, int orderIndex) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
		this.start = start;
		this.totalCount = totalCount;
		this.orderIndex = orderIndex;
	}
	public ContestPageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}

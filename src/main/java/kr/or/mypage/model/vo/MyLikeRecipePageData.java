package kr.or.mypage.model.vo;

import java.util.ArrayList;
import lombok.Data;

@Data
public class MyLikeRecipePageData {
	private ArrayList<LikeRecipe> list;
	private String pageNavi;
	private int start;
	private int totalCount;
	
	
	public MyLikeRecipePageData(ArrayList<LikeRecipe> list, String pageNavi, int start, int totalCount) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
		this.start = start;
		this.totalCount = totalCount;
	}


	public MyLikeRecipePageData() {
		super();
		// TODO Auto-generated constructor stub
	}
}

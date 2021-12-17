package kr.or.main.model.vo;

import java.util.ArrayList;

import kr.or.cookingCls.model.vo.CookingCls;
import kr.or.freeboard.model.vo.Freeboard;
import kr.or.member.model.vo.Member;
import kr.or.recipe.model.vo.RecipeBoard;
import lombok.Data;

@Data
public class MainSearchResult {
	private ArrayList<RecipeBoard> recipeList;
	private ArrayList<Member> memberList;
	private ArrayList<CookingCls> classList;
	private ArrayList<Freeboard> freeList;
	//밀키트도 추후 추가
}

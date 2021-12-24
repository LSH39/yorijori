package kr.or.main.model.vo;

import java.util.ArrayList;

import kr.or.cookingCls.model.vo.CookingCls;
import kr.or.freeboard.model.vo.Freeboard;
import kr.or.member.model.vo.Member;
import kr.or.milkit.model.vo.Product;
import kr.or.recipe.model.vo.RecipeBoard;
import lombok.Data;

@Data
public class MainSearchResult {
	private ArrayList<RecipeBoard> recipeList;  //제목
	private ArrayList<Member> memberList;     //아이디or닉네임
	private ArrayList<CookingCls> classList; //제목
	private ArrayList<Freeboard> freeList;	//제목
	private ArrayList<Product> productList; //제목
}

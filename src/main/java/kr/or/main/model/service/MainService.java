package kr.or.main.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.cookingCls.model.vo.CookingCls;
import kr.or.freeboard.model.vo.Freeboard;
import kr.or.main.model.dao.MainDao;
import kr.or.main.model.vo.MainSearchResult;
import kr.or.main.model.vo.MainViewData;
import kr.or.member.model.vo.Member;
import kr.or.milkit.model.vo.Product;
import kr.or.recipe.model.vo.RecipeBoard;
import kr.or.recipecontest.model.vo.ContestPageData;
import kr.or.recipecontest.model.vo.RecipeContest;

@Service
public class MainService {
	@Autowired
	private MainDao dao;

	public MainSearchResult mainpageSearch(String keyword) {
		ArrayList<RecipeBoard> recipeList = dao.selectRecipeList(keyword);
		ArrayList<Member> memberList = dao.selectMemberList(keyword);
		ArrayList<CookingCls> classList = dao.selectClassList(keyword);
		ArrayList<Freeboard> freeList = dao.selectFreeList(keyword);
		ArrayList<Product> productList = dao.selectProductList(keyword);
		MainSearchResult msr = new MainSearchResult();
		msr.setRecipeList(recipeList);
		msr.setMemberList(memberList);
		msr.setClassList(classList);
		msr.setFreeList(freeList);
		msr.setProductList(productList);
		return msr;
	}

	public MainViewData getMainViewData() {
		ArrayList<Product> productList = dao.selectProductList();
		ArrayList<Member> yoriList = dao.selectYoriList();
		ArrayList<Member> joriList = dao.selectJoriList();
		MainViewData mvd = new MainViewData();
		mvd.setProductList(productList);
		mvd.setYoriList(yoriList);
		mvd.setJoriList(joriList);
		return mvd;
	}

	
}

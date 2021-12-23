package kr.or.main.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.cookingCls.model.vo.CookingCls;
import kr.or.freeboard.model.vo.Freeboard;
import kr.or.main.model.dao.MainDao;
import kr.or.main.model.vo.FollowingData;
import kr.or.main.model.vo.MainSearchResult;
import kr.or.main.model.vo.MainViewData;
import kr.or.main.model.vo.RecentProductData;
import kr.or.main.model.vo.RecipeListData;
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
		ArrayList<CookingCls> classList = dao.selectClassList();
		MainViewData mvd = new MainViewData();
		mvd.setProductList(productList);
		mvd.setYoriList(yoriList);
		mvd.setJoriList(joriList);
		mvd.setClassList(classList);
		return mvd;
	}

	public ArrayList<FollowingData> selectFollowingList(int memberNo) {
		ArrayList<FollowingData> list = dao.selectFollowingList(memberNo);
		return list;
	}

	public int insertFollow(int memberNo, int followNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("followNo", followNo);
		int result = dao.insertFollow(map);
		int followerCount = -1;
		if(result>0) {
			followerCount = dao.selectFollowerCount(followNo);
		}
		return followerCount;
	}

	public int deleteFollow(int memberNo, int followNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("followNo", followNo);
		int result = dao.deleteFollow(map);
		int followerCount = -1;
		if(result>0) {
			followerCount = dao.selectFollowerCount(followNo);
		}
		return followerCount;
	}

	public ArrayList<RecipeListData> selectBestRecipes(int category) {
		ArrayList<RecipeListData> rld = dao.selectBestRecipes(category);
		return rld;
	}

	public ArrayList<RecentProductData> selectRecentProducts(String memberId) {
		ArrayList<RecentProductData> rpd = dao.selectRecentProducts(memberId);
		return rpd;
	}

	public int insertRecentProduct(int productNo, String memberId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("productNo", productNo);
		map.put("memberId", memberId);
		int count = dao.selectRecentProducts(map);
		if(count>0) {
			dao.deleteRecentProduct(map);
		}
		int result = dao.insertRecentProduct(map);
		return result;
	}
	
}

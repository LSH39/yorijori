package kr.or.main.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.cookingCls.model.vo.CookingCls;
import kr.or.freeboard.model.vo.Freeboard;
import kr.or.main.model.vo.FollowingData;
import kr.or.main.model.vo.RecipeListData;
import kr.or.member.model.vo.Member;
import kr.or.milkit.model.vo.Product;
import kr.or.recipe.model.vo.RecipeBoard;

@Repository
public class MainDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<RecipeBoard> selectRecipeList(String keyword) {
		List<RecipeBoard> list = sqlSession.selectList("main.selectRecipeList", keyword);
		return (ArrayList<RecipeBoard>) list;
	}
	
	public ArrayList<Member> selectMemberList(String keyword) {
		List<Member> list = sqlSession.selectList("main.selectMemberList", keyword);
		return (ArrayList<Member>) list;
	}
	
	public ArrayList<CookingCls> selectClassList(String keyword) {
		List<CookingCls> list = sqlSession.selectList("main.selectClassList", keyword);
		return (ArrayList<CookingCls>) list;
	}
	
	public ArrayList<Freeboard> selectFreeList(String keyword) {
		List<Freeboard> list = sqlSession.selectList("main.selectFreeboardList", keyword);
		return (ArrayList<Freeboard>) list;
	}
	
	public ArrayList<Product> selectProductList(String keyword) {
		List<Product> list = sqlSession.selectList("main.selectProductList", keyword);
		return (ArrayList<Product>) list;
	}

	public ArrayList<Product> selectProductList() {
		List<Product> list = sqlSession.selectList("main.selectProductList2");
		return (ArrayList<Product>) list;
	}

	public ArrayList<Member> selectYoriList() {
		List<Member> list = sqlSession.selectList("main.selectYoriList");
		return (ArrayList<Member>) list;
	}

	public ArrayList<Member> selectJoriList() {
		List<Member> list = sqlSession.selectList("main.selectJoriList");
		return (ArrayList<Member>) list;
	}

	public ArrayList<CookingCls> selectClassList() {
		List<CookingCls> list = sqlSession.selectList("main.selectClassList2");
		return (ArrayList<CookingCls>) list;
	}

	public ArrayList<FollowingData> selectFollowingList(int memberNo) {
		List<FollowingData> list = sqlSession.selectList("main.selectFollowingList", memberNo);
		return (ArrayList<FollowingData>) list;
	}

	public int insertFollow(HashMap<String, Object> map) {
		int result = sqlSession.insert("main.insertFollow", map);
		return result;
	}

	public int selectFollowerCount(int followNo) {
		int followerCount = sqlSession.selectOne("main.selectFollowerCount", followNo);
		return followerCount;
	}

	public int deleteFollow(HashMap<String, Object> map) {
		int result = sqlSession.delete("main.deleteFollow", map);
		return result;
	}

	public ArrayList<RecipeListData> selectBestRecipes(int category) {
		List<RecipeListData> rld = sqlSession.selectList("main.bestRecipes", category);
		return (ArrayList<RecipeListData>) rld;
	}
}

package kr.or.recipecontest.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.recipecontest.model.vo.RecipeContest;

@Repository
public class RecipeContestDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int selectTotalCount() {
		int totalCount = sqlSession.selectOne("recipecontest.totalCount");
		return totalCount;
	}

	public ArrayList<RecipeContest> selectContestList(HashMap<String, Object> map) {
		List<RecipeContest> list = sqlSession.selectList("recipecontest.selectList", map);
		return (ArrayList<RecipeContest>) list;
	}

	public int voteCheck(int memberNo) {
		int result = sqlSession.selectOne("recipecontest.selectVote", memberNo);
		return result;
	}

	public int insertVote(HashMap<String, Object> map) {
		int result = sqlSession.insert("recipecontest.insertVote", map);
		return result;
	}

	public int selectContestNo(int memberNo) {
		int contestNo = sqlSession.selectOne("recipecontest.selectContestNo", memberNo);
		return contestNo;
	}

	public ArrayList<RecipeContest> searchContestList(HashMap<String, Object> map) {
		List<RecipeContest> searchList = sqlSession.selectList("recipecontest.searchList", map);
		return (ArrayList<RecipeContest>) searchList;
	}

	public int selectTotalCount(String searchtype, String searchword) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("searchtype", searchtype);
		map.put("searchword", searchword);
		int totalCount = sqlSession.selectOne("recipecontest.searchCount", map);
		return totalCount;
	}

}

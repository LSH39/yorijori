package kr.or.recipecontest.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.SqlSessionUtils;
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

}

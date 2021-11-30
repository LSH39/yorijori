package kr.or.recipe.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.recipe.model.vo.RecipeBoard;


@Repository
public class RecipeDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<RecipeBoard> selectRecipeList() {
		List<RecipeBoard>list = sqlSession.selectList("recipe.selectRecipeList"); 
		return (ArrayList<RecipeBoard>)list;
	}
}

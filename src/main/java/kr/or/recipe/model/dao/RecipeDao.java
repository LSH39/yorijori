package kr.or.recipe.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.recipe.model.vo.Material;
import kr.or.recipe.model.vo.RecipeBoard;
import kr.or.recipe.model.vo.RecipeContent;


@Repository
public class RecipeDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<RecipeBoard> selectRecipeList() {
		List<RecipeBoard>list = sqlSession.selectList("recipe.selectRecipeList"); 
		return (ArrayList<RecipeBoard>)list;
	}

	public int insertRecipeBoard(RecipeBoard rb) {
		return sqlSession.insert("recipe.insertRecipeBoard", rb);
		 
	}

	public int selectRecipeNo(RecipeBoard rb) {
		int result = sqlSession.selectOne("recipe.selectRecipeNo");
		return result;
	}
	public int insertMaterial(Material m) {
		return sqlSession.insert("recipe.insertMaterial",m);
	}

	public int insertContent(RecipeContent rc) {
		return sqlSession.insert("recipe.insertContent", rc);
	}


}

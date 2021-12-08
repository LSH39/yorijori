package kr.or.recipe.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.recipe.model.vo.Material;
import kr.or.recipe.model.vo.RecipeBoard;
import kr.or.recipe.model.vo.RecipeComment;
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

	public int selectRecipeNo() {
		return sqlSession.selectOne("recipe.selectRecipeNo");
	}
	public int insertMaterial(Material m) {
		return sqlSession.insert("recipe.insertMaterial",m);
	}

	public int insertContent(RecipeContent rc) {
		return sqlSession.insert("recipe.insertContent", rc);
	}

	
	public ArrayList<RecipeBoard> selectCategory1(String item) {
		List<RecipeBoard> list = sqlSession.selectList("recipe.selectCategory1", item);
		return (ArrayList<RecipeBoard>)list;
	}

	public ArrayList<RecipeBoard> selectCategory2(String item2) {
		List<RecipeBoard>list = sqlSession.selectList("recipe.selectCategory2",item2); 
		return (ArrayList<RecipeBoard>)list;
	}

	public ArrayList<RecipeBoard> selectCategory3(String item3) {
		List<RecipeBoard>list = sqlSession.selectList("recipe.selectCategory3",item3);
		return (ArrayList<RecipeBoard>)list;
	}
	
	public RecipeBoard selectOneRecipe(int recipeNo) {
		return sqlSession.selectOne("recipe.selectOneRecipe",recipeNo);
	}

	public ArrayList<RecipeContent> selectContent(int recipeNo) {
		List<RecipeContent>list = sqlSession.selectList("recipe.selectContent",recipeNo);
		return (ArrayList<RecipeContent>)list;
	}

	public ArrayList<Material> selectMaterial(int recipeNo) {
		List<Material>list = sqlSession.selectList("recipe.selectMaterial",recipeNo);
		return (ArrayList<Material>)list;
	}

	public ArrayList<RecipeComment> selectComment(int recipeNo) {
		List<RecipeComment>list = sqlSession.selectList("recipe.selectComment",recipeNo);
		return (ArrayList<RecipeComment>)list;
	}

	public int insertCommnet(RecipeComment rc) {
		return sqlSession.insert("recipe.insertComment",rc);
	}



}

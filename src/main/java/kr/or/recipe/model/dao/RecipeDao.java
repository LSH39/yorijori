package kr.or.recipe.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.recipe.model.vo.Material;
import kr.or.recipe.model.vo.RecipeBoard;
import kr.or.recipe.model.vo.RecipeComment;
import kr.or.recipe.model.vo.RecipeContent;
import kr.or.recipe.model.vo.RecipeLike;
import kr.or.recipe.model.vo.RecipeReport;


@Repository
public class RecipeDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<RecipeBoard> selectRecipeList(RecipeBoard rb) {
		List<RecipeBoard>list = sqlSession.selectList("recipe.selectRecipeList",rb); 
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

	public int deleteComment(int rCommentNo) {
		return sqlSession.delete("recipe.deleteComment", rCommentNo);
	}

	public int updateComment(RecipeComment rc) {
		return sqlSession.update("recipe.updateComment", rc);
	}

	public int updateCount(RecipeBoard rb) {
		return sqlSession.update("recipe.updateCount", rb);
	}

	public int insertLike(RecipeLike rl) {
		return sqlSession.insert("recipe.insertLike", rl);
	}

	public RecipeBoard selectOneRecipe(HashMap<String, Object> map) {
		return sqlSession.selectOne("recipe.selectOneRecipe",map);
	}

	public int deleteLike(RecipeLike rl) {
		return sqlSession.delete("recipe.deleteLike", rl);
	}

	public int insertReport(RecipeReport rp) {
		return sqlSession.insert("recipe.insertReport", rp);
	}



}

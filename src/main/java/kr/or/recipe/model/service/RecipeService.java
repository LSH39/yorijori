package kr.or.recipe.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.member.model.vo.Member;
import kr.or.milkit.model.vo.product;
import kr.or.recipe.model.dao.RecipeDao;
import kr.or.recipe.model.vo.Material;
import kr.or.recipe.model.vo.RecipeBoard;
import kr.or.recipe.model.vo.RecipeComment;
import kr.or.recipe.model.vo.RecipeContent;
import kr.or.recipe.model.vo.RecipeLike;
@Service
public class RecipeService {
	@Autowired
	private RecipeDao dao;


	public ArrayList<RecipeBoard> selectRecipeList(RecipeBoard rb) {
		ArrayList<RecipeBoard>list = dao.selectRecipeList(rb);
		return list;
	}


	public int insertRecipe(RecipeBoard rb, RecipeContent rc, Material m) {
		int result = dao.insertRecipeBoard(rb);
		int recipeNo = 0;
		if(result>0) {
			recipeNo = dao.selectRecipeNo();
			if(recipeNo>0) {
			m.setRecipeNo(recipeNo);
			result = dao.insertMaterial(m);
			  if(result>0) {
				  rc.setRecipeNo(recipeNo);
				  result = dao.insertContent(rc);
			  }
			}
		}
		return result;
	}


	public RecipeBoard selectOneRecipe(int recipeNo) {
		RecipeBoard rb = dao.selectOneRecipe(recipeNo);
		ArrayList<Material>mList = dao.selectMaterial(recipeNo);
		ArrayList<RecipeContent>rList = dao.selectContent(recipeNo);
		if(rb != null) {
			int result = dao.updateCount(rb);
		}
		rb.setMList(mList);
		rb.setRList(rList);
		return rb;
	}


	public ArrayList<RecipeComment> selectComment(int recipeNo) {
		ArrayList<RecipeComment>list = dao.selectComment(recipeNo);
		return list;
	}


	public int insertComment(RecipeComment rc) {
		int result = dao.insertCommnet(rc);
		return result;
	}


	public int deleteComment(int rCommentNo) {
		int result = dao.deleteComment(rCommentNo);
		return result;
	}


	public int updateComment(RecipeComment rc) {
		int result = dao.updateComment(rc);
		return result;
	}


	public int insertLike(RecipeBoard rb) {
		int result = dao.insertLike(rb);
		return result;
	}
}
	


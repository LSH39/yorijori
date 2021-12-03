package kr.or.recipe.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.member.model.vo.Member;
import kr.or.milkit.model.vo.product;
import kr.or.recipe.model.dao.RecipeDao;
import kr.or.recipe.model.vo.Material;
import kr.or.recipe.model.vo.RecipeBoard;
import kr.or.recipe.model.vo.RecipeContent;
@Service
public class RecipeService {
	@Autowired
	private RecipeDao dao;


	public ArrayList<RecipeBoard> selectRecipeList() {
		ArrayList<RecipeBoard>list = dao.selectRecipeList();
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
		return rb;
	}


	public RecipeContent selectContent(int recipeNo) {
		RecipeContent rc = dao.selectContent(recipeNo);
		return rc;
	}


	public Material selectMaterial(int recipeNo) {
		Material m = dao.selectMaterial(recipeNo);
		return m;
	}


	public ArrayList<RecipeBoard> selectCategory1(String item) {
		ArrayList<RecipeBoard>list = dao.selectCategory1(item);
		return list;
	}
}

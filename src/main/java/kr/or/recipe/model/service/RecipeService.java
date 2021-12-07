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


	public ArrayList<RecipeBoard> selectCategory1(String item) {
		ArrayList<RecipeBoard>list = dao.selectCategory1(item);
		return list;
	}


	public ArrayList<RecipeBoard> selectCategory2(String item2) {
		ArrayList<RecipeBoard>list = dao.selectCategory2(item2);
		return list;
	}


	public ArrayList<RecipeBoard> selectCategory3(String item3) {
		ArrayList<RecipeBoard>list = dao.selectCategory3(item3);
		return list;
	}

	public RecipeBoard selectOneRecipe(int recipeNo) {
		RecipeBoard rb = dao.selectOneRecipe(recipeNo);
		ArrayList<Material>mList = dao.selectMaterial(recipeNo);
		ArrayList<RecipeContent>rList = dao.selectContent(recipeNo);
		rb.setMList(mList);
		rb.setRList(rList);
		return rb;
	}


	public ArrayList<RecipeComment> selectComment(int recipeNo) {
		ArrayList<RecipeComment>list = dao.selectComment(recipeNo);
		return list;
	}


	public int insertComment(int recipeNo, int memberNo) {
		// TODO Auto-generated method stub
		return 0;
	}


}
	


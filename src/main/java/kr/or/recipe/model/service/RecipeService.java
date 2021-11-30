package kr.or.recipe.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.milkit.model.vo.product;
import kr.or.recipe.model.dao.RecipeDao;
import kr.or.recipe.model.vo.RecipeBoard;
@Service
public class RecipeService {
	@Autowired
	private RecipeDao dao;


	public ArrayList<RecipeBoard> selectRecipeList() {
		ArrayList<RecipeBoard>list = dao.selectRecipeList();
		return list;
	}
}

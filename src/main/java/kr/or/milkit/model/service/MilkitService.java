package kr.or.milkit.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.milkit.model.dao.MilkitDao;
import kr.or.milkit.model.vo.Product;
import kr.or.recipe.model.vo.RecipeBoard;

@Service
public class MilkitService {
	@Autowired
	private MilkitDao dao;

	public ArrayList<RecipeBoard> selectRecipeList(int memberNo) {
		ArrayList<RecipeBoard>list = dao.selectRecipeList(memberNo);
		return list;
	}

	public ArrayList<Product> selectMilkitList() {
		ArrayList<Product> list = dao.selectMilkitList();
		return list;
	}
	
}

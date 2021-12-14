package kr.or.milkit.model.service;

import java.util.ArrayList;
import java.util.HashMap;

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
	public ArrayList<Product> selectMilkitList1() {
		ArrayList<Product> list = dao.selectMilkitList1();
		return list;
	}
	public ArrayList<Product> selectMilkitList2() {
		ArrayList<Product> list = dao.selectMilkitList2();
		return list;
	}
	public int insertMilkit(Product p) {
		int result = dao.insertMilkit(p);
		return result;
	}

	public int selectTotalCount() {
		int totalCount = dao.selectTotalCount();
		return totalCount;
	}
	public ArrayList<Product> selectMoreProduct(int start, int boardNo) {
		int length = 3;
		int end = start+length-1;
		HashMap<String, Object>map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		ArrayList<Product>list = dao.selectMoreProduct(map);
		return list;
	}

	
	
}

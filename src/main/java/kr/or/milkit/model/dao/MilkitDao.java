package kr.or.milkit.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.milkit.model.vo.Product;
import kr.or.recipe.model.vo.RecipeBoard;

@Repository
public class MilkitDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<RecipeBoard> selectRecipeList(int memberNo) {
		List<RecipeBoard>list = sqlSession.selectList("milkit.selectRecipeList",memberNo);
		return (ArrayList<RecipeBoard>)list;
	}

	public ArrayList<Product> selectMilkitList() {
		List<Product>list = sqlSession.selectList("milkit.selectMilkitList");
		return (ArrayList<Product>)list;
	}
}

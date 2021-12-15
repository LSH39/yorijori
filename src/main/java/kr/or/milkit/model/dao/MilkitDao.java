package kr.or.milkit.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
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
		List<RecipeBoard> list = sqlSession.selectList("milkit.selectRecipeList", memberNo);
		return (ArrayList<RecipeBoard>) list;
	}

	public ArrayList<Product> selectMilkitList1() {
		List<Product> list = sqlSession.selectList("milkit.selectMilkitList1");
		return (ArrayList<Product>) list;
	}

	public ArrayList<Product> selectMilkitList2() {
		List<Product> list = sqlSession.selectList("milkit.selectMilkitList2");
		return (ArrayList<Product>) list;
	}

	public int insertMilkit(Product p) {
		return sqlSession.insert("milkit.insertMilkit", p);
	}

	public int selectTotalCount() {
		return sqlSession.selectOne("milkit.selectTotalCount");
	}

	public ArrayList<Product> selectMoreProduct(HashMap<String, Object> map) {
		List<Product>list = sqlSession.selectList("milkit.selectMoreProduct",map);
			return (ArrayList<Product>)list;
	}

}

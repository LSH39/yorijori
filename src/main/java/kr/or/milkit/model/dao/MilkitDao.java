package kr.or.milkit.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.cart.model.vo.Cart;
import kr.or.milkit.model.vo.Product;
import kr.or.recipe.model.vo.RecipeBoard;
import kr.or.review.model.vo.Review;

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

	public ArrayList<Product> selectMoreProduct1(HashMap<String, Object> map) {
		List<Product>list = sqlSession.selectList("milkit.selectMoreProduct1",map);
			return (ArrayList<Product>)list;
	}

	public ArrayList<Product> selectMoreProduct2(HashMap<String, Object> map) {
		List<Product>list = sqlSession.selectList("milkit.selectMoreProduct2",map);
			return  (ArrayList<Product>)list;
	}

	public Product selectOneProduct(int productNo) {
		return sqlSession.selectOne("milkit.selectOneProduct",productNo);
	}

	public ArrayList<Review> selectReview(int productNo) {
		List<Review>list = sqlSession.selectList("milkit.selectReview",productNo);
		return (ArrayList<Review>)list;
	}

	public ArrayList<RecipeBoard> selectRecipeBoard(int recipeNo) {
		List<RecipeBoard>list = sqlSession.selectList("milkit.selectRecipeBoard", recipeNo);
		return (ArrayList<RecipeBoard>)list;
	}

	public int deleteMilkit(int productNo) {
		return sqlSession.update("milkit.deleteMilkit",productNo);
	}

	public int updateMilkit(Product p) {
		return sqlSession.update("milkit.updateMilkit", p);
	}

	public int insertCart(Cart c) {
		return sqlSession.insert("milkit.insertCart", c);
	}


}

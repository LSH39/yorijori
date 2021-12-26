package kr.or.cart.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.cart.model.vo.Cart;

@Repository
public class CartDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Cart> cartList(int memberNo) {
		List<Cart> list = sqlSession.selectList("cart.cartList", memberNo);
		return (ArrayList<Cart>)list;
	}

	public int changeCart(Cart cart) {
		return sqlSession.update("cart.changeCart",cart);
	}

	public int deleteCart(int cartNo) {
		return sqlSession.delete("cart.deleteCart",cartNo);
	}

	public int selectStock(int productNo) {
		return sqlSession.selectOne("cart.selectStock",productNo);
	}
	
}

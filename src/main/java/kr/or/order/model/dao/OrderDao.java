package kr.or.order.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.cart.model.vo.Cart;
import kr.or.coupon.model.vo.CouponList;
import kr.or.member.model.vo.Member;
import kr.or.order.model.vo.Order;
import kr.or.order.model.vo.OrderOption;
import kr.or.point.model.vo.Point;

@Repository
public class OrderDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Cart> orderList(ArrayList<Integer> checkNo) {
		List list = sqlSession.selectList("order.orderList", checkNo);
		return (ArrayList<Cart>)list;
	}

	public Member orderMember(int memberNo) {
		return sqlSession.selectOne("member.orderMember", memberNo);
	}

	public ArrayList<CouponList> couponList(int memberNo) {
		List list = sqlSession.selectList("order.couponList", memberNo);
		ArrayList<CouponList> clist = (ArrayList<CouponList>)list;
		return (ArrayList<CouponList>)list;
	}

	public int orderInsert(Order order) {
		return sqlSession.insert("order.orderInsert",order);
	}

	public OrderOption orderProductInfo(Integer cartNo) {
		return sqlSession.selectOne("order.orderProductInfo",cartNo);
	}

	public int orderOptionInsert(OrderOption oo) {
		return sqlSession.insert("order.orderOptionInsert",oo);
	}

	public int deleteCart(Integer cartNo) {
		return sqlSession.delete("order.cartDelete", cartNo);
	}

	public int memberCouponUpdate(int couponNo) {
		return sqlSession.update("order.memberCouponUpdate", couponNo);
	}

	public int memberPointUpdate(Member m) {
		return sqlSession.update("order.memberPointUpdate", m);
	}

	public int pointUpdate(Point p) {
		return sqlSession.update("order.pointUpdate", p);
	}

	
	
}

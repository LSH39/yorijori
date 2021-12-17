package kr.or.order.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.cart.model.vo.Cart;
import kr.or.coupon.model.vo.CouponList;
import kr.or.member.model.vo.Member;
import kr.or.order.model.dao.OrderDao;
import kr.or.order.model.vo.Order;
import kr.or.order.model.vo.OrderOption;
import kr.or.point.model.vo.Point;

@Service
public class OrderService {
	@Autowired
	private OrderDao dao;

	public ArrayList<Cart> orderList(ArrayList<Integer> checkNo) {
		return dao.orderList(checkNo);
	}

	public Member orderMember(int memberNo) {
		return dao.orderMember(memberNo);
	}

	public ArrayList<CouponList> couponList(int memberNo) {
		return dao.couponList(memberNo);
	}

	/*
	@Transactional
	public int orderInsert(ArrayList<Integer> cartNoList, Order order, String couponList, String point) {
		int result = 1;
		int result1 = dao.orderInsert(order);
		if(result1>0) {
			int orderNo = order.getOrderNo();
			for(int i=0; i<cartNoList.size(); i++) {
				int cartNo = cartNoList.get(i);
				OrderOption oo = dao.orderProductInfo(cartNo);
				oo.setOrderNo(orderNo);
				int result2 = dao.orderOptionInsert(oo);
				if(result2>0) {
					int result3 = dao.deleteCart(cartNo);
					if(result3>0) {
						result *= result3;
					}else {
						return -3;
					}
				}else {
					return -2;
				}
			}
			if(result>0) {
				if(!couponList.equals("no")) {
					int result4 = dao.memberCouponUpdate(Integer.parseInt(couponList));
					result *= result4;
				}else {
					return -4;
				}
				if(!point.equals("0")) {
					Member m = new Member();
					m.setMemberNo(order.getMemberNo());
					m.setMemberPoint(Integer.parseInt(point));
					int result5 = dao.memberPointUpdate(m);
					if(result5>0) {
						Point p = new Point();
						p.setMemberNo(order.getMemberNo());
						p.setPointAmount(Integer.parseInt(point));
						int result6 = dao.pointUpdate(p);
						if(result6>0){
							result*=result6;
						}else {
							return -6;
						}
					}else {
						return -5;
					}
				}
			}else {
				return -1;
			}
			return orderNo;  // 성공
		}else {
			return -1;
		}
	}
	*/
	
	@Transactional
	public int orderInsert(ArrayList<Integer> cartNoList, Order order, String couponList, String point) {
		int result = 1;
		int result1 = dao.orderInsert(order);
		if(result1>0) {
			int orderNo = order.getOrderNo();
			for(int i=0; i<cartNoList.size(); i++) {
				int cartNo = cartNoList.get(i);
				OrderOption oo = dao.orderProductInfo(cartNo);
				oo.setOrderNo(orderNo);
				int result2 = dao.orderOptionInsert(oo);
				if(result2>0) {
					int result3 = dao.deleteCart(cartNo);
					if(result3>0) {
						result *= result3;
					}else {
						return -3;
					}
				}else {
					return -2;
				}
			}
			if(result>0) {
				if(!couponList.equals("no")) {
					int result4 = dao.memberCouponUpdate(Integer.parseInt(couponList));
					if(result4>0) {
						result *= result4;						
					}else {
						return -4;
					}
				}
				if(!point.equals("0")) {
					Member m = new Member();
					m.setMemberNo(order.getMemberNo());
					m.setMemberPoint(Integer.parseInt(point));
					int result5 = dao.memberPointUpdate(m);
					if(result5>0) {
						Point p = new Point();
						p.setMemberNo(order.getMemberNo());
						p.setPointAmount(Integer.parseInt(point));
						int result6 = dao.pointUpdate(p);
						if(result6>0){
							result*=result6;
						}else {
							return -6;
						}
					}else {
						return -5;
					}
				}
			}else {
				return -1;
			}
			return orderNo;  // 성공
		}else {
			return -1;
		}
	}
}

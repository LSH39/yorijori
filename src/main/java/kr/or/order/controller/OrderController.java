package kr.or.order.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.cart.model.vo.Cart;
import kr.or.coupon.model.vo.CouponList;
import kr.or.member.model.vo.Member;
import kr.or.order.model.service.OrderService;
import kr.or.order.model.vo.Order;

@Controller
public class OrderController {
	@Autowired
	private OrderService service;
	
	@RequestMapping(value="/paymentFrm.do")
	public String orderCart(@RequestParam(value="checkNo") List<Integer> checkNo, int memberNo, Model model) {
		ArrayList<Cart> cartList = service.orderList((ArrayList<Integer>)checkNo);
		Member m = service.orderMember(memberNo);
		ArrayList<CouponList> couponList = service.couponList(memberNo);
		model.addAttribute("cartList",cartList);
		model.addAttribute("m", m);
		model.addAttribute("couponList", couponList);
		return "order/payment";
	}
	
	@RequestMapping(value="/order.do")
	public String order(@RequestParam(value="cartNoList") List<Integer> cartNoList, Order order, String couponList, String point, Model model) {
		int result = service.orderInsert((ArrayList<Integer>)cartNoList, order, couponList, point);
		if(result>0) {
			model.addAttribute("orderNo", result);
			model.addAttribute("memberNo", order.getMemberNo());
			return "order/paymentSuccess";
		}else {
			model.addAttribute("msg","에러 : "+result);
			model.addAttribute("loc","/cart.do");
			return "common/msg";
		}
	}
}

package kr.or.cart.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.cart.model.service.CartService;
import kr.or.cart.model.vo.Cart;
import kr.or.member.model.vo.Member;


@Controller
public class CartController {
	@Autowired
	private CartService service;
	
	@RequestMapping(value="/cart.do")
	public String cart(HttpSession session, Model model) {
		if(session.getAttribute("m")!=null) {
			Member sessionMember = (Member)session.getAttribute("m");
			int sessionMemberNo = sessionMember.getMemberNo();
			model.addAttribute("memberNo", sessionMemberNo);
			return "redirect:/cartList.do";
		}else {
			model.addAttribute("msg","로그인 후 이용가능합니다.");
			model.addAttribute("loc","/loginFrm.do");
			return "common/msg";
		}
	}
	@RequestMapping(value="/cartList.do")
	public String cartList(int memberNo, Model model) {
		ArrayList<Cart> list = service.cartList(memberNo);
		model.addAttribute("list",list);
		return "cart/cart";
	}
	@ResponseBody
	@RequestMapping(value="/changeCart.do")
	public String changeCart(Cart cart) {
		int result = service.changeCart(cart);
		if(result>0) {
			return "1";
		}else {
			return "0";
		}
	}
	@ResponseBody
	@RequestMapping(value="/deleteCart.do")
	public String deleteCart(int[] arr) {
		int result = service.deleteCart(arr);
		if(result>0) {
			return "1";
		}else {
			return "0";
		}
	}
}

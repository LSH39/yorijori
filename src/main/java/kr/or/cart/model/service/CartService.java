package kr.or.cart.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.cart.model.dao.CartDao;
import kr.or.cart.model.vo.Cart;


@Service
public class CartService {
	@Autowired
	private CartDao dao;

	public ArrayList<Cart> cartList(int memberNo) {
		return dao.cartList(memberNo);
	}

	public int changeCart(Cart cart) {
		return dao.changeCart(cart);
	}

	@Transactional
	public int deleteCart(int[] arr) {
		int result = 0;
		for(int i=0; i<arr.length; i++) {
			int cartNo = arr[i];
			int result2 = dao.deleteCart(cartNo);
			result += result2;
		}
		return result;
	}
}

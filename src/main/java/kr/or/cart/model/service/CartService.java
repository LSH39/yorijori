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
		ArrayList<Cart> cartList = dao.cartList(memberNo);
		// 중복 상품 표시 X
		ArrayList<Cart> newCartList = new ArrayList<Cart>();
		int [] productNo = new int[cartList.size()];
		int checkNo = 0;
		for(int i=0; i<cartList.size(); i++) {
			int pNo = cartList.get(i).getProductNo();
			for(int j=0; j<productNo.length; j++) {
				if(productNo[j] == pNo) {
					checkNo = 1;
					break;
				}
			}//
			if(checkNo != 1) {
				productNo[i] = pNo;
				newCartList.add(cartList.get(i));
			}
		}
		return newCartList;
	}
	
	@Transactional
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

	public int selectStock(int productNo) {
		return dao.selectStock(productNo);
	}
}

package kr.or.cart.model.vo;

import lombok.Data;

@Data
public class Cart {
	private int cartNo;
	private int memberNo;
	private int productNo;
	private int productAmount;
	private int productPrice;
}

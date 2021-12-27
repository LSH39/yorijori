package kr.or.cart.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Cart {
	private int cartNo;
	private int memberNo;
	private int productNo;
	private int productAmount;
	private int productPrice;
	// 추가
	private String sellerNickname;
	private int recipeNo;
	private String milkitName;
	private int milkitPrice;
	private String productFilepath;
	
	public Cart(int cartNo, int memberNo, int productNo, int productAmount, int productPrice) {
		super();
		this.cartNo = cartNo;
		this.memberNo = memberNo;
		this.productNo = productNo;
		this.productAmount = productAmount;
		this.productPrice = productPrice;
	}
	
	
}

package kr.or.order.model.vo;

import lombok.Data;

@Data
public class OrderOption {
	private int orderOptionNo;
	private int orderNo;
	private int productNo;
	private int orderOptionAmount;
}

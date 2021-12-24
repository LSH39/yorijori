package kr.or.main.model.vo;

import lombok.Data;

@Data
public class RecentProductData {
	private int rpNo;
	private int productNo;
	private String memberId;
	private String productName;
	private String productPrice;
	private String productComment;
	private String productPath;
	private String regDate;
}

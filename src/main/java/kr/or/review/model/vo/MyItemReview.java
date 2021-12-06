package kr.or.review.model.vo;

import lombok.Data;

@Data
public class MyItemReview {
	private int reviewNo;
	private int reviewFlag;
	private int memberNo;
	private int productNo;
	private String reviewContent;
	private int reviewRate;
	private String reviewDate;
	private String milkitName;
}

package kr.or.review.model.vo;

import lombok.Data;

@Data
public class MyClassReview {
	private int reviewNo;
	private int reviewFlag;
	private int classNo;
	private int productNo;
	private String reviewContent;
	private int reviewRate;
	private String reviewDate;
	private String classTitle;
}

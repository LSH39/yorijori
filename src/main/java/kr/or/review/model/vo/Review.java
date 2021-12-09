package kr.or.review.model.vo;

import lombok.Data;

@Data
public class Review {
	//롬복 라이브러리 생성자, gt, st 자동으로 생성
	private int reviewNo;
	private int classNo;
	private int productNo;
	private String memberNickname;
	private String reviewContent;
	private int reviewRate;
	private int reviewFlag;
	private String reviewDate;
}

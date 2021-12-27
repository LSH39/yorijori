package kr.or.admin.model.vo;

import lombok.Data;

@Data
public class Report {
	private String memberNo;
	private String memberId;
	private int recipeNo;
	private String recipeTitle;
	private String reportComment;
}

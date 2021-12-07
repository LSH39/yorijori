package kr.or.mypage.model.vo;

import lombok.Data;

@Data
public class FollowList {
	private int followingNo;
	private int memberNo;
	private int followNo;
	private int recipeWriter;
	private String recipeTitle;
	private String filepath;
	private String recipeDate;
	private String subhead;
	private String memberNickname;

}

package kr.or.admin.model.vo;

import lombok.Data;

@Data
public class Member2 {
	private int memberNo;
	private String memberId;
	private String memberPw;
	private String memberEmail;
	private String memberName;
	private String memberNickname;
	private String memberPhone;
	private String memberBirth;
	private String postcode;
	private String addressRoad;
	private String addressDetail;
	private String memberConsent;
	private String profilePath;
	private String profileIntro;
	private String certificatePath;
	private String memberLevel;
	private int memberPoint;
	private String enrollDate;
	private String withdrawDate;
	private String memberBlack;
	private int boardCount;
	private int recipeCount;
	private int fcCount;
}

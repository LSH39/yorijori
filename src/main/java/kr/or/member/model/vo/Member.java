package kr.or.member.model.vo;

import lombok.Data;

@Data
public class Member {
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
	private int memberConsent;
	private String profilePath;
	private String profileIntro;
	private String certificatePath;
	private int memberLevel;
	private int memberPoint;
	private String enrollDate;
	private String withdrawDate;
	private int memberBlack;
}

package kr.or.member.model.vo;

import lombok.Data;

@Data
public class ReadMember {
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
	private int dmCount;

	public String getGrade(){
		if(memberLevel == 1) {
			return "요리꾼";
		}else if(memberLevel == 2) {
			return "조리꾼";
		}else if(memberLevel == 3) {
			return "관리자";
		}else if(memberLevel == 4) {
			return "미인증(조리꾼)";
		}else if(memberLevel == 5) {
			return "탈퇴요청(조리꾼)";
		}else if(memberLevel == 6) {
			return "재인증이 필요합니다";
		}else {
			return null;
		}
	}

	
}

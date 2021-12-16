package kr.or.mypage.model.vo;

import lombok.Data;

@Data
public class Mypoint {
	private int pointNo;
	private int memberNo;
	private int pointLevel;
	private int pointAmount;
	private String pointDate;
	private String pointContent;
	private String sumPoint;
	public String getUsePoint(){
		if(pointLevel == 1) {
			return "적립완료";
		}else if(pointLevel == 2) {
			return "사용";
		}else if(pointLevel == 3) {
			return "사용취소";
		}else {
			return null;
		}
	}
}

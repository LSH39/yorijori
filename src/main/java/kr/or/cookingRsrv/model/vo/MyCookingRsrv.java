package kr.or.cookingRsrv.model.vo;

import lombok.Data;

@Data
public class MyCookingRsrv {
	
	private int rsrvNo;
	private String memberNickname;
	private String classTitle;
	private int classCurrNop;
	private String classStart;
	private String classEnd;
	private int classPrice;
	private String classStartTime;
	private String classEndTime;
	private String classLocation1;
	private String classLocation2;
	private int classStatus;

	public String getClassStu(){
		if(classStatus == 1) {
			return "인원모집중";
		}else if(classStatus == 2) {
			return "예약마감";
		}else if(classStatus == 3) {
			return "클래스 진행중";
		}else if(classStatus == 4) {
			return "클래스 종강";
		}else if(classStatus == 5) {
			return "클래스 페강";
		}else {
			return null;
		}
	}
	
}

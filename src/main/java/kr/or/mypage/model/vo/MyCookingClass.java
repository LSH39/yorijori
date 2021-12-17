package kr.or.mypage.model.vo;

import lombok.Data;
@Data
public class MyCookingClass {
	private int classNo;
	private String memberNickname;
	private String classTitle;
	private String classContent;
	private String classStart;
	private String classEnd;
	private int classPrice;
	private double classRate;
	private int classNop;
	private int classCurrNop;
	private int classStatus;
	private String classRegDate;
	private String classStartTime;
	private String classEndTime;
	private String classLocation1;
	private String classLocation2;
	
	
	//줄바꿈 적용 시키려고 만든 getter
	public String getClassContentBr() {
		return classContent.replaceAll("\r\n", "<br>");
	}
}

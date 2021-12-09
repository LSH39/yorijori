package kr.or.cookingCls.model.vo;

import lombok.Data;

@Data
public class CookingCls {
	//롬복 라이브러리 생성자, gt, st 자동으로 생성
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
	private String classTime;
	private String classLocation;
}

package kr.or.point.model.vo;

import lombok.Data;

@Data
public class Point {
	private int pointNo;
	private int memberNo;
	private int pointLevel;
	private int pointAmount;
	private String pointDate;
}

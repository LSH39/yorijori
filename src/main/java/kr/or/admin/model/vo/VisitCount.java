package kr.or.admin.model.vo;

import lombok.Data;

@Data
public class VisitCount {
	private String visitDate;
	private int visitCount;
	private int loginCount;
}

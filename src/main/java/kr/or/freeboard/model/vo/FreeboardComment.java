package kr.or.freeboard.model.vo;

import lombok.Data;

@Data
public class FreeboardComment {
	private int fcNo;
	private int freeNo;
	private String fcWriter;
	private String fcContent;
	private String regDate;
}

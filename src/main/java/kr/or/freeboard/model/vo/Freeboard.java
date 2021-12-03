package kr.or.freeboard.model.vo;

import lombok.Data;

@Data
public class Freeboard {
	private int freeNo;
	private String freeWriter;
	private String freeTitle;
	private String freeContent;
	private String regDate;
	private int freeReadcount;
}

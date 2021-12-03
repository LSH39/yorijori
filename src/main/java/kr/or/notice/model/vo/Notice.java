package kr.or.notice.model.vo;

import lombok.Data;

@Data
public class Notice {
	private int noticeNo;
	private String noticeWriter;
	private String noticeTitle;
	private String noticeContent;
	private String noticePriority;
	private String regDate;
	private int noticeReadcount;
	private String filename;
	private String filepath;
}

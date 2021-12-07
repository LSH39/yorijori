package kr.or.mypage.model.vo;

import java.util.Date;

import lombok.Data;
@Data
public class Mychat {
	private int chatNo;
	private int chatSend;
	private int chatRecive;
	private String chatContent;
	private Date chatDate;
	private String memberId;
	private String profilePath;
}

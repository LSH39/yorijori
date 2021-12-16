package kr.or.chat.model.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Chat {
	private int chatNo;
	private int chatSend;
	private int chatReceive;
	private String chatContent;
	private Date chatDate;
	// 추가
	private String strDate;
	private String memberNickname;
	
}

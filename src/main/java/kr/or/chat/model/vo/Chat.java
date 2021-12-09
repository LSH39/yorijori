package kr.or.chat.model.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Chat {
	private int chatNo;
	private int chatSend;
	private int chatRecive;
	private String chatContent;
	private Date chatDate;
	
	public String getChatContentBr() {
		return chatContent.replaceAll("\r\n", "<br>");
	}
}

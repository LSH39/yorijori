package kr.or.chat.model.vo;

import lombok.Data;

@Data
public class ChatBot {
	private int chatbotNo;
	private String chatKeyword;
	private String chatContent;
	
	public String getChatContentBr() {
		return chatContent.replaceAll("\r\n", "<br>");
	}
}
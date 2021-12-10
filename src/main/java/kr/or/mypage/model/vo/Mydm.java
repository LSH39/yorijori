package kr.or.mypage.model.vo;

import lombok.Data;

@Data
public class Mydm {
	private int dmNo;
	private int memberNo;
	private String dmReceiver;
	private String dmSender;
	private String dmContent;
	private int dmReadFlag;
	private String dmDate;
}

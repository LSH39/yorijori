package kr.or.dm.model.vo;

import lombok.Data;

@Data
public class Dm {
	//롬복 라이브러리 생성자, gt, st 자동으로 생성
	private int dmNo;
	private int classNo;
	private String dmReceiver;
	private String dmSender;
	private String dmContent;
	private int dmReadFlag;
	private int dmRoomNo;
	private String dmDate;
}

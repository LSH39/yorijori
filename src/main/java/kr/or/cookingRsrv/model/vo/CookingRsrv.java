package kr.or.cookingRsrv.model.vo;

import lombok.Data;

@Data
public class CookingRsrv {
	//롬복 라이브러리 생성자, gt, st 자동으로 생성
	private int rsrvNo;
	private String memberNickname;
	private int classNo;
	private String impUid;
	private String rsrvDate;
	private int cancelFlag;
}

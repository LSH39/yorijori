package kr.or.recipecontest.model.vo;

import lombok.Data;

@Data
public class ContestViewData {
	private int contestNo;
	private int recipeNo;
	private int recipeWriterNo;		//작성자 회원번호
	private String recipeTitle;		//레시피 제목
	private String filepath;		//레시피 이미지 경로
	private String recipeContent;	//레시피 설명
	private String recipeDate;		//레시피 작성날짜
	private String foodName;		//음식 이름
	private String enterDate;		//경연 참가일자
	private int readCount;			//레시피 조회수
	private int contestResult;
	private String contestMonth;	//경연 년월
	private int recipeDelete;
	private int voteCount;			//받은 투표수
}

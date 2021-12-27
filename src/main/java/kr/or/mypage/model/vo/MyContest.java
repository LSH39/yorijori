package kr.or.mypage.model.vo;

import lombok.Data;

@Data
public class MyContest {
	
	private int contestNo;
	private String contestMonth;
	private String enterDate;
	private int contestResult;
	private int recipeWriter;
	private String recipeTitle;
	
	public String getWinResult(){
		if(contestResult == 1) {
			return "1등";
		}else if(contestResult == 2) {
			return "2등";
		}else if(contestResult == 3) {
			return "3등";
		}else if(contestResult == 4) {
			return "투표수 30이상";
		}else if(contestResult == 9) {
			return "참가";
		}else if(contestResult == 0) {
			return "투표진행중";
		}else {
			return null;
		}
}
}
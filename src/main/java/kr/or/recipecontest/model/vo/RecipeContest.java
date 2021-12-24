package kr.or.recipecontest.model.vo;

import lombok.Data;

@Data
public class RecipeContest {
	private int contestNo;
	private int recipeNo;
	private String recipeTitle;		//레시피 제목
	private String recipePath;		//레시피 이미지 경로
	private String recipeContent;	//레시피 설명
	private String memberNickname; //회원 닉네임
	private String memberId;		//회원 아이디
	private String profilePath;		//회원 프로필 이미지 경로
	private String enterDate;		//경연 참가일자
	private int contestResult;
	private String contestMonth;
	private int recipeDelete;
	private int voteCount;			//받은 투표수
}

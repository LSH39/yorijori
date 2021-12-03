package kr.or.recipecontest.model.vo;

import lombok.Data;

@Data
public class ContestVote {
	private int voteNo;
	private int memberNo;
	private int contestNo;
	private String voteDate;
}

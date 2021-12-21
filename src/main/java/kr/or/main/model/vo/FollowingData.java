package kr.or.main.model.vo;

import lombok.Data;

@Data
public class FollowingData {
	private int following;
	private int memberNo;
	private int followNo;
	private String followingNick;
	private int followingCount;
	private int followerCount;
}

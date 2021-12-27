package kr.or.membership.model.vo;

import lombok.Data;

@Data
public class Membership {
	private int membershipNo;
	private String membershipLevel;
	private int membershipDate;
	private int membershipPrice;

}

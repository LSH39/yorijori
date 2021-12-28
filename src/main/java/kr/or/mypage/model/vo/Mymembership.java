package kr.or.mypage.model.vo;
import lombok.Data;

@Data
public class Mymembership {
	private int membershipNo;
	private String membershipLevel;
	private int membershipDate;
	private int membershipPrice;
	private int paymentNo;
	private int memberNo;
 //결제
	private int payAmount;
	private String payDate;
	private String membershipEnd;
	private String impNo;
	private String memberName;
	private String memberPhone;
	private String postcode;
	private String addressRoad;
	private String addressDetail;
	private String subStatus;  //구독상태

}

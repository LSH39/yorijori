package kr.or.mypage.model.vo;
import lombok.Data;

@Data
public class MyItem {
	private int productNo;
	private int recipeNo;
	private int milkitWriter;
	private String milkitName;
	private int milkitPrice;
	private String filepath;
	private String milkitDate;
	private int milkitStock;
	
}

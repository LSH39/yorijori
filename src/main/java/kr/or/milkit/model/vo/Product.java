package kr.or.milkit.model.vo;

import lombok.Data;

@Data
public class product {
	private int productNo;
	private int recipeNo;
	private int milkitWriter;
	private String milkitName;
	private int milkitPrice;
	private String milkitComment;
	private String filepath;
	private String milkitContent;
	private String milkitDate;
	private int milkitStock;
	private int milkitDelete;
}

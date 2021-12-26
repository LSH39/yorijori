package kr.or.milkit.model.vo;

import java.util.ArrayList;

import kr.or.recipe.model.vo.RecipeBoard;
import kr.or.review.model.vo.Review;
import lombok.Data;

@Data
public class Product {

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
	private String nickname;
	private ArrayList<Review> rList;
	private ArrayList<RecipeBoard> rbList;
	private String memberId;
}


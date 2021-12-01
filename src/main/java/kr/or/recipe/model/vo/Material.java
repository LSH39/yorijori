package kr.or.recipe.model.vo;

import lombok.Data;

@Data
public class Material {
	private int materialNo;
	private int recipeNo;
	private String materialName;
	private String mAmount;
	
	private String[] mNameList;
	private String[] mAmountList;
}

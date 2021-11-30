package kr.or.cookingCls.model.vo;

import lombok.Data;

@Data
public class CookingClsPicVO {
	//롬복 라이브러리 생성자, gt, st 자동으로 생성
	private int classFileNo;
	private int classNo;
	private String classFilename;
	private String classFilepath;
}

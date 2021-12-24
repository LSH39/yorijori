package kr.or.main.model.vo;

import java.util.ArrayList;

import kr.or.cookingCls.model.vo.CookingCls;
import kr.or.member.model.vo.Member;
import kr.or.milkit.model.vo.Product;
import lombok.Data;

@Data
public class MainViewData {
	private ArrayList<Product> productList; //신상품
	private ArrayList<Member> yoriList; //요리꾼
	private ArrayList<Member> joriList; //조리꾼
	private ArrayList<CookingCls> classList; //클래스
}

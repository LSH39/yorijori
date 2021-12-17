package kr.or.main.model.vo;

import java.util.ArrayList;

import kr.or.member.model.vo.Member;
import kr.or.milkit.model.vo.Product;
import lombok.Data;

@Data
public class MainViewData {
	private ArrayList<Product> productList;
	private ArrayList<Member> yoriList;
	private ArrayList<Member> joriList;
}

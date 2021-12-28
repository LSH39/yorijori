package kr.or.milkit.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.cart.model.vo.Cart;
import kr.or.milkit.model.dao.MilkitDao;
import kr.or.milkit.model.vo.Product;
import kr.or.recipe.model.vo.RecipeBoard;
import kr.or.review.model.vo.Review;

@Service
public class MilkitService {
	@Autowired
	private MilkitDao dao;

	public ArrayList<RecipeBoard> selectRecipeList(int memberNo) {
		ArrayList<RecipeBoard>list = dao.selectRecipeList(memberNo);
		return list;
	}
	public ArrayList<Product> selectMilkitList1() {
		ArrayList<Product> list = dao.selectMilkitList1();
		return list;
	}
	public ArrayList<Product> selectMilkitList2() {
		ArrayList<Product> list = dao.selectMilkitList2();
		return list;
	}
	public int insertMilkit(Product p) {
		int result = dao.insertMilkit(p);
		return result;
	}

	public int selectTotalCount() {
		int totalCount = dao.selectTotalCount();
		return totalCount;
	}
	public ArrayList<Product> selectMoreProduct(int start, int boardNo) {
		int length = 3;
		int end = start+length-1;
		HashMap<String, Object>map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		ArrayList<Product>list = null;
		if(boardNo == 1) {
			list = dao.selectMoreProduct1(map);
		}else if(boardNo == 2) {
			list = dao.selectMoreProduct2(map);
		}	
		return list;
	}
	public Product selectOneProduct(int productNo, int recipeNo) {
		Product p = dao.selectOneProduct(productNo);
		ArrayList<Review>rList = dao.selectReview(productNo);
		ArrayList<RecipeBoard>rbList =dao.selectRecipeBoard(recipeNo); 
		p.setRList(rList);
		p.setRbList(rbList);
		return p;
	}
	public int deleteMilkit(int productNo) {
		return dao.deleteMilkit(productNo);
	}
	public Product selectOneProduct2(int productNo) {
		Product p = dao.selectOneProduct(productNo);
		return p;
	}
	public int updateMilkit(Product p) {
		return dao.updateMilkit(p);
	}
	public int insertCart(Cart c) {
		return dao.insertCart(c);
	}
	
	//성승민 밀키트 리뷰 추가 12 27
	public ArrayList<Review> selectReviewPlist(int productNo) {
		// TODO Auto-generated method stub
		ArrayList<Review> list = dao.selectReviewPlist(productNo);
		return list;
	}
	
	//성승민 리뷰 작성 여부 확인
	public boolean selectOneReviewpChk(int productNo, String sessionMemberNickname) {
		// TODO Auto-generated method stub
		boolean reviewChk = false;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("productNo", productNo);
		map.put("sessionMemberNickname", sessionMemberNickname);
		Review review = dao.selectOneReviewpChk(map);
		if(review != null) {
			//리뷰 작성했을때
			reviewChk=true;
		}else {
			//리뷰 작성 안했을때
			reviewChk=false;
		}
		return reviewChk;
	}
	
	//성승민 밀키트 구매 여부 확인
	public int selectOnePurchaseChk(int productNo, int sessionMemberNo) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("productNo", productNo);
		map.put("sessionMemberNo", sessionMemberNo);
		int orderStat = dao.selectOnePurchaseChk(map);
		if(orderStat == 4) {
			return orderStat;
		}else {
			orderStat = -1;
			return orderStat;
		}
	}
	
	
}

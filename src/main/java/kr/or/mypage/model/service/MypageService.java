package kr.or.mypage.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.cookingRsrv.model.vo.MyCookingRsrv;
import kr.or.coupon.model.vo.MyCoupon;
import kr.or.member.model.vo.Member;
import kr.or.mypage.model.dao.MypageDao;
import kr.or.recipe.model.vo.RecipeBoard;
import kr.or.review.model.vo.MyClassReview;
import kr.or.review.model.vo.Review;
@Service
public class MypageService {
	@Autowired
	private MypageDao dao;
	
	public Member mypage(String memberId) {
		Member m =dao.mypage(memberId);
		return m;
	}

	public int upMember(Member m) {
		int result = dao.updateMember(m);
		return result;
	}

	public int deleteMember(Member m) {
		int result =dao.deleteMember(m);
		return result;
	}

/*
	public MyCoupon mycoupon(int memberNo) {
		MyCoupon mc =dao.myCoupon(memberNo);
		return mc;
	}
	*/
/*
	public RecipeBoard myRecipe(int recipeWriter) {
		RecipeBoard re= dao.myRecipe(recipeWriter);
		return re;
	}
*/
	public Member sellerPage(String memberId) {
		Member m =dao.sellerPage(memberId);
		return m;
	}
/*
	public MyCookingRsrv myclass(int memberNo) {
		MyCookingRsrv mcr =dao.myClass(memberNo);
		return mcr;
	}
*/
	/*
	public MyClassReview myclassReview(int memberNo) {
		MyClassReview mcrv =dao.myClassReview(memberNo);
		return null;
	}
*/
	public ArrayList<RecipeBoard> myRecipe(int recipeWriter) {
		ArrayList<RecipeBoard> list = dao.myRecipe(recipeWriter);
		return list;
	}

	public ArrayList<MyCoupon> mycoupon(int memberNo) {
		ArrayList<MyCoupon> list = dao.myCoupon(memberNo);
		return list;
	}

	public ArrayList<MyCookingRsrv> myclass(int memberNo) {
		ArrayList<MyCookingRsrv> list =dao.myClass(memberNo);
		return list;
	}

	public ArrayList<MyClassReview> myclassReview(int memberNo) {
		ArrayList<MyClassReview> list =dao.myClassReview(memberNo);
		return list;
	}

	

}

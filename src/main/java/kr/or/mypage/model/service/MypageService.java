package kr.or.mypage.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.coupon.model.vo.Coupon;
import kr.or.coupon.model.vo.CouponList;
import kr.or.coupon.model.vo.MyCoupon;
import kr.or.member.model.vo.Member;
import kr.or.mypage.model.dao.MypageDao;
import kr.or.recipe.model.vo.RecipeBoard;
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

	public Review classReview(String memberId) {
		Review r = dao.classReview(memberId);
		return r;
	}

	public MyCoupon mycoupon(int memberNo) {
		MyCoupon mc =dao.myCoupon(memberNo);
		return mc;
	}

	public RecipeBoard myRecipe(int recipeWriter) {
		RecipeBoard re= dao.myRecipe(recipeWriter);
		return re;
	}

	public Member sellerPage(String memberId) {
		Member m =dao.sellerPage(memberId);
		return m;
	}




}

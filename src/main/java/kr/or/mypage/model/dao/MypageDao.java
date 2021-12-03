package kr.or.mypage.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import kr.or.cookingRsrv.model.vo.MyCookingRsrv;
import kr.or.coupon.model.vo.Coupon;
import kr.or.coupon.model.vo.CouponList;
import kr.or.coupon.model.vo.MyCoupon;
import kr.or.member.model.vo.Member;
import kr.or.recipe.model.vo.RecipeBoard;
import kr.or.review.model.vo.Review;
@Repository
public class MypageDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/*마이페이지*/
	public Member mypage(String memberId) {
		return sqlSession.selectOne("mypage.mypage",memberId);
	}
    /*회원정보수정*/
	public int updateMember(Member m) {
		return sqlSession.update("mypage.updateMember",m);

	}
	 /*회원탈퇴*/
	public int deleteMember(Member m) {
		return sqlSession.delete("mypage.deleteMember",m);
	}

	/*클래스후기조회*/
	public Review classReview(String memberId) {
		return sqlSession.selectOne("mypage.classReview",memberId);
	}
	/*쿠폰조회*/
	public MyCoupon myCoupon(int memberNo) {
		return sqlSession.selectOne("mypage.myCoupon",memberNo);
	}
	/*내 레시피*/
	public RecipeBoard myRecipe(int recipeWriter) {
		return sqlSession.selectOne("mypage.myRecipe",recipeWriter);
	}
	/*내 예약내역*/
	public MyCookingRsrv myClass(int memberNo) {
		return sqlSession.selectOne("mypage.myClass",memberNo);
	}
	public Member sellerPage(String memberId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mypage.sellerPage",memberId);
	}


}

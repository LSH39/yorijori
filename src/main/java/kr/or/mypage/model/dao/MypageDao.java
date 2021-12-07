package kr.or.mypage.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.cookingRsrv.model.vo.MyCookingRsrv;
import kr.or.coupon.model.vo.MyCoupon;
import kr.or.member.model.vo.Member;
import kr.or.mypage.model.vo.ContestWin;
import kr.or.mypage.model.vo.LikeRecipe;
import kr.or.mypage.model.vo.MyContest;
import kr.or.mypage.model.vo.MyItem;
import kr.or.recipe.model.vo.RecipeBoard;
import kr.or.review.model.vo.MyClassReview;
import kr.or.review.model.vo.MyItemReview;
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
	 /*회원탈퇴(회원)*/
	public int deleteMember(Member m) {
		return sqlSession.delete("mypage.deleteMember",m);
	}

	/*판매자 마이페이지 조회*/
	public Member sellerPage(String memberId) {

		return sqlSession.selectOne("mypage.sellerPage",memberId);
	}
   /*내 레시피*/
	public ArrayList<RecipeBoard> myRecipe(int recipeWriter) {
		List<RecipeBoard> list = sqlSession.selectList("mypage.myRecipe",recipeWriter);
		return (ArrayList<RecipeBoard>)list;
	}
	/*내 쿠폰내역*/
	public ArrayList<MyCoupon> myCoupon(int memberNo) {
		List<MyCoupon> list = sqlSession.selectList("mypage.myCoupon",memberNo);
		return (ArrayList<MyCoupon>)list;
	}
	/*내 예약내역*/
	public ArrayList<MyCookingRsrv> myClass(int memberNo) {
		List<MyCookingRsrv> list = sqlSession.selectList("mypage.myClass",memberNo);
		return (ArrayList<MyCookingRsrv>)list;
	}
	/*내 클래스후기 조회*/
	public ArrayList<MyClassReview> myClassReview(int memberNo) {
		List<MyClassReview> list = sqlSession.selectList("mypage.myclassReview",memberNo);
		return (ArrayList<MyClassReview>)list;
	}
	/*내 밀키트 후기조회*/
	public ArrayList<MyItemReview> myItemReview(int memberNo) {
		List<MyItemReview> list = sqlSession.selectList("mypage.myitemReview",memberNo);
		return (ArrayList<MyItemReview>)list;
	}
	/*역대우승자 List*/
	
	public ArrayList<ContestWin> contestWin() {
		List<ContestWin> list = sqlSession.selectList("mypage.contestWinner");
		return (ArrayList<ContestWin>)list;
	}
	/*나의 대회내역*/
	public ArrayList<MyContest> myContest(int recipeWriter) {
		List<MyContest> list = sqlSession.selectList("mypage.myContest");
		return (ArrayList<MyContest>)list;
	}
	/*판매자 밀키트*/
	public ArrayList<MyItem> myItem(int milkitWriter) {
		List<MyItem> list = sqlSession.selectList("mypage.myItem");
		return (ArrayList<MyItem>) list;
	}
	/*좋아요 레시피*/
	public ArrayList<LikeRecipe> likeRecipe(int memberNo) {
		List<LikeRecipe> list = sqlSession.selectList("mypage.likeRecipe");
		return (ArrayList<LikeRecipe>) list;
	}


}

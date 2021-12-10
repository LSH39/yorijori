package kr.or.mypage.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.cookingRsrv.model.vo.MyCookingRsrv;
import kr.or.coupon.model.vo.MyCoupon;
import kr.or.freeboard.model.vo.Freeboard;
import kr.or.member.model.vo.Member;
import kr.or.mypage.model.dao.MypageDao;
import kr.or.mypage.model.vo.ContestWin;
import kr.or.mypage.model.vo.FollowList;
import kr.or.mypage.model.vo.LikeRecipe;
import kr.or.mypage.model.vo.MyContest;
import kr.or.mypage.model.vo.MyItem;
import kr.or.mypage.model.vo.Mychat;
import kr.or.mypage.model.vo.Mydm;
import kr.or.mypage.model.vo.Myorder;
import kr.or.mypage.model.vo.Mysell;
import kr.or.recipe.model.vo.RecipeBoard;
import kr.or.review.model.vo.MyClassReview;
import kr.or.review.model.vo.MyItemReview;
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

	public ArrayList<MyItemReview> myItemReview(int memberNo) {
		ArrayList<MyItemReview> list =dao.myItemReview(memberNo);
		return list;
	}


	public ArrayList<ContestWin> contestWin() {
		ArrayList<ContestWin> list =dao.contestWin();
		return list;
	}

	public ArrayList<MyContest> myContest(int recipeWriter) {
		ArrayList<MyContest> list = dao.myContest(recipeWriter);
		return list;
	}

	public ArrayList<MyItem> myItem(int milkitWriter) {
		ArrayList<MyItem> list = dao.myItem(milkitWriter);
		return list;
	}

	public ArrayList<LikeRecipe> likeRecipe(int memberNo) {
		ArrayList<LikeRecipe> list = dao.likeRecipe(memberNo);
		return list;
	}

	public ArrayList<FollowList> followList(int memberNo) {
		ArrayList<FollowList> list = dao.followList(memberNo);
		return list;
	}

	public ArrayList<Freeboard> myBoard(String freeWriter) {
		ArrayList<Freeboard> list = dao.myBoard(freeWriter);
		return list;
	}

	public ArrayList<Mychat> myChatList(String chatRecive) {
		ArrayList<Mychat> list = dao.myChatList(chatRecive);
		return list;
	}

	public int upSeller(Member m) {
		int result = dao.upSeller(m);
		return result;
	}

	public ArrayList<Myorder> myOrderList(int memberNo) {
		ArrayList<Myorder> list = dao.myOrderList(memberNo);
		return list;
	}


	public Myorder myOrderDetail(int orderNo) {
		Myorder mo =dao.myOrderDetail(orderNo);
		return mo;
	}

	public ArrayList<Myorder> orderDetail(int orderNo) {
		ArrayList<Myorder> list = dao.orderDetail(orderNo);
		return list;
	}

	public ArrayList<Mysell> mySellList(int memberNo) {
		ArrayList<Mysell> list = dao.mySellerList(memberNo);
		return list;
	}

	public ArrayList<Mysell> totalSell(int memberNo) {
		ArrayList<Mysell> list = dao.totalSell(memberNo);
		return list;
	}

	public int updateSeller(Member m) {
		int result = dao.updateSeller(m);
		return result;
	}

	public ArrayList<Mydm> myDmList(String dmReceiver) {
		ArrayList<Mydm> list = dao.myDmList(dmReceiver);
		return list;
	}
	

	

}

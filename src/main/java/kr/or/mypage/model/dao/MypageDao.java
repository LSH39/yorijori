package kr.or.mypage.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.cookingCls.model.vo.CookingCls;
import kr.or.cookingRsrv.model.vo.MyCookingRsrv;
import kr.or.coupon.model.vo.MyCoupon;
import kr.or.freeboard.model.vo.Freeboard;
import kr.or.member.model.vo.Member;
import kr.or.member.model.vo.ReadMember;
import kr.or.mypage.model.vo.ContestWin;
import kr.or.mypage.model.vo.DetailOrder;
import kr.or.mypage.model.vo.FollowList;
import kr.or.mypage.model.vo.LikeRecipe;
import kr.or.mypage.model.vo.MyContest;
import kr.or.mypage.model.vo.MyItem;
import kr.or.mypage.model.vo.Mychat;
import kr.or.mypage.model.vo.Mydm;
import kr.or.mypage.model.vo.Myorder;
import kr.or.mypage.model.vo.Mypoint;
import kr.or.mypage.model.vo.Mysell;
import kr.or.recipe.model.vo.RecipeBoard;
import kr.or.review.model.vo.MyClassReview;
import kr.or.review.model.vo.MyItemReview;
@Repository
public class MypageDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/*마이페이지*/
	public ReadMember mypage(String memberNickname) {
		return sqlSession.selectOne("mypage.mypage",memberNickname);
	}
    /*회원정보수정*/
	public int updateMember(Member m) {
		return sqlSession.update("mypage.updateMember",m);

	}
	 /*회원탈퇴(회원)
	public int deleteMember(Member m) {
		return sqlSession.delete("mypage.deleteMember",m);
	}
*/
	/*판매자 마이페이지 조회*/
	public Member sellerPage(String memberId) {

		return sqlSession.selectOne("mypage.sellerPage",memberId);
	}
   /*내 레시피*/
	public ArrayList<RecipeBoard> myRecipe(int recipeWriter) {
		List<RecipeBoard> list = sqlSession.selectList("mypage.myRecipe",recipeWriter);
		return (ArrayList<RecipeBoard>)list;
	}
	/*내 쿠폰내역
	public ArrayList<MyCoupon> myCoupon(int memberNo) {
		List<MyCoupon> list = sqlSession.selectList("mypage.myCoupon",memberNo);
		return (ArrayList<MyCoupon>)list;
	}
	*/
	/*내 예약내역*/
	public ArrayList<MyCookingRsrv> myClass(int memberNo) {
		List<MyCookingRsrv> list = sqlSession.selectList("mypage.myClass",memberNo);
		return (ArrayList<MyCookingRsrv>)list;
	}
	/*내 클래스후기 조회*/
	public ArrayList<MyClassReview> myClassReview(String memberNickname) {
		List<MyClassReview> list = sqlSession.selectList("mypage.myclassReview",memberNickname);
		return (ArrayList<MyClassReview>)list;
	}
	/*내 밀키트 후기조회*/
	public ArrayList<MyItemReview> myItemReview(String memberNickname) {
		List<MyItemReview> list = sqlSession.selectList("mypage.myitemReview",memberNickname);
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
	/*좋아요 레시피
	public ArrayList<LikeRecipe> likeRecipe(int memberNo) {
		List<LikeRecipe> list = sqlSession.selectList("mypage.likeRecipe");
		return (ArrayList<LikeRecipe>) list;
	}
	*/


	/*내 게시판*/
	public ArrayList<Freeboard> myBoard(String freeWriter) {
		List<Freeboard> list = sqlSession.selectList("mypage.myBoard");
		return (ArrayList<Freeboard>) list;
	}
	/*내 채팅리스트*/
	public ArrayList<Mychat> myChatList(int chatReceive) {
		List<Mychat> list = sqlSession.selectList("mypage.chatList",chatReceive);
		return (ArrayList<Mychat>) list;
	}
	/*회원탈퇴(판매자)*/
	public int upSeller(Member m) {
		return sqlSession.update("mypage.upSeller",m);
	
	}
	/*주문내역조회
	public ArrayList<Myorder> myOrderList(int memberNo) {
		List<Myorder> list = sqlSession.selectList("mypage.orderList");
		return (ArrayList<Myorder>) list;
	}
	*/
	/*주문상세조회*/
	
	public DetailOrder myOrderDetail(int orderNo) {
		return sqlSession.selectOne("mypage.orderDetail",orderNo);
	
	}
	/*상세리스트*/
	public ArrayList<Myorder> orderDetail(int orderNo) {
		List<Myorder> list = sqlSession.selectList("mypage.detailOrder",orderNo);
		return (ArrayList<Myorder>) list;
	}
	/*판매내역조회*/
	public ArrayList<Mysell> mySellerList(int memberNo) {
		List<Mysell> list = sqlSession.selectList("mypage.sellerList");
		return (ArrayList<Mysell>) list;
	}
	/*판매량 */
	public ArrayList<Mysell> totalSell(int milkitWriter) {
		List<Mysell> list = sqlSession.selectList("mypage.totalSell",milkitWriter);
		return (ArrayList<Mysell>) list;
	}
	/*판매자정보수정*/
	public int updateSeller(Member m) {
		return sqlSession.update("mypage.updateSeller",m);

	}

	/*주문페이징*/
	public ArrayList<Myorder> selectOrderList(HashMap<String, Object> map) {
		List<Myorder> list = sqlSession.selectList("mypage.orderList1", map);
		return (ArrayList<Myorder>) list;
	}
	/*주문게시글 총개수*/
	public int selectTotalCount(int memberNo) {
		int totalCount = sqlSession.selectOne("mypage.totalCount",memberNo);
		return totalCount;
	}
	/*내 쿠폰함 페이징*/
	public ArrayList<MyCoupon> selectCouponList(HashMap<String, Object> map) {
		List<MyCoupon> list = sqlSession.selectList("mypage.myCouponList",map);
		return (ArrayList<MyCoupon>)list;
	}
	/*쿠폰함 총개수*/
	public int couponTotalCount(int memberNo) {
		int totalCount = sqlSession.selectOne("mypage.couponCount",memberNo);
		return totalCount;
	}
	/*참여대회내역 페이징*/
	public ArrayList<MyContest> selectContestList(HashMap<String, Object> map) {
		List<MyContest> list = sqlSession.selectList("mypage.myContestList",map);
		return (ArrayList<MyContest>)list;
	}
	/*대회내역 */
	public int contestCount(int recipeWriter) {
		int totalCount = sqlSession.selectOne("mypage.contestCount",recipeWriter);
		return totalCount;
	}
	/* 내 게시판 페이징*/
	public ArrayList<Freeboard> myBoardList(HashMap<String, Object> map) {
		List<Freeboard> list = sqlSession.selectList("mypage.myBoardList",map);
		return (ArrayList<Freeboard>)list;
	}
	/*게시판 게시글수*/
	public int freeBoardCount(String freeWriter) {
		int totalCount = sqlSession.selectOne("mypage.boardCount",freeWriter);
		return totalCount;
	}
	/* 찜한 레시피*/
	public ArrayList<LikeRecipe> likeRecipeList(HashMap<String, Object> map) {
		List<LikeRecipe> list = sqlSession.selectList("mypage.likeRecipe",map);
		return (ArrayList<LikeRecipe>)list;
	}
	/*찜한 레시피 수*/
	public int recipeCount(int memberNo) {
		int totalCount = sqlSession.selectOne("mypage.likeRecipeCount",memberNo);
		return totalCount;
	}
	
	//1.팔로우리스트
	public ArrayList<FollowList> followList(int memberNo) {
		List<FollowList> list = sqlSession.selectList("mypage.followList",memberNo);
		return (ArrayList<FollowList>) list;
	}
	//2.
	public int followCount(int memberNo) {
		int totalCount = sqlSession.selectOne("mypage.followCount",memberNo);
		return totalCount;
	}
	/*dm리스트1번*/
	public ArrayList<Mydm> myDmList(String dmReceiver) {
		List<Mydm> list = sqlSession.selectList("mypage.dmList",dmReceiver);
		return (ArrayList<Mydm>) list;
	}
	//*dm개수*/
	public int countsDm(String dmReceiver) {
		int dmCount = sqlSession.selectOne("mypage.countDm",dmReceiver);
		return dmCount;
	}
	/*
	//1포인트내역 조회
	public ArrayList<Mypoint> pointList(HashMap<String, Object> map) {
		List<Mypoint> list = sqlSession.selectList("mypage.pointList");
		return (ArrayList<Mypoint>) list;
	}
	//2포인트내역개수 조회
	public int pointCount() {
		int totalCount = sqlSession.selectOne("mypage.pointCount");
		return totalCount;
	}
	*/
	public ArrayList<Mypoint> mypoint(String memberNo) {
		List<Mypoint> list = sqlSession.selectList("mypage.mypoint",memberNo);
		return (ArrayList<Mypoint>)list;
	}
	//포인트리스트
	public ArrayList<Mypoint> selectPointList(HashMap<String, Object> map) {
		List<Mypoint> list = sqlSession.selectList("mypage.selectPointList",map);
		return (ArrayList<Mypoint>) list;
	}
	//1.포인트내역 개수
	public int pointCount(int memberNo) {
		int totalCount = sqlSession.selectOne("mypage.countPoint",memberNo);
		return totalCount;
	}
	//2.총포인트
	public int totalPoint(int memberNo) {
		int totalPoint = sqlSession.selectOne("mypage.totalPoint",memberNo);
		return totalPoint;
	}
	//3.사용가능포인트
	public int usePoint(int memberNo) {
		int usePoint = sqlSession.selectOne("mypage.usePoint",memberNo);
		return usePoint;
	}
	//내 쿠킹클래스 1번
	public ArrayList<CookingCls> selectMyClass(HashMap<String, Object> map) {
		List<CookingCls> list = sqlSession.selectList("mypage.selectClassList", map);
		return (ArrayList<CookingCls>) list;
	}
	//내 쿠킹클래스 개수
	public int totalClass(String memberNickname) {
		return sqlSession.selectOne("mypage.totalClass",memberNickname);
	}
	
	//자격증파일  수정하기
	public int upCerPath(Member m) {
		return sqlSession.update("mypage.updateCerPath",m);

		}
	//조리꾼 정보변경하기
	public int upSellerInfo(Member m) {
		return sqlSession.update("mypage.updateSellerInfo",m);
		
	}
	//프로필조회*/
	public Member profile(String memberId) {
		return sqlSession.selectOne("mypage.profile",memberId);
	}
	//주문상태 변경하기*/
	public int updateOrder(Mysell ms) {
		return sqlSession.update("mypage.updateOrder",ms);
	}
	//포인트 등록하기
	public int raisePoint(Mysell ms) {
		return sqlSession.insert("mypage.raisePoint",ms);
	}
	//내판매내역
	public ArrayList<Mysell> mySellerList1(HashMap<String, Object> map) {
		List<Mysell> list = sqlSession.selectList("mypage.sellerList1",map);
		return (ArrayList<Mysell>) list;
	}
	
	//판매내역 개수 세기
	public int sellCount(int milkitWriter) {
		int totalSell = sqlSession.selectOne("mypage.SellCount",milkitWriter);
		return totalSell;
	}
	//포인트 적립하기
	public int updatePoint(Mysell ms) {
		return  sqlSession.update("mypage.updatePoint",ms);
	}
	//dmCount 첫번째 장
	public int countsDmFirst(String memberNickname) {
		int dmCount = sqlSession.selectOne("mypage.countDmFirst",memberNickname);
		return dmCount;
	}
	//주문취소(옵션테이블)
	public int cancleOrder(int orderNo) {
		return sqlSession.delete("mypage.cancleOrder",orderNo);
	}
	//주문취소(주문내역테이블)
	public int cancleOrderList(int orderNo) {
		return sqlSession.delete("mypage.cancleOrderList",orderNo);
	}
}
	


package kr.or.mypage.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.cookingRsrv.model.vo.MyCookingRsrv;
import kr.or.coupon.model.vo.MyCoupon;
import kr.or.coupon.model.vo.MyCouponPageData;
import kr.or.freeboard.model.vo.Freeboard;
import kr.or.member.model.vo.Member;
import kr.or.mypage.model.dao.MypageDao;
import kr.or.mypage.model.vo.ContestWin;
import kr.or.mypage.model.vo.DetailOrder;
import kr.or.mypage.model.vo.FollowList;
import kr.or.mypage.model.vo.LikeRecipe;
import kr.or.mypage.model.vo.MyContest;
import kr.or.mypage.model.vo.MyFreeBoardPageData;
import kr.or.mypage.model.vo.MyItem;
import kr.or.mypage.model.vo.MyLikeRecipePageData;
import kr.or.mypage.model.vo.Mychat;
import kr.or.mypage.model.vo.MycontestPagedata;
import kr.or.mypage.model.vo.Mydm;
import kr.or.mypage.model.vo.Myorder;
import kr.or.mypage.model.vo.MyorderPageData;
import kr.or.mypage.model.vo.Mysell;
import kr.or.mypage.model.vo.ReadDm;
import kr.or.mypage.model.vo.followCount;
import kr.or.recipe.model.vo.RecipeBoard;
import kr.or.review.model.vo.MyClassReview;
import kr.or.review.model.vo.MyItemReview;
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
	/*
	public ArrayList<MyCoupon> mycoupon(int memberNo) {
		ArrayList<MyCoupon> list = dao.myCoupon(memberNo);
		return list;
	}
	 */
	public ArrayList<MyCookingRsrv> myclass(String memberNickname) {
		ArrayList<MyCookingRsrv> list =dao.myClass(memberNickname);
		return list;
	}

	public ArrayList<MyClassReview> myclassReview(String memberNickname) {
		ArrayList<MyClassReview> list =dao.myClassReview(memberNickname);
		return list;
	}

	public ArrayList<MyItemReview> myItemReview(String memberNickname) {
		ArrayList<MyItemReview> list =dao.myItemReview(memberNickname);
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
/*
	public ArrayList<LikeRecipe> likeRecipe(int memberNo) {
		ArrayList<LikeRecipe> list = dao.likeRecipe(memberNo);
		return list;
	}
*/


	public ArrayList<Freeboard> myBoard(String freeWriter) {
		ArrayList<Freeboard> list = dao.myBoard(freeWriter);
		return list;
	}

	public ArrayList<Mychat> myChatList(String chatReceive) {
		ArrayList<Mychat> list = dao.myChatList(chatReceive);
		return list;
	}

	public int upSeller(Member m) {
		int result = dao.upSeller(m);
		return result;
	}
	/*
	public ArrayList<Myorder> myOrderList(int memberNo) {
		ArrayList<Myorder> list = dao.myOrderList(memberNo);
		return list;
	}
	 */

	public DetailOrder myOrderDetail(int orderNo) {
		DetailOrder mo =dao.myOrderDetail(orderNo);
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


	
	
	/*주문내역 페이징*/
	public MyorderPageData orderList(int reqPage) {
		//페이지당 게시물 개수
		int numPerPage = 2;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;

		//한 페이지
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		ArrayList<Myorder> list = dao.selectOrderList(map);

		//페이지 네비게이션 제작
		int totalCount = dao.selectTotalCount();
		int totalPage = 0;

		if(totalCount%numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		} else {
			totalPage = totalCount/numPerPage+1;
		}
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;

		String pageNavi = "<ul class='pagination'>";

		if(pageNo != 1) {
			pageNavi += "<li class=\"page\">";
			pageNavi += "<a class=\"page-link\" href='/myOrderList.do?memberNo=111&reqPage="+(pageNo-1)+"'>&lt;</a></li>";
		}
		for(int i=0;i<pageNaviSize;i++){
			if(pageNo == reqPage) {
				pageNavi += "<li class=\"page\">";
				pageNavi += "<a class='page-link' href='/myOrderList.do?memberNo=111&reqPage="+pageNo+"'>"+pageNo+"</a></li>";
			} else {
				pageNavi += "<li class='page'>";
				pageNavi += "<a class='page-link' href='/myOrderList.do?memberNo=111&reqPage="+pageNo+"'>";
				pageNavi += pageNo+"</a></li>";
			}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
		}
		if(pageNo <= totalPage) {
			pageNavi += "<li class='page'>";
			pageNavi += "<a class='page-link' href='/myOrderList.do?memberNo=111&reqPage="+pageNo+"'>";
			pageNavi += "&gt;</a></li>";
		}
		pageNavi += "</ul>";
		MyorderPageData mpd = new MyorderPageData(list,pageNavi,start,totalCount);
		return mpd;
	}

	/*쿠폰내역 페이징*/
	public MyCouponPageData mycouponList(int reqPage) {
		//페이지당 게시물 개수
		int numPerPage = 1;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;

		//한 페이지
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		ArrayList<MyCoupon> list = dao.selectCouponList(map);

		//페이지 네비게이션 제작
		int totalCount = dao.couponTotalCount();
		int totalPage = 0;

		if(totalCount%numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		} else {
			totalPage = totalCount/numPerPage+1;
		}
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;

		String pageNavi = "<ul class='pagination'>";

		if(pageNo != 1) {
			pageNavi += "<li class=\"page\">";
			pageNavi += "<a class=\"page-link\" href='/mycouponList.do?memberNo=111&reqPage="+(pageNo-1)+"'>&lt;</a></li>";
		}
		for(int i=0;i<pageNaviSize;i++){
			if(pageNo == reqPage) {
				pageNavi += "<li class=\"page\">";
				pageNavi += "<a class='page-link' href='/mycouponList.do?memberNo=111&reqPage="+pageNo+"'>"+pageNo+"</a></li>";
			} else {
				pageNavi += "<li class='page'>";
				pageNavi += "<a class='page-link' href='/mycouponList.do?memberNo=111&reqPage="+pageNo+"'>";
				pageNavi += pageNo+"</a></li>";
			}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
		}
		if(pageNo <= totalPage) {
			pageNavi += "<li class='page'>";
			pageNavi += "<a class='page-link' href='/mycouponList.do?memberNo=111&reqPage="+pageNo+"'>";
			pageNavi += "&gt;</a></li>";
		}
		pageNavi += "</ul>";
		MyCouponPageData cpd = new MyCouponPageData(list,pageNavi,start,totalCount);
		return cpd;
	}
	
	/*내 대회 참여내역 페이징*/
	public MycontestPagedata mycontestList(int reqPage) {
		//페이지당 게시물 개수
		int numPerPage = 1;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;

		//한 페이지
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		ArrayList<MyContest> list = dao.selectContestList(map);

		//페이지 네비게이션 제작
		int totalCount = dao.contestCount();
		int totalPage = 0;

		if(totalCount%numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		} else {
			totalPage = totalCount/numPerPage+1;
		}
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;

		String pageNavi = "<ul class='pagination'>";

		if(pageNo != 1) {
			pageNavi += "<li class=\"page\">";
			pageNavi += "<a class=\"page-link\" href='/myContestList.do?recipeWriter=111&reqPage="+(pageNo-1)+"'>&lt;</a></li>";
		}
		for(int i=0;i<pageNaviSize;i++){
			if(pageNo == reqPage) {
				pageNavi += "<li class=\"page\">";
				pageNavi += "<a class='page-link' href='/myContestList.do?recipeWriter=111&reqPage="+pageNo+"'>"+pageNo+"</a></li>";
			} else {
				pageNavi += "<li class='page'>";
				pageNavi += "<a class='page-link' href='/myContestList.do?recipeWriter=111&reqPage="+pageNo+"'>";
				pageNavi += pageNo+"</a></li>";
			}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
		}
		if(pageNo <= totalPage) {
			pageNavi += "<li class='page'>";
			pageNavi += "<a class='page-link' href='/myContestList.do?recipeWriter=111&reqPage="+pageNo+"'>";
			pageNavi += "&gt;</a></li>";
		}
		pageNavi += "</ul>";
		MycontestPagedata ctpd = new MycontestPagedata(list,pageNavi,start,totalCount);
		return ctpd;
	}
	
	
    /*내 게시판 페이징*/
	public MyFreeBoardPageData myfreeBoardList(int reqPage) {
		//페이지당 게시물 개수
		int numPerPage = 1;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;

		//한 페이지
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		ArrayList<Freeboard> list = dao.myBoardList(map);

		//페이지 네비게이션 제작
		int totalCount = dao.freeBoardCount();
		int totalPage = 0;

		if(totalCount%numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		} else {
			totalPage = totalCount/numPerPage+1;
		}
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;

		String pageNavi = "<ul class='pagination'>";

		if(pageNo != 1) {
			pageNavi += "<li class=\"page\">";
			pageNavi += "<a class=\"page-link\" href='/myBoardList.do?freeWriter=111&reqPage="+(pageNo-1)+"'>&lt;</a></li>";
		}
		for(int i=0;i<pageNaviSize;i++){
			if(pageNo == reqPage) {
				pageNavi += "<li class=\"page\">";
				pageNavi += "<a class='page-link' href='/myBoardList.do?freeWriter=111&reqPage="+pageNo+"'>"+pageNo+"</a></li>";
			} else {
				pageNavi += "<li class='page'>";
				pageNavi += "<a class='page-link' href='/myBoardList.do?freeWriter=111&reqPage="+pageNo+"'>";
				pageNavi += pageNo+"</a></li>";
			}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
		}
		if(pageNo <= totalPage) {
			pageNavi += "<li class='page'>";
			pageNavi += "<a class='page-link' href='/myBoardList.do?freeWriter=111&reqPage="+pageNo+"'>";
			pageNavi += "&gt;</a></li>";
		}
		pageNavi += "</ul>";
		MyFreeBoardPageData fpd = new MyFreeBoardPageData(list,pageNavi,start,totalCount);
		return fpd;
	}
	
	
    /*찜 레시피 페이징*/
	public MyLikeRecipePageData likeRecipeList(int reqPage) {
		//필요한 정보 - 페이지당 게시물 개수
		int numPerPage = 1;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;

		//한 페이지에 보여줄 게시물 목록 조회
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		ArrayList<LikeRecipe> list = dao.likeRecipeList(map);

		//페이지 네비게이션 제작
		int totalCount = dao.recipeCount();
		int totalPage = 0;

		if(totalCount%numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		} else {
			totalPage = totalCount/numPerPage+1;
		}
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;

		String pageNavi = "<ul class='pagination'>";

		if(pageNo != 1) {
			pageNavi += "<li class=\"page\">";
			pageNavi += "<a class=\"page-link\" href='/myBoardList.do?freeWriter=111&reqPage="+(pageNo-1)+"'>&lt;</a></li>";
		}
		for(int i=0;i<pageNaviSize;i++){
			if(pageNo == reqPage) {
				pageNavi += "<li class=\"page\">";
				pageNavi += "<a class='page-link' href='/myBoardList.do?freeWriter=111&reqPage="+pageNo+"'>"+pageNo+"</a></li>";
			} else {
				pageNavi += "<li class='page'>";
				pageNavi += "<a class='page-link' href='/myBoardList.do?freeWriter=111&reqPage="+pageNo+"'>";
				pageNavi += pageNo+"</a></li>";
			}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
		}
		if(pageNo <= totalPage) {
			pageNavi += "<li class='page'>";
			pageNavi += "<a class='page-link' href='/myBoardList.do?freeWriter=111&reqPage="+pageNo+"'>";
			pageNavi += "&gt;</a></li>";
		}
		pageNavi += "</ul>";
		MyLikeRecipePageData rpd = new MyLikeRecipePageData(list,pageNavi,start,totalCount);
		return rpd;
	}

	/*팔로우*/
		public followCount followList(int memberNo) {
		ArrayList<FollowList> list = dao.followList(memberNo);
	     int totalCount = dao.followCount();
	     followCount fct = new followCount(list,totalCount);
			return fct;
		}
    /*내 쪽지함*/

		public ReadDm myDmList(String dmReceiver) {
			ArrayList<Mydm> list = dao.myDmList(dmReceiver);
		     int totalCount = dao.countsDm();
		     ReadDm rd = new ReadDm(list,totalCount);
				return rd;
		}
	
}

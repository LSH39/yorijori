package kr.or.mypage.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import kr.or.cookingRsrv.model.vo.MyCookingRsrv;
import kr.or.coupon.model.vo.MyCouponPageData;
import kr.or.member.model.vo.Member;
import kr.or.mypage.model.service.MypageService;
import kr.or.mypage.model.vo.ContestWin;
import kr.or.mypage.model.vo.DetailOrder;
import kr.or.mypage.model.vo.MyFreeBoardPageData;
import kr.or.mypage.model.vo.MyItem;
import kr.or.mypage.model.vo.MyLikeRecipePageData;
import kr.or.mypage.model.vo.MyPointPageData;
import kr.or.mypage.model.vo.Mychat;
import kr.or.mypage.model.vo.MycontestPagedata;
import kr.or.mypage.model.vo.Myorder;
import kr.or.mypage.model.vo.MyorderPageData;
import kr.or.mypage.model.vo.Mysell;
import kr.or.mypage.model.vo.ReadDm;
import kr.or.mypage.model.vo.followCount;
import kr.or.recipe.model.vo.RecipeBoard;
import kr.or.review.model.vo.MyClassReview;
import kr.or.review.model.vo.MyItemReview;

@Controller
public class MypageController {
	@Autowired 
	private MypageService service;
	
	
	//내 정보보기(회원)
	@RequestMapping(value = "/mypage.do")
	public String mypage(String memberId, Model model) {
		Member m = service.mypage(memberId);
		
		model.addAttribute("m", m);
		return "mypage/mypage";
	}
	//내 정보보기(전문가)
	@RequestMapping(value = "/selPage.do")
	public String selPage(String memberId, Model model) {
		Member m = service.sellerPage(memberId);
		model.addAttribute("m", m);
		return "mypage/sellerProfile";
	}

	//회원탈퇴폼
	@RequestMapping(value = "/deleteFrm.do")
	public String joinFrm() {
		return "mypage/deleteMember";
	}
	@RequestMapping(value = "/deleteMember.do")
	public String deleteMember(Member m, Model model) {
		int result = service.deleteMember(m);
		if (result > 0) {
			model.addAttribute("msg", "탈퇴 되었습니다.");
		} else {
			model.addAttribute("msg", "탈퇴 실패했습니다");
		}
		model.addAttribute("loc", "/");
		return "common/msg";
	}
   //내 레시피내역
	@RequestMapping(value = "/myRecipe.do")
	public String myRecipe(int recipeWriter, Model model) {
		ArrayList<RecipeBoard> list= service.myRecipe(recipeWriter);
		model.addAttribute("list", list);
		return "mypage/myRecipe";
	}
		
    //예약 클래스내역
	@RequestMapping(value = "/myclass.do")
	public String myclass(String memberNickname, Model model) {
		ArrayList<MyCookingRsrv> list= service.myclass(memberNickname);
		model.addAttribute("list", list);
		return "mypage/myReserve";
	}
	//클래스후기
	@RequestMapping(value = "/myclassReview.do")
	public String myclassReview(String memberNickname, Model model) {
		ArrayList<MyClassReview> list= service.myclassReview(memberNickname);
		model.addAttribute("list", list);
		return "mypage/myClassReview";
	}
	//밀키트후기
	@RequestMapping(value = "/myitemReview.do")
	public String myitemReview(String memberNickname, Model model) {
		ArrayList<MyItemReview> list= service.myItemReview(memberNickname);
		model.addAttribute("list", list);
		return "mypage/myItemReview";
	}
	//역대우승자
	@RequestMapping(value = "/contestWinner.do")
	public String contestWinner(Model model) {
		ArrayList<ContestWin> list= service.contestWin();
		model.addAttribute("list", list);
		return "mypage/winnerList";
	}
   //내 밀키트상품조회
	@RequestMapping(value = "/myItem.do")
	public String myItem(int milkitWriter,Model model) {
		ArrayList<MyItem> list= service.myItem(milkitWriter);
		model.addAttribute("list", list);
		return "mypage/myItem";
	}


//내 채팅리스트
	@RequestMapping(value = "/myChatList.do")
	public String myChatList(String chatReceive,Model model) {
		ArrayList<Mychat> list= service.myChatList(chatReceive);
		model.addAttribute("list", list);
		return "mypage/chatList";
	}
	//전문가 탈퇴요청폼
	@RequestMapping(value = "/delSelFrm.do")
	public String deleteSelFrm() {
		return "mypage/deleteSeller";
	}
	@RequestMapping(value = "/deleteSeller.do")
	public String deleteSeller(Member m, Model model) {
		int result = service.upSeller(m);
		if (result > 0) {
			model.addAttribute("msg", "탈퇴요청 성공");
		} else {
			model.addAttribute("msg", "탈퇴 요청 실패");
		}
		model.addAttribute("loc", "/");
		return "common/msg";
	}
  //내 주문내역보기
	@RequestMapping(value = "/myOrderList.do")
	public String myOrderList1(int memberNo,Model model,int reqPage) {
		MyorderPageData mpd =service.orderList(reqPage);
		model.addAttribute("list", mpd.getList());
		model.addAttribute("pageNavi", mpd.getPageNavi());
		model.addAttribute("start", mpd.getStart());
		model.addAttribute("totalCount", mpd.getTotalCount());
		return "mypage/myOrder";
	
	}
 //내 쿠폰내역
	@RequestMapping(value = "/mycouponList.do")
	public String mycoupon(int memberNo, Model model,int reqPage) {
		MyCouponPageData cpd =service.mycouponList(reqPage);
		model.addAttribute("list", cpd.getList());
		model.addAttribute("pageNavi", cpd.getPageNavi());
		model.addAttribute("start", cpd.getStart());
		model.addAttribute("totalCount", cpd.getTotalCount());
		
		return "mypage/myCoupon";
	}
	//내 참여대회내역
	@RequestMapping(value = "/myContestList.do")
	public String myContestList(int recipeWriter, Model model,int reqPage) {
		MycontestPagedata ctpd =service.mycontestList(reqPage);
		model.addAttribute("list", ctpd.getList());
		model.addAttribute("pageNavi", ctpd.getPageNavi());
		model.addAttribute("start", ctpd.getStart());
		model.addAttribute("totalCount", ctpd.getTotalCount());
		
		return "mypage/myContest";
	}
	//내 팔로우리스트
	@RequestMapping(value = "/followList.do")
	public String followList(int memberNo,Model model) {
		followCount fct =service.followList(memberNo);
		model.addAttribute("list", fct.getList());
		model.addAttribute("totalCount", fct.getTotalCount());
	
		return "mypage/myFollow";
	}
	//내 dm 내역(쪽지)
	@RequestMapping(value = "/mydmList.do")
	public String myDmList(String dmReceiver,Model model,HttpSession session) {
		ReadDm rd =service.myDmList(dmReceiver);
		//ArrayList<Mydm> list= service.myDmList(dmReceiver);
		session.setAttribute("rd", rd);
		model.addAttribute("list", rd.getList());
		model.addAttribute("dmCount", rd.getDmCount());
		return "mypage/dmList";
	}
	//내 게시판리스트
	@RequestMapping(value = "/myBoardList.do")
	public String myBoardList(String freeWriter, Model model,int reqPage) {
		MyFreeBoardPageData fpd =service.myfreeBoardList(reqPage);
		model.addAttribute("list", fpd.getList());
		model.addAttribute("pageNavi", fpd.getPageNavi());
		model.addAttribute("start", fpd.getStart());
		model.addAttribute("totalCount", fpd.getTotalCount());
		
		return "mypage/myBoard";
	}
	/*
	@RequestMapping(value = "/likeRecipe.do")
	public String likeRecipe(int memberNo,Model model) {
		ArrayList<LikeRecipe> list= service.likeRecipe(memberNo);
		model.addAttribute("list", list);
		return "mypage/likeRecipe";
	}*/
	
	//내가 찜한 레시피내역
	@RequestMapping(value = "/myLikeList.do")
	public String myLikeList(int memberNo, Model model,int reqPage) {
		MyLikeRecipePageData rpd =service.likeRecipeList(reqPage);
		model.addAttribute("list", rpd.getList());
		model.addAttribute("pageNavi", rpd.getPageNavi());
		model.addAttribute("start", rpd.getStart());
		model.addAttribute("totalCount", rpd.getTotalCount());
		
		return "mypage/likeRecipe";
	}
	//주문상세 내역
	@RequestMapping(value = "/detailOrder.do")
	public String detailOrder(int orderNo, Model model) {
		ArrayList<Myorder> list= service.orderDetail(orderNo);
		model.addAttribute("list", list);
		DetailOrder dd = service.myOrderDetail(orderNo);
		model.addAttribute("dd", dd);
		return "mypage/orderDetail";
	}
	//판매자 정보보기
	@RequestMapping(value = "/sellList.do")
	public String sellList(int memberNo, Model model) {
		ArrayList<Mysell> list= service.mySellList(memberNo);
		model.addAttribute("list", list);
		return "mypage/sellerList";
	}
	//누적판매량
	@RequestMapping(value = "/totalSell.do")
	public String totalSell(int memberNo, Model model) {
		ArrayList<Mysell> list= service.totalSell(memberNo);
		model.addAttribute("list", list);
		return "mypage/amountSell";
	}
	//전문가 정보변경
		@RequestMapping(value = "/updateSeller.do")
		public String updateSeller(Member m, Model model, MultipartFile upfile, HttpServletRequest request) {

			int result = service.updateSeller(m);
			if (result > 0) {
				model.addAttribute("msg", "정보변경 성공");
			} else {
				model.addAttribute("msg", "정보변경 실패");
			}
			model.addAttribute("loc", "/");
			return "common/msg";
		}
		//회원정보변경
	@RequestMapping(value = "/updateMember.do")
	public String updateMember(Member m, Model model,HttpServletRequest request,HttpServletResponse response) {
	
				int result = service.upMember(m);
				if (result > 0) {
					model.addAttribute("msg", "정보변경 성공");
				} else {
					model.addAttribute("msg", "정보변경 실패");
				}
				model.addAttribute("loc", "/mypage.do");
				return "common/msg";
			}

//포인트 내역확인하기
	
	@RequestMapping(value = "/myPoint.do")
	public String myPoint(int memberNo, Model model,int reqPage) {
		MyPointPageData ppd =service.pointList(reqPage);
		model.addAttribute("list", ppd.getList());
		model.addAttribute("pageNavi",ppd.getPageNavi());
		model.addAttribute("start", ppd.getStart());
		model.addAttribute("totalCount", ppd.getTotalCount());
		model.addAttribute("totalPoint", ppd.getTotalPoint());
		model.addAttribute("usePoint", ppd.getUsePoint());
		return "mypage/myPoint";
	}
	
	/*
	@RequestMapping(value = "/myPoint.do")
	public String myPoint(String memberNo,Model model) {
		ArrayList<Mypoint> list= service.myPoint(memberNo);
		model.addAttribute("list", list);
		return "mypage/myPoint";
	}
	*/
	/*
	@RequestMapping(value = "/myBoard.do")
	public String myBoard(String freeWriter,Model model) {
		ArrayList<Freeboard> list= service.myBoard(freeWriter);
		model.addAttribute("list", list);
		return "mypage/myBoard";
	}*/
	/*
	@RequestMapping(value = "/myOrderDetail.do")
	public String myOrderDetail(int orderNo, Model model) {
		Myorder mo = service.myOrderDetail(orderNo);
		model.addAttribute("mo", mo);
		
		return "mypage/orderDetail";
	}
	*/
	/*
	@RequestMapping(value = "/mycoupon.do")
	public String mycoupon(int memberNo, Model model) {
		ArrayList<MyCoupon> list= service.mycoupon(memberNo);
		model.addAttribute("list", list);
		return "mypage/myCoupon";
	}*/
	/*
	@RequestMapping(value = "/myContest.do")
	public String myContest(int recipeWriter,Model model) {
		ArrayList<MyContest> list= service.myContest(recipeWriter);
		model.addAttribute("list", list);
		return "mypage/myContest";
	}*/
	/*
	@RequestMapping(value = "/myOrder.do")
	public String myOrderList(int memberNo,Model model) {
		ArrayList<Myorder> list= service.myOrderList(memberNo);
		model.addAttribute("list", list);
		return "mypage/myOrder";
	}
	*/

}

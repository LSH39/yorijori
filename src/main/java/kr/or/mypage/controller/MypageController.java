package kr.or.mypage.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.cookingRsrv.model.vo.MyCookingRsrv;
import kr.or.coupon.model.vo.MyCoupon;
import kr.or.member.model.vo.Member;
import kr.or.mypage.model.service.MypageService;
import kr.or.mypage.model.vo.ContestWin;
import kr.or.mypage.model.vo.LikeRecipe;
import kr.or.mypage.model.vo.MyContest;
import kr.or.mypage.model.vo.MyItem;
import kr.or.recipe.model.vo.RecipeBoard;
import kr.or.review.model.vo.MyClassReview;
import kr.or.review.model.vo.MyItemReview;

@Controller
public class MypageController {
	@Autowired 
	private MypageService service;
	
	@RequestMapping(value = "/mypage.do")
	public String mypage(String memberId, Model model) {
		Member m = service.mypage(memberId);
		model.addAttribute("m", m);
		return "mypage/mypage";
	}
	@RequestMapping(value = "/selPage.do")
	public String selPage(String memberId, Model model) {
		Member m = service.sellerPage(memberId);
		model.addAttribute("m", m);
		return "mypage/sellerProfile";
	}
	@RequestMapping(value = "/updateMember.do")
	public String updateMember(Member m, Model model) {
		int result = service.upMember(m);
		if (result > 0) {
			model.addAttribute("msg", "정보변경 성공");
		} else {
			model.addAttribute("msg", "정보변경 실패");
		}
		model.addAttribute("loc", "/");
		return "common/msg";
	}
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

	@RequestMapping(value = "/myRecipe.do")
	public String myRecipe(int recipeWriter, Model model) {
		ArrayList<RecipeBoard> list= service.myRecipe(recipeWriter);
		model.addAttribute("list", list);
		return "mypage/myRecipe";
	}
		
	@RequestMapping(value = "/mycoupon.do")
	public String mycoupon(int memberNo, Model model) {
		ArrayList<MyCoupon> list= service.mycoupon(memberNo);
		model.addAttribute("list", list);
		return "mypage/myCoupon";
	}
	@RequestMapping(value = "/myclass.do")
	public String myclass(int memberNo, Model model) {
		ArrayList<MyCookingRsrv> list= service.myclass(memberNo);
		model.addAttribute("list", list);
		return "mypage/myReserve";
	}
	@RequestMapping(value = "/myclassReview.do")
	public String myclassReview(int memberNo, Model model) {
		ArrayList<MyClassReview> list= service.myclassReview(memberNo);
		model.addAttribute("list", list);
		return "mypage/myClassReview";
	}
	@RequestMapping(value = "/myitemReview.do")
	public String myitemReview(int memberNo, Model model) {
		ArrayList<MyItemReview> list= service.myItemReview(memberNo);
		model.addAttribute("list", list);
		return "mypage/myItemReview";
	}
	@RequestMapping(value = "/contestWinner.do")
	public String contestWinner(Model model) {
		ArrayList<ContestWin> list= service.contestWin();
		model.addAttribute("list", list);
		return "mypage/winnerList";
	}
	@RequestMapping(value = "/myContest.do")
	public String myContest(int recipeWriter,Model model) {
		ArrayList<MyContest> list= service.myContest(recipeWriter);
		model.addAttribute("list", list);
		return "mypage/myContest";
	}
	@RequestMapping(value = "/myItem.do")
	public String myItem(int milkitWriter,Model model) {
		ArrayList<MyItem> list= service.myItem(milkitWriter);
		model.addAttribute("list", list);
		return "mypage/myItem";
	}
	@RequestMapping(value = "/likeRecipe.do")
	public String likeRecipe(int memberNo,Model model) {
		ArrayList<LikeRecipe> list= service.likeRecipe(memberNo);
		model.addAttribute("list", list);
		return "mypage/likeRecipe";
	}
	@RequestMapping(value = "/followList.do")
	public String followList(int memberNo,Model model) {
		ArrayList<LikeRecipe> list= service.likeRecipe(memberNo);
		model.addAttribute("list", list);
		return "mypage/likeRecipe";
	}

}

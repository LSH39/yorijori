package kr.or.mypage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.coupon.model.vo.MyCoupon;
import kr.or.member.model.vo.Member;
import kr.or.mypage.model.service.MypageService;
import kr.or.recipe.model.vo.RecipeBoard;
import kr.or.review.model.vo.Review;

@Controller
public class MypageController {
	@Autowired 
	private MypageService service;
	
	@RequestMapping(value = "/mypage.do")
	public String mypage(String memberId, Model model) {
		Member m = service.mypage(memberId);
		model.addAttribute("m", m);
		return "mypage/myProfile";
	}
	
	@RequestMapping(value = "/sellerPage.do")
	public String sellerPage(String memberId, Model model) {
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
		RecipeBoard re= service.myRecipe(recipeWriter);
		model.addAttribute("re", re);
		return "mypage/myRecipe";
	}
	
	@RequestMapping(value = "/classReview.do")
	public String classReview(String memberId, Model model) {
		Review r= service.classReview(memberId);
		model.addAttribute("r", r);
		return "mypage/classReview";
	}
	
	@RequestMapping(value = "/mycoupon.do")
	public String mycoupon(int memberNo, Model model) {
		MyCoupon mc= service.mycoupon(memberNo);
		model.addAttribute("mc", mc);
		return "mypage/myCoupon";
	}
}

package kr.or.cookingCls.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.cookingCls.model.service.CookingClsService;
import kr.or.cookingCls.model.vo.CookingCls;
import kr.or.cookingCls.model.vo.CookingClsPageData;
import kr.or.member.model.vo.Member;
import kr.or.review.model.vo.Review;

@Controller
public class CookingClsController {

	@Autowired
	private CookingClsService service;
	
	//쿠킹 클래스 전체 조회
	@RequestMapping(value="/cookingClsList.do")
	public String SelectAllClass(int reqPage, Model model) {
		//새로
		CookingClsPageData ccpd = service.selectAllClass(reqPage);
		
		model.addAttribute("list", ccpd.getList());
		model.addAttribute("pageNavi", ccpd.getPageNavi());
		model.addAttribute("start", ccpd.getList());
		return "cookingcls/cookingClsList";
		
//		ArrayList<CookingCls> list = service.selectAllClass();
//		model.addAttribute("list", list);
//		return "cookingcls/cookingClsList";
	}
	
	//쿠킹 클래스 작성 페이지
	@RequestMapping(value="/cookingClsWriteFrm.do")
	public String CookingClsListWriteFrm() {
		return "cookingcls/cookingClsWriteFrm";
	}
	
	//쿠킹 클래스 조회
	@RequestMapping(value="/cookingClsView.do")
	public String CookingClsListView(int classNo, HttpSession session , Model model) {
		CookingCls ccls = service.selectOneClass(classNo);
		Member member = (Member)session.getAttribute("m");
		String memberNickname = member.getMemberNickname();
		int dmRoomNo = service.selectOneDmRoomNo(classNo, memberNickname);
		ArrayList<Review> list = service.selectReviewList(classNo);
		double reviewAvg = service.avgReviewRate(classNo);
		model.addAttribute("ccls", ccls);
		model.addAttribute("list", list);
		model.addAttribute("reviewAvg", reviewAvg);
		return "cookingcls/cookingClsView";
	}
	
	
	//쿠킹 클래스 수정 페이지
	@RequestMapping(value="/cookingClsUpdateFrm.do")
	public String CookingClsListUpdateFrm() {
		return "cookingcls/cookingClsUpdateFrm";
	}
	
	//쿠킹 클래스 삭제
	@RequestMapping(value="/cookingClsDelete.do")
	public String cookingClsDelete(int classNo, Model model) {
		int result = service.deleteOneClass(classNo);
		
		if(result>0) {
			model.addAttribute("msg", "삭제 성공!");
			model.addAttribute("loc", "/cookingClsList.do?reqPage=1");
		}else {
			model.addAttribute("msg", "삭제 실패!");
			model.addAttribute("loc", "/cookingClsView.do?classNo="+classNo);			
		}
		return "common/msg";
		
	}
}

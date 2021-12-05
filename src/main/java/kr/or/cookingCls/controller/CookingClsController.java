package kr.or.cookingCls.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.cookingCls.model.service.CookingClsService;
import kr.or.cookingCls.model.vo.CookingCls;
import kr.or.cookingCls.model.vo.CookingClsPageData;
import kr.or.review.model.vo.Review;

@Controller
public class CookingClsController {

	@Autowired
	private CookingClsService service;
	
	//쿠킹클래스 전체 조회
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
	
	//쿠킹클래스 작성
	@RequestMapping(value="/cookingClsWriteFrm.do")
	public String CookingClsListWriteFrm() {
		return "cookingcls/cookingClsWriteFrm";
	}
	
	//쿠킹클래스 조회
	@RequestMapping(value="/cookingClsView.do")
	public String CookingClsListView(int classNo, Model model) {
		CookingCls ccls = service.selectOneClass(classNo);
		ArrayList<Review> list = service.selectReviewList(classNo);
		model.addAttribute("ccls", ccls);
		model.addAttribute("list", list);
		return "cookingcls/cookingClsView";
	}
	
	
	//쿠킹클래스 수정
	@RequestMapping(value="/cookingClsUpdateFrm.do")
	public String CookingClsListUpdateFrm() {
		return "cookingcls/cookingClsUpdateFrm";
	}
}

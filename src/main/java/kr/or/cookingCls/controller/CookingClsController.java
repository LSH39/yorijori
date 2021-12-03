package kr.or.cookingCls.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.cookingCls.model.service.CookingClsService;
import kr.or.cookingCls.model.vo.CookingCls;

@Controller
public class CookingClsController {

	@Autowired
	private CookingClsService service;
	
	//쿠킹클래스 전체 조회
	@RequestMapping(value="/cookingClsList.do")
	public String selectAllClass(Model model) {
		ArrayList<CookingCls> list = service.selectAllClass();
		model.addAttribute("list", list);
		return "cookingcls/cookingclsList";
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
		model.addAttribute("ccls", ccls);
		return "cookingcls/cookingClsView";
	}
	
	
	//쿠킹클래스 수정
	@RequestMapping(value="/cookingClsUpdateFrm.do")
	public String CookingClsListUpdateFrm() {
		return "cookingcls/cookingClsUpdateFrm";
	}
}

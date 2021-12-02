package kr.or.cookingCls.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.cookingCls.model.service.CookingClsService;

@Controller
public class CookingClsController {

	@Autowired
	private CookingClsService service;
	
	//쿠킹클래스 리스트 페이지
	@RequestMapping(value="/cookingClsList.do")
	public String CookingClsList() {
		return "cookingcls/cookingClsList";
	}
	
	//쿠킹클래스 작성
	@RequestMapping(value="/cookingClsWriteFrm.do")
	public String CookingClsListWriteFrm() {
		return "cookingcls/cookingClsWriteFrm";
	}
	
	//쿠킹클래스 조회
	@RequestMapping(value="/cookingClsView.do")
	public String CookingClsListView() {
		return "cookingcls/cookingClsView";
	}
	
	//쿠킹클래스 수정
	@RequestMapping(value="/cookingClsUpdateFrm.do")
	public String CookingClsListUpdateFrm() {
		return "cookingcls/cookingClsUpdateFrm";
	}
}

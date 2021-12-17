package kr.or.main.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.main.model.service.MainService;
import kr.or.main.model.vo.MainSearchResult;
@Controller
public class MainController {
	
	@Autowired
	private MainService service;
	
	@RequestMapping(value="/mainpage.do")
	public String mainpage() {
		return "common/main";
	}
	
	@RequestMapping(value="/mainpageSearch.do")
	public String mainpageSearch(Model model, String keyword) {
		MainSearchResult msr = service.mainpageSearch(keyword);
		model.addAttribute("recipeList", msr.getRecipeList());
		model.addAttribute("memberList", msr.getMemberList());
		model.addAttribute("classList", msr.getClassList());
		model.addAttribute("freeList", msr.getFreeList());
		model.addAttribute("productList", msr.getProductList());
		return "main/searchResult";
	}
}

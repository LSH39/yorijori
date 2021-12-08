package kr.or.recipecontest.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.recipecontest.model.service.RecipeContestService;
import kr.or.recipecontest.model.vo.ContestPageData;

@Controller
public class RecipeContestController {
	@Autowired
	private RecipeContestService service;
	
	@RequestMapping(value="/contestList.do")
	public String contestList(Model model, int reqPage, int orderIndex) {
		ContestPageData cpd = service.selectContestList(reqPage, orderIndex);
		model.addAttribute("list", cpd.getList());
		model.addAttribute("pageNavi", cpd.getPageNavi());
		model.addAttribute("start", cpd.getStart());
		model.addAttribute("totalCount", cpd.getTotalCount());
		model.addAttribute("orderIndex", orderIndex);
		return "recipecontest/contestList";
	}
	
	@RequestMapping(value="/contestResult.do")
	public String contestResult() {
		return "recipecontest/contestResult";
	}
	
}

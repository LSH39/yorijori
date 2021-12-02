package kr.or.recipecontest.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.recipecontest.model.service.RecipeContestService;

@Controller
public class RecipeContestController {
	@Autowired
	private RecipeContestService service;
	
	@RequestMapping(value="/contestList.do")
	public String contestList() {
		return "recipecontest/contestList";
	}
	
	@RequestMapping(value="/contestResult.do")
	public String contestResult() {
		return "recipecontest/contestResult";
	}
}

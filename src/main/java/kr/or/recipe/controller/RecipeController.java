package kr.or.recipe.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.milkit.model.vo.product;
import kr.or.recipe.model.service.RecipeService;
import kr.or.recipe.model.vo.RecipeBoard;

@Controller
public class RecipeController {
	@Autowired
	private RecipeService service;
	
	@RequestMapping(value = "/recipeBoard.do")
	public String recipeList(Model model) {
		ArrayList<RecipeBoard>list = service.selectRecipeList();
		model.addAttribute("list", list);
		return "recipe/recipeBoard";
	}
	
}

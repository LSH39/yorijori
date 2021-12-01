package kr.or.recipe.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.milkit.model.vo.product;
import kr.or.recipe.model.service.RecipeService;
import kr.or.recipe.model.vo.Material;
import kr.or.recipe.model.vo.RecipeBoard;
import kr.or.recipe.model.vo.RecipeContent;

@Controller
public class RecipeController {
	@Autowired
	private RecipeService service;
	
	@RequestMapping(value = "/recipeBoard.do")
	public String recipeBoard(Model model) {
		ArrayList<RecipeBoard>list = service.selectRecipeList();
		model.addAttribute("list", list);
		return "recipe/recipeBoard";
	}
	@RequestMapping(value = "/recipeWrite.do")
	public String recipeWrite() {
		return "recipe/recipeFrm";
	}
	@RequestMapping(value="/recipeFrm.do")
	public String recipeFrm(RecipeBoard rb, RecipeContent rc, Material m, Model model) {
		
		return null;
		
	}
	
}

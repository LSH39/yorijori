package kr.or.milkit.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.milkit.model.service.MilkitService;
import kr.or.milkit.model.vo.Product;
import kr.or.recipe.model.vo.RecipeBoard;

@Controller
public class MilkitController {
	@Autowired
	private MilkitService service;
	@RequestMapping("/milkitList.do")
	public String milkitList(Model model) {
	ArrayList<Product>list = service.selectMilkitList();
		model.addAttribute("list", list);
		return"/product/milkitList";
	}
	
	@RequestMapping( value = "/milkitFrm1.do")
	public String milkitFrm1(int memberNo, Model model) {
		ArrayList<RecipeBoard>list = service.selectRecipeList(memberNo);
		model.addAttribute("list", list);
		return "/product/milkitFrm";
	}
	@RequestMapping(value = "/milkitFrm2.do")
	public String milkitFrm2(int recipeNo, Model model) {
		model.addAttribute("recipeNo", recipeNo);
		return "/product/milkitFrm2";
	}
}

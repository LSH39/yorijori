package kr.or.main.controller;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.main.model.service.MainService;
import kr.or.main.model.vo.FollowingData;
import kr.or.main.model.vo.MainSearchResult;
import kr.or.main.model.vo.MainViewData;
import kr.or.main.model.vo.RecipeListData;
import kr.or.recipe.model.vo.RecipeBoard;
@Controller
public class MainController {
	
	@Autowired
	private MainService service;
	
	@RequestMapping(value="/mainpage.do")
	public String mainpage(Model model) {
		MainViewData mvd = service.getMainViewData();
		model.addAttribute("productList", mvd.getProductList());
		model.addAttribute("yoriList", mvd.getYoriList());
		model.addAttribute("joriList", mvd.getJoriList());
		model.addAttribute("classList", mvd.getClassList());
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
		model.addAttribute("keyword", keyword);
		return "main/searchResult";
	}
	
	@ResponseBody
	@RequestMapping(value="/followCheck.do")
	public ArrayList<FollowingData> followCheck(Model model, int memberNo){
		ArrayList<FollowingData> list = service.selectFollowingList(memberNo);
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value="/followMem.do")
	public int insertFollow(Model model, int memberNo, int followNo){
		int followerCount = service.insertFollow(memberNo, followNo);
		return followerCount;
	}
	
	@ResponseBody
	@RequestMapping(value="/delFollow.do")
	public int deleteFollow(Model model, int memberNo, int followNo){
		int followerCount = service.deleteFollow(memberNo, followNo);
		return followerCount;
	}
	
	@RequestMapping(value="/bestRecipes.do")
	public String bestRecipes(Model model, int category) {
		ArrayList<RecipeListData> rld = service.selectBestRecipes(category);
		model.addAttribute("list", rld);
		return "main/bestRecipes";
	}
	
}

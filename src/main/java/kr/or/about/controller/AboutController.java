package kr.or.about.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.about.model.service.AboutService;
import kr.or.about.model.vo.FoodList;

@Controller
public class AboutController {
	@Autowired
	private AboutService service;
	
	@RequestMapping(value="/siteInfo.do")
	public String siteInfo() {
		return "about/siteInfo";
	}
	
	@RequestMapping(value="/randomMenuFrm.do")
	public String randomMenuFrm() {
		return "about/randomMenu";
	}
	
	@ResponseBody
	@RequestMapping(value="/randomMenu.do")
	public ArrayList<FoodList> randomMenu(FoodList f) {
		int totalCount = service.foodCount(f);
		ArrayList<FoodList> foodList = service.foodList(f, totalCount);
		return foodList;
	}
	
}

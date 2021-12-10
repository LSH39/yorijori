package kr.or.recipecontest.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.recipecontest.model.service.RecipeContestService;
import kr.or.recipecontest.model.vo.ContestPageData;
import kr.or.recipecontest.model.vo.RecipeContest;

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
	
	@ResponseBody //data 자체로 return
	@RequestMapping(value="/voteCheck.do")
	public int voteCheck(int memberNo) {
		int contestNo = service.voteCheck(memberNo);
		return contestNo;
	}
	
	@RequestMapping(value="/insertVote.do")
	public String insertVote(Model model, int memberNo, int contestNo) {
		int result = service.insertVote(memberNo, contestNo);
		if(result>0) { //투표 성공
			model.addAttribute("msg", "투표 완료");
		} else {
			model.addAttribute("msg", "투표 실패....에러 찾아라");
		}
			model.addAttribute("loc", "/contestList.do?reqPage=1&orderIndex=0");
			return "common/msg";
	}
	
}

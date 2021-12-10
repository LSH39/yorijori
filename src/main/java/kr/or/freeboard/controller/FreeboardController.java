package kr.or.freeboard.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.freeboard.model.service.FreeboardService;
import kr.or.freeboard.model.vo.FreeboardPageData;

@Controller
public class FreeboardController {

	@Autowired
	private FreeboardService service;
	
	@RequestMapping(value="/freeboardList.do")
	public String freeboardList(Model model, int reqPage) {
		FreeboardPageData fpd = service.selectFreeList(reqPage);
		model.addAttribute("list", fpd.getList());
		model.addAttribute("pageNavi", fpd.getPageNavi());
		model.addAttribute("start", fpd.getStart());
		model.addAttribute("totalCount", fpd.getTotalCount());
		return "freeboard/boardList";
	}
}

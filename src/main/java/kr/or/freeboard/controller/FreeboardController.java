package kr.or.freeboard.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.freeboard.model.service.FreeboardService;
import kr.or.freeboard.model.vo.FreeboardPageData;
import kr.or.freeboard.model.vo.FreeboardViewData;

@Controller
public class FreeboardController {

	@Autowired
	private FreeboardService service;
	
	@RequestMapping(value="/freeboardList.do")
	public String freeboardList(Model model, int reqPage, int orderIndex) {
		FreeboardPageData fpd = service.selectFreeList(reqPage, orderIndex);
		model.addAttribute("list", fpd.getList());
		model.addAttribute("pageNavi", fpd.getPageNavi());
		model.addAttribute("start", fpd.getStart());
		model.addAttribute("totalCount", fpd.getTotalCount());
		model.addAttribute("orderIndex", orderIndex);
		return "freeboard/boardList";
	}
	
	@RequestMapping(value="/freeView.do")
	public String freeView(Model model, int freeNo) {
		FreeboardViewData fvd = service.selectOneFree(freeNo);
		model.addAttribute("commentList", fvd.getCommentList());
		model.addAttribute("fileList", fvd.getFileList());
		model.addAttribute("fb", fvd.getFb());
		model.addAttribute("profilePath", fvd.getProfilePath());
		return "freeboard/freeView";
	}
}

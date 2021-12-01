package kr.or.freeboard.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.freeboard.model.service.FreeboardService;

public class FreeboardController {
	@Autowired
	private FreeboardService service;
	
	@RequestMapping(value="/freeboardList.do")
	public String freeboardList(int reqPage, Model model) {
		model.addAttribute("reqPage", reqPage);
		return "freeboard/boardList";
	}
}

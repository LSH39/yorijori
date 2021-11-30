package kr.or.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.main.model.service.MainService;

public class MainController {
	
	@Autowired
	private MainService service;
	
	@RequestMapping(value="/main.do")
	public String mainpage() {
		return "common/main";
	}
}

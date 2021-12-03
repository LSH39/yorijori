package kr.or.main.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.main.model.service.MainService;

public class MainController {
	
	@Autowired
	private MainService service;
	
	@RequestMapping(value="/mainpage.do")
	public String mainpage(HttpSession session) {
		return "common/main";
	}
}

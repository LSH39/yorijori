package kr.or.about.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.about.model.service.AboutService;

@Controller
public class AboutController {
	@Autowired
	private AboutService service;
	
	@RequestMapping(value="/siteInfo.do")
	public String loginFrm() {
		return "about/siteInfo";
	}
}

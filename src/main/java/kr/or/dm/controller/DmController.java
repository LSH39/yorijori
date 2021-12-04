package kr.or.dm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.dm.model.service.DmService;

@Controller
public class DmController {

	
	@RequestMapping(value="/dmList.do")
	public String dmList() {
		return "dm/dmList";
	}
	
	@RequestMapping(value="/dmView.do")
	public String dmView() {
		return "dm/dmView";
	}
}

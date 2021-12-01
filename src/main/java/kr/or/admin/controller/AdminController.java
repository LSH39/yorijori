package kr.or.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	
	@RequestMapping(value="/admin.do")
	public String admin() {
		return "admin/admin";
	}
	@RequestMapping(value="/allmember.do")
	public String allmember() {
		return "admin/allmember";
	}
}

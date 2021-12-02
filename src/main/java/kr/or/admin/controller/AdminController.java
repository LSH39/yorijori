package kr.or.admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.admin.model.service.AdminService;
import kr.or.admin.model.vo.Member2;
import kr.or.admin.model.vo.MemberPageData;
import kr.or.member.model.service.MemberService;
import kr.or.member.model.vo.Member;


@Controller
public class AdminController {
	@Autowired
	private AdminService service;
	
	@RequestMapping(value="/admin.do")
	public String admin() {
		return "admin/admin";
	}
	@RequestMapping(value="/allmember.do")
	public String allmember(Model model,int reqPage,String searchType,String searchText) {
		
		MemberPageData mpd =  service.allMemberList(reqPage,searchType,searchText);
		model.addAttribute("list" ,mpd.getList());
		
		model.addAttribute("pageNavi",mpd.getPageNavi());
		
		return "admin/allmember";
	}
}

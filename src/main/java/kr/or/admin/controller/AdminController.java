package kr.or.admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
<<<<<<< HEAD
	public String allmember(Model model,int reqPage,String searchType,String searchText,String searchDetail,String period,String start,String end,String moreless,String joinStart,String joinEnd,String detail,String align,String memberLevel,String searchText2) {
=======
	public String allmember(Model model,int reqPage) {
>>>>>>> refs/heads/master
		
<<<<<<< HEAD
		MemberPageData mpd =  service.allMemberList(reqPage,searchType,searchText,searchDetail,period,start,end,moreless,joinStart,joinEnd,detail,align,memberLevel,searchText2);
=======
		MemberPageData mpd =  service.allMemberList(reqPage);
>>>>>>> refs/heads/master
		model.addAttribute("list" ,mpd.getList());
		model.addAttribute("pageNavi",mpd.getPageNavi());
		
		return "admin/allmember";
	}
	@ResponseBody
	@RequestMapping(value="/addBlackMember.do")
	public String addBlackMember(String memberNo) {
		
		int result = service.addBlackMember(memberNo);
		return "redirect:/allmember.do?reqPage=1";
	}
}

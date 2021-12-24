package kr.or.membership.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.membership.model.service.MembershipService;
import kr.or.membership.model.vo.Membership;

@Controller
public class MembershipController {
	@Autowired
	private MembershipService service;

	@RequestMapping(value = "/membershipView.do")
	public String membershipView() {
		return "membership/membershipView";	
	}
	@RequestMapping(value = "/standardFrm.do")
	public String standardFrm(Membership m,Model model) {
	model.addAttribute("membershipLevel", m.getMembershipLevel());
	model.addAttribute("membershipPrice", m.getMembershipPrice());
		return "membership/membershipFrm";
		
	}
	@RequestMapping(value = "/premiumFrm.do")
	public String premiumFrm(Membership m,Model model) {
	model.addAttribute("membershipLevel", m.getMembershipLevel());
	model.addAttribute("membershipPrice", m.getMembershipPrice());
		return "membership/membershipFrm";
		
	}
}

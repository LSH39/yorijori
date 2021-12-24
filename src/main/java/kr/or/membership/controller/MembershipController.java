package kr.or.membership.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	@RequestMapping(value = "/membershipFrm.do")
	public String membershipFrm(int membershipPrice, String membershipLevel) {
	System.out.println(membershipPrice);
	System.out.println(membershipLevel);
		return null;
		
	}
}

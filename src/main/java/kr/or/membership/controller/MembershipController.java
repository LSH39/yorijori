package kr.or.membership.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.membership.model.service.MembershipService;
import kr.or.membership.model.vo.Membership;
import kr.or.membership.model.vo.SubPayment;

@Controller
public class MembershipController {
	@Autowired
	private MembershipService service;

	@RequestMapping(value = "/membershipView.do")
	public String membershipView(int memberNo,Model model) {
		int result = service.selectMembership(memberNo);
		if(result>0) {
			model.addAttribute("msg", "이미 구매한 구독권이 있습니다.");
			model.addAttribute("loc", "/");
			return "common/msg";
		}else {
			return "membership/membershipView";	
		}
			
	}
	@RequestMapping(value = "/standardFrm.do")
	public String standardFrm(Membership m,Model model) {
		int membershipPrice = m.getMembershipPrice();
		if (membershipPrice == 12000) {
			model.addAttribute("membershipDate", "1");
		} else if (membershipPrice == 33000) {
			model.addAttribute("membershipDate", "3");
		} else {
			model.addAttribute("membershipDate", "6");
		}
	model.addAttribute("membershipLevel", m.getMembershipLevel());
	model.addAttribute("membershipPrice", m.getMembershipPrice());
		return "membership/membershipFrm";
		
	}
	@RequestMapping(value = "/premiumFrm.do")
	public String premiumFrm(Membership m,Model model) {
		int membershipPrice = m.getMembershipPrice();
		if (membershipPrice == 20000) {
			model.addAttribute("membershipDate", "1");
		} else if (membershipPrice == 55000) {
			model.addAttribute("membershipDate", "3");
		} else {
			model.addAttribute("membershipDate", "6");
		}
	model.addAttribute("membershipLevel", m.getMembershipLevel());
	model.addAttribute("membershipPrice", m.getMembershipPrice());
		return "membership/membershipFrm";	
	}
	@RequestMapping(value = "/membershipFrm.do")
	public String membershipFrm(Membership m, SubPayment sp, Model model) {
		int result = service.insertMembership(m, sp);
		if(result>0) {
			model.addAttribute("msg","구매 성공");
			model.addAttribute("loc", "/");
		}else {
			model.addAttribute("msg", "구매실패! 관리자에게 문의주세요");
			model.addAttribute("loc", "/");
		}
		return "common/msg";
		
	}
}

package kr.or.membership.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

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
	public String membershipView() {
		return "membership/membershipView";
	}

	@RequestMapping(value = "/standardFrm.do")
	public String standardFrm(Membership m, Model model) {
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
	public String premiumFrm(Membership m, Model model) {
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
	@RequestMapping(value="/membershipFrm.do")
	public String membershipFrm(Membership m,SubPayment sp,Model model) {
		int result = service.insertMembership(m,sp);
		if(result>0) {
			model.addAttribute("msg", "결제성공");
			model.addAttribute("loc", "/");
		}else {
			model.addAttribute("msg", "구매실패. 관리자에게 문의해주세요");
			model.addAttribute("loc", "/");
		}
		return "common/msg";
		
	}
}

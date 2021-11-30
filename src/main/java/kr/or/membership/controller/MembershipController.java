package kr.or.membership.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.or.membership.model.service.MembershipService;

@Controller
public class MembershipController {
	@Autowired
	private MembershipService service;


	
}

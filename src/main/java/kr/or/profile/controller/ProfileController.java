package kr.or.profile.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.or.profile.model.service.ProfileService;

@Controller
public class ProfileController {

	@Autowired
	private ProfileService service;
	
	
}

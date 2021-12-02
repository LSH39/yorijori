package kr.or.profile.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.profile.model.service.ProfileService;

@Controller
public class ProfileController {

	@Autowired
	private ProfileService service;
	
	//프로필 화면으로 이동
	@RequestMapping(value="/profile.do")
	public String Profile() {
		return "mypage/profile";
	}
	
	
	//Ajax 사용해서 팔로우 언팔로우 할때
	@ResponseBody
	@RequestMapping
	public String ProfileFollow() {
		return null;
	}
	
	
}

package kr.or.chat.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.chat.model.service.ChatService;
import kr.or.chat.model.vo.Chat;
import kr.or.member.model.vo.Member;

@Controller
public class ChatController {
	@Autowired
	private ChatService service;
	

}

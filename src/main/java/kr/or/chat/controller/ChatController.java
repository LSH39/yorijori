package kr.or.chat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.or.chat.model.service.ChatService;

@Controller
public class ChatController {
	@Autowired
	private ChatService service;
}

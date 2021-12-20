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
	
//	// 조회
//	@ResponseBody
//	@RequestMapping(value="/chatUserFrm.do")
//	public ArrayList<Chat> chatUserFrm(HttpSession session) {
//		if(session.getAttribute("m")!=null) {
//			Member sessionMember = (Member)session.getAttribute("m");
//			int sessionMemberNo = sessionMember.getMemberNo();
//			ArrayList<Chat> chatUserList = service.chatUserList(sessionMemberNo);
//			return chatUserList;
//		}
//		else {
//			return null;
//		}
//	}
//	
//	@ResponseBody
//	@RequestMapping(value="/chatAdminHomeFrm.do")
//	public ArrayList<Chat> chatAdminHomeFrm(HttpSession session) {
//		if(session.getAttribute("m")!=null) {
//			Member sessionMember = (Member)session.getAttribute("m");
//			int sessionMemberNo = sessionMember.getMemberNo();
//			ArrayList<Chat> chatAdminHomeList = service.chatAdminHomeList(sessionMemberNo);
//			return chatAdminHomeList;
//		}else {
//			return null;
//		}
//	}
//	
//	@ResponseBody
//	@RequestMapping(value="/chatAdminFrm.do")
//	public ArrayList<Chat> chatAdminFrm(String selectUser, String sessionMemberNo) {
//		Chat chat = new Chat();
//		chat.setMemberNickname(selectUser);
//		chat.setChatReceive(Integer.parseInt(sessionMemberNo));
//		ArrayList<Chat> chatAdminList = service.chatAdminList(chat);
//		return chatAdminList;
//	}
//	
//	// insert
//	@ResponseBody
//	@RequestMapping(value="/chatSend.do")
//	public int chatSend(Chat chat) {
//		int result = service.chatSend(chat);
//		return result;
//	}
	

	
}
